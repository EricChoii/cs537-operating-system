#include "types.h"
#include "stat.h"
#include "user.h"

#define BUFF_SIZE 0 // obsolete buffer size

// iostat struct in user mode
struct iostat {
    int readcount;
    int writecount;
};

/**
 * Main Function
 */
int
main(int argc, char **argv)
{
  // invalid command line
  if (argc != 3)
    exit();
  
  int r = atoi(argv[1]); // # read() call
  int w = atoi(argv[2]); // # write() call
  char buff[BUFF_SIZE];

  // read()
  while (r > 0) {
    read(-1, &buff, sizeof(*buff));
    r--;
  }
  // write()
  while (w > 0) {
    write(-1, &buff, sizeof(*buff));
    w--;
  }

  // create a dynamic iostat object
  struct iostat *iostat = malloc(sizeof(struct iostat));

  // load total # read() and write() from kernel
  printf(1, "%d ", getiocounts(iostat)); // -1: invalid iostat pointer, 0: success
  printf(1, "%d %d\n", iostat->readcount, iostat->writecount);

  free(iostat); // free memory
  exit();
}
