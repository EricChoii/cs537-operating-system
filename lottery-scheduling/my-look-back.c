#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_LEN 255 // line length [0, 255]

/**
 * Print a utility message, then exit(0)
 */
void UtilityInfo() {
  printf("my-look from CS537 Spring 2022\n");
  exit(0);
}

/**
 * Print a message about this software, then exit(0)
 */
void Help() {
  printf("search for line(s) with the prefix in a file\n");
  exit(0);
}

/**
 * Print an error message for invalid command lines,
 * then terminate the program with a code 1
 */
void InvalidCommandLine() {
  printf("my-look: invalid command line\n");
  exit(1);
}

/**
 * Check if the character is an alphabet or not
 * @praram ch
 * @return 1: alphabet, 0: non-alphabet
 */
int my_isalpha(int ch) {
  if (ch >= 65 && ch <= 90) // ASCII 65 ~ 90 (A ~ Z)
    return 1;
  else if (ch >= 97 && ch <= 122) // ASCII 97 ~ 122 (a ~ z)
    return 1;
  return 0;
}

/**
 * Strip non-alphabetical characters from the string
 * @praram char* str
 * @return char buff[MAX_LEN]
 */
char* GetAlpha(char* str) {
  static char buff[MAX_LEN];
  int i = 0;
  
  while(*str) {
    if(my_isalpha(*str)) {
      buff[i++] = *str;
    }
    str++;
  }
  buff[i] = '\0'; // to avoid memory leak
  return buff;
}

/**
 * Search line(s) with a prefix from a file
 * @param file
 * @param prefix
 * @return 0: success, 1: error
 */
int Search(char* file, char* prefix) {
  FILE *fp = fopen(file, "r");
  if (fp == NULL) {
    // file not found
    printf("my-look: cannot open file\n");
    return 1;
  }

  char line[MAX_LEN];
  while (fgets(line, MAX_LEN, fp) != NULL){
      if (line == NULL)	
	  break;
      
      // compare
      if (!strncasecmp(GetAlpha(line), prefix, strlen(prefix)))
	printf("%s", line);
  }
  fclose(fp);
  return 0;
}

/**
 * Request a user input and check if matched with the parameter.
 * If so, echo the user input, otherwise ignore it
 * @praram prefix
 * @return
 */
void GetUserInput(char* prefix) {
  char line[MAX_LEN];
  while (fgets(line, MAX_LEN, stdin)) {
    if (!strncasecmp(GetAlpha(line), prefix, strlen(prefix)))
      printf("%s", line);
  }
}

/**
 * Main Function
 */
int main(int argc, char** argv) {
  // no argument at all
  if (argc == 1)
    InvalidCommandLine();
  
  int co; // command option
  int c = 1; // command option counter
  char* file = NULL;
  char* prefix = NULL; // assume it is an alphabet (given in the assignment)
  while ((co = getopt(argc, argv, "fhV")) != -1) {
    switch (co) {
    case 'V': UtilityInfo(); break;
    case 'h': Help(); break;
    case 'f':
      // more or less than two args after 'f'
      if (argc - 1 - c != 2)
	InvalidCommandLine();
      
      // save file
      file = argv[c + 1];
      break;
    default: InvalidCommandLine(); break;
    }
    c++;
  }
  // '-f' not specified and arguments > 2
  if (file == NULL && argc > 2)
    InvalidCommandLine();
  
  // save prefix
  prefix = argv[argc - 1];

  // if prefix starts with '-' (must be option)
  if (prefix[0] == '-')
    InvalidCommandLine();

  // no argument specified
  if (file == NULL){
    GetUserInput(prefix);
    exit(0);
  } else
    exit(Search(file, prefix));
}
