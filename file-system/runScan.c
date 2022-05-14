#include <stdio.h>
#include <errno.h>
#include <sys/stat.h>
#include <dirent.h>

#include "ext2_fs.h"
#include "read_ext2.h"
#include "LinkedList.h"
#include "runScan.h"
#include "string.h"


/////////////////////////////////////////////////////////////////////////
// Notes
/////////////////////////////////////////////////////////////////////////

/*
  An ext2 disk image file a FS that we can mount.

  Two Arguments (runScan):
  1. input file containing disk image
  2. output directory

  First Part (Data):
  1. scan all inodes to reconstruct all jpg files:
      - those inodes represent regular files
      - check if the first data block of inode contains jpg magic numbers
  2. copy content of file to output file, using inode (i.e., output/file-18.jpg)

  Second Part (Filename):
  1. find out filenames of inodes representing jpg files:
      - filenames are stored in diredctory data blocks
  2. scan all directory data blocks to find corresponding filenames
  3. copy content of that file to output file using its actual name (i.e., output/bank-uwcu.jpg)

  Final Output:
  1. inode number file
  2. filename
*/


/////////////////////////////////////////////////////////////////////////
// Main Function
/////////////////////////////////////////////////////////////////////////

int main(int argc, char **argv) {
  if (argc != 3) {
    printf("expected usage: ./runscan inputfile outputfile\n");
    exit(0);
  }
  // create output directory
  if (mkdir(argv[2], S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
    if (errno == EEXIST)
      printf("the output directory %s already exists!\n", argv[2]);
    else
      printf("cannot create output directory %s with errno %d\n", argv[2], errno);
    exit(-1);
  }  
  // create locators
  node **dirs = List(); // directories
  node **img_inodes = List();

  // open disk image, then read super
  int disk_fd = open(argv[1], O_RDONLY);
  read_init_super_block(disk_fd); // init common variables
  struct ext2_super_block *super = malloc(sizeof(struct ext2_super_block));
  read_super_block(disk_fd, 0, super);

  // (i) Data Part
  // 1. find the inodes that represents jpgs
  // 2. write to outdir using inode numbers as file names
  jpg_inode(dirs, img_inodes, disk_fd, argv[2]);

  // (ii) Filename Part
  // 1. iterate through directories to find the actual filenames of the jpg files
  // 2. write them to outdir
  jpg_filename(dirs, img_inodes, disk_fd, argv[2]);

  // Free Memory
  close(disk_fd);
  free(super);
  clear(dirs, NULL);
  clear(img_inodes, NULL);
}


/////////////////////////////////////////////////////////////////////////
// Helper Functions
/////////////////////////////////////////////////////////////////////////

int is_jpg(char *buffer) {
  if (buffer[0] == (char)0xff &&
      buffer[1] == (char)0xd8 &&
      buffer[2] == (char)0xff &&
      (buffer[3] == (char)0xe0 ||
       buffer[3] == (char)0xe1 ||
       buffer[3] == (char)0xe8)) 
    {
      return 1;
    }
  return 0;
}

int make_file_inode_path(int inode_n, char *outdir) {
  char path[strlen(outdir) + 20];
  sprintf(path, "%s%s%d%s", outdir, "/file-", inode_n, ".jpg");
  int fd = open(path, O_CREAT | O_WRONLY, S_IRWXU);
  if (fd == -1) {
    printf("ERROR: make_file_inode_path: Cannot Open %s\n", path);
    exit(-1);
  }
  return fd;
}

int make_file_filename_path(char *fn, char *outdir) {
  char path[strlen(outdir) + 1 + strlen(fn) + 1];
  sprintf(path, "%s%s%s", outdir, "/", fn);
  int fd = open(path, O_CREAT | O_WRONLY, S_IRWXU);
  if (fd == -1) {
    printf("ERROR: make_file_filename_path: Cannot Open %s\n", path);
    exit(-1);
  }
  return fd;
}

void copy_to_file(int img_fd, int disk_fd, struct ext2_inode *inode, int grp_n) {   
  unsigned int block_n = (inode->i_size + 1023) / 1024;  
  int sub_block = block_size / 4; // sub-blocks of indirect blocks
  char *buffer = (char *) malloc(block_size);
  int sngl = 0, mlt = 0; // type of indirect blocks
  int sngl_arg = 0, mlt_arg_1 = 0, mlt_arg_2 = 0; // the offsets of indirect block
  int blk_offset = inode->i_size % block_size;
  if (block_n > EXT2_NDIR_BLOCKS) {
    sngl = 1;
    if (block_n > (unsigned) EXT2_NDIR_BLOCKS + sub_block + sub_block*sub_block) {
      printf("ERROR: image too big\n");
      return;
    } else if (block_n > (unsigned) EXT2_NDIR_BLOCKS + sub_block) {
      mlt = 1;
      int mlt_block_n = block_n - (EXT2_NDIR_BLOCKS + sub_block);
      sngl_arg = sub_block;
      mlt_arg_1 = (mlt_block_n - mlt_arg_2) / sub_block;
      mlt_arg_2 = mlt_block_n % sub_block;
    } else {
      mlt = 0;
      sngl_arg = block_n - EXT2_NDIR_BLOCKS;
    }
  }
 
  // copy the data of a file
  if (sngl == 0) {
    copy_direct_blocks(block_n, disk_fd, grp_n, inode, buffer, img_fd, blk_offset);
  } else if (mlt == 0) {
    copy_direct_blocks(EXT2_NDIR_BLOCKS, disk_fd, grp_n, inode, buffer, img_fd, block_size);
    copy_single_indirect(sngl_arg, disk_fd, grp_n, inode, buffer, img_fd, blk_offset);
  } else {
    copy_direct_blocks(EXT2_NDIR_BLOCKS, disk_fd, grp_n, inode, buffer, img_fd, block_size);
    copy_single_indirect(sub_block, disk_fd, grp_n, inode, buffer, img_fd, block_size);
    copy_mult_indirect(mlt_arg_1, mlt_arg_2, sub_block, disk_fd, grp_n, inode, buffer, img_fd, blk_offset);
  }
  free(buffer);
}

void copy_direct_blocks(int block_n, int disk_fd, int grp_n, struct ext2_inode *inode, char *buffer, int img_fd, int blk_offset) {
  for (unsigned int blk_idx = 0; blk_idx < (unsigned) block_n; ++blk_idx) {
    read_block(disk_fd, locate_group(grp_n), inode->i_block[blk_idx], buffer);
    unsigned write_size = (blk_idx == (unsigned) block_n - 1 ? (unsigned) blk_offset: block_size);    
    if (write(img_fd, buffer, write_size) == -1) {
      printf("ERROR: copy_direct_blocks: Cannot Write\n");
      exit(-1);
    }
  }
}

void copy_single_indirect(int sngl_arg, int disk_fd, int grp_n, struct ext2_inode *inode, char *buffer, int fd, int blk_offset) {
  int *sngl_dir = (int *) malloc(block_size);  
  read_block(disk_fd, locate_group(grp_n), inode->i_block[EXT2_NDIR_BLOCKS], (char *) sngl_dir);
  for (unsigned int blk_idx = 0; blk_idx < (unsigned) sngl_arg; ++blk_idx) {
    read_block(disk_fd, locate_group(grp_n), sngl_dir[blk_idx], buffer);
    unsigned write_size = (blk_idx == (unsigned) sngl_arg - 1 ? (unsigned) blk_offset : block_size);
    if (write(fd, buffer, write_size) == -1) {
      printf("ERROR: copy_single_indirect: Cannot Write\n");
      exit(-1);
    }
  }
  free(sngl_dir);
}

void copy_mult_indirect(int mlt_arg_1, int mlt_arg_2, int sub_block, int disk_fd, int grp_n, struct ext2_inode *inode, char *buffer, int fd, int blk_offset) {
  int *mlt_dir = (int *) malloc(block_size);
  int *sngl_dir = (int *) malloc(block_size);
  read_block(disk_fd, locate_group(grp_n), inode->i_block[EXT2_DIND_BLOCK], (char *) mlt_dir);
  for (unsigned int dir_idx = 0; dir_idx <= (unsigned) mlt_arg_1; ++dir_idx) {
    int block_n = (dir_idx == (unsigned) mlt_arg_1) ? mlt_arg_2 : sub_block;
    read_block(disk_fd, locate_group(grp_n), mlt_dir[dir_idx], (char *) sngl_dir);
    for (unsigned int blk_idx = 0; blk_idx < (unsigned) block_n; ++blk_idx) {
      read_block(disk_fd, locate_group(grp_n), sngl_dir[blk_idx], buffer);
      unsigned write_size = (dir_idx == (unsigned) mlt_arg_1 && 
			     blk_idx == (unsigned) block_n - 1 ? 
			     (unsigned) blk_offset : block_size);
      if (write(fd, buffer, write_size) == -1) {
	printf("ERROR: copy_mult_indirect: Cannot Write\n");
	exit(-1);
      }
    }
  }
  free(sngl_dir);
  free(mlt_dir);
}

void jpg_inode(node **dirs, node **img_inodes, int disk_fd, char *outdir) {
  // scan all the groups
  struct ext2_group_desc *grp = (struct ext2_group_desc *) malloc(sizeof(struct ext2_group_desc));
  for (unsigned int grp_n = 0; grp_n < n_groups; ++grp_n) {
    read_group_desc(disk_fd, grp_n, grp);
    off_t start_inode_table = locate_inode_table(grp_n, grp);
    // iterate through all the inodes in inode_table in the current group
    struct ext2_inode *inode = malloc(sizeof(struct ext2_inode));
    char *buffer = (char *) malloc(block_size);
    for (unsigned int ind_idx = 1; ind_idx <= itable_blocks * inodes_per_block; ++ind_idx) {
      read_inode(disk_fd, start_inode_table, (int) ind_idx, inode, grp_n);
      // whether dir or not
      if (!S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode)) {
	continue;
      } else if (S_ISDIR(inode->i_mode)) {
	if (inode->i_size > block_size)
	  continue;
	// put it into the directory locator
	inode_loc ind_loc = { .ngroup=grp_n, .offset=start_inode_table, .inode_no=ind_idx };
	push(dirs, 0, &ind_loc, sizeof(inode_loc));
      } else {
	int first_block_n = inode->i_block[0]; // first data block
	off_t start_grp = locate_group(grp_n);
	read_block(disk_fd, start_grp, first_block_n, buffer);
	if (is_jpg(buffer)) {
	  int inode_n = grp_n * (inodes_per_block * n_blk_per_group) + ind_idx;
	  push(img_inodes, 0, &inode_n, sizeof(int));
	  // write to the new file
	  int img_fd = make_file_inode_path(inode_n, outdir);
	  copy_to_file(img_fd, disk_fd, inode, grp_n);
	  close(img_fd);
	}
      }
    }
    free(inode);
    free(buffer);
  }
}

void jpg_filename(node **dirs, node **img_inodes, int disk_fd, char *outdir) {  
  node *dir_iterator = *dirs;
  inode_loc *dir_loc;
  struct ext2_group_desc *grp = (struct ext2_group_desc *) malloc(sizeof(struct ext2_group_desc));
  struct ext2_inode *dir = (struct ext2_inode *) malloc(sizeof(struct ext2_inode));
  struct ext2_inode *inode = (struct ext2_inode *) malloc(sizeof(struct ext2_inode));
  struct ext2_dir_entry *dir_entry;
  char dir_content[block_size];
  char *dir_content_curser;
  while (dir_iterator != NULL) {    
    dir_loc = (inode_loc *) dir_iterator->data;
    read_group_desc(disk_fd, dir_loc->ngroup, grp);
    read_inode(disk_fd, dir_loc->offset, dir_loc->inode_no, dir, dir_loc->ngroup);
    read_block(disk_fd, locate_group(dir_loc->ngroup), dir->i_block[0], dir_content);
    dir_entry = (struct ext2_dir_entry *) dir_content;
    dir_content_curser = dir_content;
    while (dir_content_curser - dir_content < dir->i_size) {
      // whether inode found in the image inodes list
      char fn[256] = "";
      get_inode(dir_entry, img_inodes, fn);      
      if (strlen(fn) != 0) {
	int img_fd = make_file_filename_path(fn, outdir);
	read_inode(disk_fd, locate_inode_table(dir_loc->ngroup, grp), dir_entry->inode, inode, dir_loc->ngroup);
	copy_to_file(img_fd, disk_fd, inode, dir_loc->ngroup);
	close(img_fd);
      }
      dir_content_curser += (8 + (dir_entry->name_len % 4 == 0 ? dir_entry->name_len : (dir_entry->name_len/4 + 1) * 4));
      dir_entry = (struct ext2_dir_entry *) dir_content_curser;
    }
    dir_iterator = dir_iterator->next;
  }
  free(inode);
  free(dir);
  free(grp);
}

int get_inode(struct ext2_dir_entry *dir_entry, node **img_inodes, char *fn) {
  int idx = 0; 
  node *iterator = *img_inodes;
  while (iterator != NULL) {
    unsigned inode_n = *(unsigned *) iterator->data;
    if (inode_n == dir_entry->inode) {   
      strncpy(fn, dir_entry->name, dir_entry->name_len);
      fn[dir_entry->name_len] = 0;
      pop(img_inodes, idx);
      return 1;
    }
    iterator = iterator->next;
    idx ++;
  }
  return 0;
}
