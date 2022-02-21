#include <fcntl.h>
#include <unistd.h>
#include <ctype.h>
#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <sys/types.h>
#include "linkedlist.c"
#define MAXLINE 512
#define MAXLEN 4096
#define TOKEN 100

// STRUCT
struct NODE *head; // Linked List

// EVENT HANDLER
void INThandler(int); // Ctrl-C Event Handler

/**
 * Free memory of all nodes in linked list
 * @param head
 */
void FreeLinkedList(struct NODE *head) {
  if (head == NULL)
    return;
  if (head->next != NULL) {
    struct NODE *curr = head->next;
    while(curr !=NULL) {
      struct NODE *next = curr->next;
      free(curr);
      curr = next;
    }
  }
  free(head);
}

/**
 * Print out a message using write()
 * @param str
 * @param opt    0: STDIN | 1: STDOUT | 2: STDERR
 */
void Print(char* str, int opt) {
  write(opt, str, strlen(str));
}

/**
 * Remove whitespaces on each side of the string
 * @param out    Output
 * @param len    Length of output
 * @param str    To be trimmed 
 * @return out_size    Size of trimmed string
 */
size_t Trim(char *out, size_t len, const char *str)
{
  if(len == 0)
    return 0;
  const char *end;
  size_t out_size;
  // trim front
  while(isspace(*str)) str++;
  if(*str == 0) {
    // empty string
    *out = 0;
    return 1;
  }
  // trim back
  end = str + strlen(str) - 1;
  while(end > str && isspace(*end)) end--;
  end++;
  // assign output size
  out_size = (end - str) < len-1 ? (end - str) : len-1;
  // copy memory and add NULL
  memcpy(out, str, out_size);
  out[out_size] = 0;
  return out_size;
}

/**
 * Extract tokens from command line
 * @param buf
 * @param tkns
 * @return 0: SUCCESS | 1: ERROR
 */
int GetTokens(char* buf, char* tkns[MAXLEN]){
  const char delimiters[] = " \t";
  char* args = strtok(buf, delimiters);
  int i = 0;
  while (args != NULL){
    if (i > TOKEN-2){
      // # tokens > TOKEN      
      Print("Error: Too Many Tokens", 1);
      return 1;
    }
    tkns[i++] = args;
    args = strtok(NULL, delimiters);
  }
  tkns[i] = NULL;
  return 0;
}

/**
 * Change file descriptor from STDOUT to file, if necessary
 * @param tkns
 * @return 0: SUCCESS | 1: ERROR
 */
int OutRedirect(char *tkns[TOKEN]){
  int start = 0; // index of the first '>' in tokens
  int eflg = 0; // error flag
  int isRd = 0; // redirection check
  int isSpcl = 0; // speical case (i.e., "/bin/ls >filename")
  int fd; // file descriptor
  int i = 0;
  char* fn = NULL;
  char* suffix = NULL; // i.e., "/bin/echo suffix> output"

  // iterate through tokens
  while (tkns[i] != NULL){
    // redirection misformatted
    if (isSpcl || (isRd && (i-start > 1))) {
      // i.e., "/bin/ls >file name", "/bin/ls > file name"
      eflg = 1; break;    
    }
    if (strchr(tkns[i], '>') != NULL) {
      // command starts with '>' or multiple '>' in "different" tokens
      if (i == 0 || isRd) {
	// i.e., "> file.txt", "/bin/ls > >"	
	isRd = 1; eflg = 1; break;
      }
      char* r = NULL; // right side of '>'
      char* l = strtok_r(tkns[i], ">", &r); // left side of '>'
      // if nth on the left, then perform right-side test only
      if (tkns[i][0] == '>') { r = l; l = NULL; }
      // i.e., "suffix>"
      if (l != NULL) {
	if (strcmp(l, "") != 0)
	  suffix = l; // save suffix
      }
      // i.e., ">filename"
      if (r != NULL) {
	// multiple '>' in a "single" token
	if (strchr(r, '>') != NULL) { eflg = 1; isRd = 1; break; }
	// save filename
	if (strcmp(r, "") != 0) { fn = r; isSpcl = 1; }
      }
      // redirection problem
      if (!isRd)
	isRd = 1;
      start = i;
    }
    i++;
  }
  // not redirection problem
  if (!isRd)
    return 0;
  // redirection misformatted
  if (eflg || i + isSpcl - start == 1) {
    Print("Redirection misformatted.\n", STDERR_FILENO);
    return 1;
  }
  // filename saved in different token from one having '>'
  if (!isSpcl)
    fn = tkns[start+1];
  // get access to file
  if(fn[strlen(fn)-1] == '/' || (fd = open(fn, O_RDWR | O_CREAT | S_IROTH, 0644)) == -1) {
    // no permission or directory
    char str[255];
    strcpy(str, "Cannot write to file ");
    strcat(strcat(str, fn), ".\n");
    Print(str, STDERR_FILENO);
    return 1;
  }
  fclose(fopen(fn, "w")); // clear contents of file
  dup2(fd, STDOUT_FILENO); // change file descriptor
  close(fd);

  // update tokens
  tkns[start] = suffix;
  tkns[start+1] = NULL;
  return 0;
}

/**
 * Create a new process space, and parent process should wait for it to be done
 * @param tkns
 * @param fp
 * @return 0: SUCCESS | 1: ERROR | 2: SUCCESS (parent)
 */
int Process(char* tkns[TOKEN], FILE* fp){
  pid_t pid;
  int pstat; // process status
  
  pid = fork(); // new process space
  switch (pid) {
  case -1:
    perror("Cannot Fork");
    return 1;
  case 0:
    // child process
    // change file descriptor if necessary (1: ERROR)
    if (!OutRedirect(tkns)){    
      // execute command
      if(execv(tkns[0], tkns) == -1)
	Print(strcat(tkns[0], ": Command not found.\n"), STDERR_FILENO);            
    }
    // free memory, then move to the next line   
    if (fp != NULL) 
      fclose(fp);
    FreeLinkedList(head);
    _exit(1);
  default:
    // parent process
    waitpid(pid, &pstat, 0); // wait for child to be done
    return 2;
  }
}

/**
 * INTERACTIVE MODE:
 * Get user input and run it
 * @return 0: SUCCESS | 1: ERROR
 */
int InterM() {
  char buf[MAXLEN]; // store user command
  char* tkns[TOKEN]; // shell command tokens

  // read user input
  while(1){
    int buf_size = 0;
    Print("mysh> ", 1);
    memset(buf, 0x00, MAXLEN); // reset buffer

    // get user input
    if (fgets(buf, MAXLEN, stdin) == NULL)
      break; // Ctrl+D                
    buf_size = strlen(buf) - 1;

    // if characters > 512, then skip
    if (buf_size > MAXLINE){
      Print("Error: Too Many Characters", 1);
      continue;
    }
    buf[buf_size] = 0x00; // remove '\n'    
    char tbuf[MAXLEN]; // trim buffer
    Trim(tbuf, MAXLEN, buf);
    int tbuf_size = strlen(tbuf) - 1;

    // new line only (i.e., " \n", "\n", "\t  \n  ")
    if (tbuf_size == 0 && tbuf[tbuf_size] == '\n')
      continue; // N/A    
    // exit    
    if (!strcmp("exit", tbuf))
      break;
    // get tokens from buffer
    if (GetTokens(buf, tkns))
      return 1; // # tokens > TOKEN

    // create new process space
    int res = Process(tkns, NULL); // res = 2 (parent process)
    if (res != 2)
      return res; // child process
  }
  return 0;
}

/**
 * BATCH MODE:
 * Read lines in file, then run them on new process
 * @param fn
 * @result 0: SUCCESS | 1: ERROR
 */
int BatchM(char* fn) {
  char buf[MAXLEN]; // store lines in file
  char* tkns[TOKEN]; // shell command tokens
  FILE* fp;

  // file not found
  if ((fp = fopen(fn, "r")) == NULL) {
    char str[255];
    strcpy(str, "Error: Cannot open file ");
    strcat(str, fn);
    strcat(str, ".\n");    
    Print(str, STDERR_FILENO);    
    return 1;
  }

  // read through file contents
  while (!feof(fp)) { // EOF
    int buf_size = 0;
    memset(buf, 0x00, MAXLEN); // reset buffer
    if (fgets(buf, MAXLEN, fp) == NULL)      
      break; // Ctrl+D    
    buf_size = strlen(buf) - 1;

    // if characters > 512, then skip
    if (buf_size > MAXLINE) {
      char* line = (char*)malloc(sizeof(char) * (MAXLINE + 1)); // +1 for extra null character
      strncpy(line, buf, MAXLINE); // copy the first 512 characters
      line[MAXLINE] = '\0';
      Print(strcat(line, "\n"), 1); // echo command
      Print("Error: Too Many Characters", 1);
      free(line);
      continue; // next line
    }
    Print(buf, 1); // echo command   
    buf[strlen(buf)-1] = 0x00; // remove '\n'
    char tbuf[MAXLEN]; // trim buffer
    Trim(tbuf, MAXLEN, buf);
    int tbuf_size = strlen(tbuf) - 1;

    // new line only (i.e., " \n", "\n", "\t  \n  ")
    if (tbuf_size == 0 && tbuf[tbuf_size] == '\n')
      continue; // N/A
    // exit    
    if (!strcmp("exit", tbuf))
      break;    
    // get tokens from buffer
    if (GetTokens(buf, tkns))
      return 1; // # tokens > TOKEN

    // create new process space
    int res = Process(tkns, fp);
    if (res != 2) {
      // child process
      fclose(fp);
      return res;
    }
  }
  fclose(fp);
  return 0;
}

/**
 * Main Function:
 * Interactive or Batch Mode, contingent on user input
 * Get exit code from mode function
 * Free linked list before exit
 * @param argc
 * @param argv
 * @return 0: SUCCESS | 1: ERROR
 */
int main(int argc, char **argv)
{
  int res = 0; // exit code
  
  // initialize linked list
  head = malloc(sizeof(struct NODE));
  head->next = NULL;

  // keyboard signal event handler
  signal(SIGINT, INThandler);
  
  switch (argc) {
  case 1:
    // INTERACTIVE
    res = InterM();    
    break;
  case 2:
    // BATCH       
    res = BatchM(argv[1]); // pass filename
    break;
  default:
    //SYNTAX ERROR
    Print("Usage: mysh [batch-file]\n", STDERR_FILENO);
    res = 1;
    break;
  }
  // Free Linked List
  FreeLinkedList(head);
  return res;
}

/**
 * Ctrl-C Event Handler:
 * Free memory for global variables
 * @param signo
 */
void INThandler(int signo) {
  // free memory
  FreeLinkedList(head);
  exit(1);
}
