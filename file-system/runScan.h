#ifndef RUNSCAN_H
#define RUNSCAN_H

#include "read_ext2.h"

typedef struct inode_locate {
  int     ngroup;     // # group
  int     inode_no;   // inode number
  off_t   offset;     // offset of the inode table
} inode_loc;

int is_jpg(char *buffer);

int make_file_inode_path(int inode_n, char *outdir);

int make_file_filename_path(char *fn, char *outdir);

int get_inode(struct ext2_dir_entry *dir_entry, node **img_inodes, char *fn);

void jpg_inode(node **dirs, node **img_inodes, int disk_fd, char *outdir);

void jpg_filename(node **dirs, node **img_inodes, int disk_fd, char *outdir);

void copy_to_file(int jpg_fd, int disk_fd, struct ext2_inode *inode, int grp_idx);

void copy_direct_blocks(int n_blk, int disk_fd, int grp_idx, struct ext2_inode *inode, char *buffer, int img_fd, int blk_offset);

void copy_single_indirect(int sngl_arg, int disk_fd, int grp_idx, struct ext2_inode *inode, char *buffer, int img_fd, int blk_offset);

void copy_mult_indirect(int mlt_arg_1, int mlt_arg_2, int b_per_b, int disk_fd, int grp_idx, struct ext2_inode *inode, char *buffer, int img_fd, int blk_offset);

#endif
