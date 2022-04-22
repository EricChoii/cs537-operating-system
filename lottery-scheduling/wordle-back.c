#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LEN 256 // [0, 255]

/**
 * Print the required error message,then exit with status code 1
 */
void InvalidNumArg() {
  printf("wordle: invalid number of args\n");
  exit(1);
}

/**
 * Main Function
 */
int main(int argc, char **argv) {
  // invalid command line arguments
  if (argc != 3)
    InvalidNumArg();
  
  char line[MAX_LEN];
  char* fn = argv[argc - 2]; // filename
  char* t = argv[argc - 1]; // target

  FILE *fp = fopen(fn, "r");
  if (fp == NULL) {
    // file not found
    printf("wordle: cannot open file\n");
    return 1;
  }

  // iterate the file and print out
  // lines without any of the target characters
  while (fgets(line, MAX_LEN, fp) != NULL) {
    // end of file
    if (line == NULL)
      break;
    // not five-letter word
    if (strlen(line) - 1 != 5)
      continue;

    char c; // a target character
    int flag = 0; // 1: skip, 0: print out
    int i = 0;
    while ((c = *(t + i++)) != '\0') {      
      if (strchr(line, c) != NULL) {
	// a target character exists
	flag = 1; // skip this line
	break;
      }
    }

    // if no target in this line, then print it out
   if (!flag)
      printf("%s", line);   
  }

  fclose(fp);

  return 0;
}
