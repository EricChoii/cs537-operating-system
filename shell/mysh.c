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
struct NODE *head; 

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
      int count = 0;
      while (curr->tkns[count] != NULL) { free(curr->tkns[count++]); }
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
 * Remove alias from linkedlist
 * @param alias
 */
void removeAlias(char* alias)
{
  if (head == NULL)
    return;
  struct NODE *curr = head->next;
  struct NODE *prev = head;
  while (curr != NULL) {
    if (!strcmp(curr->alias, alias)) {
      removeFirst(prev);
      return;
    }
    prev = prev->next;
    curr = curr->next;	          
  }
  return;
}

/**
 * Display all aliases
 */
void getAliases()
{
  if (head == NULL)
    return;
  struct NODE *curr = head->next;
  while (curr != NULL) {
    int count = 0;
    char tokens[MAXLEN];
    memset(tokens, 0, sizeof(tokens)); // reset
    // concatenate alias and its tokens
    strcat(tokens, curr->alias);
    strcat(tokens, " ");
    while (curr->tkns[count] != NULL) {      
      if (count == 0)
	strcat(tokens, curr->tkns[count]);
      else
	strcat(strcat(tokens, " "), curr->tkns[count]);
      count++;
    }
    printf("%s\n", tokens);
    fflush(stdout);
    curr = curr->next;
  }
}

/**
 * Extract tokens from command line buffer
 * @param buf
 * @param tkns
 * @return 0: SUCCESS | 1: ERROR
 */
int GetTokens(char* buf, char* tkns[TOKEN]){
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
int OutRedirect(char* tkns[TOKEN]){
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
      if(execv(tkns[0], tkns) == -1){
	char str[MAXLEN];
	strcpy(str, tkns[0]);
	strcat(str, ": Command not found.\n");
	Print(str, STDERR_FILENO);
      }
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
 * Support alias/unalias services
 * @param tkns
 * @param type 0: unalias | 1: alias
 */
void AliasManager(char* tkns[TOKEN], int type)
{
  int tkns_size = 0;
  char* inv_alias_names[10] = { "alias", "unalias", "exit" };
  while (tkns[tkns_size] != NULL) { tkns_size++; }          
  if (type) {
    // alias
    if (tkns_size == 1)
      getAliases(); // display all aliases          
    else {
      int i = 0;
      while (inv_alias_names[i] != NULL) {
	if (!strcmp(tkns[1], inv_alias_names[i])) {	  
	  // invalid alias names
	  Print("alias: Too dangerous to alias that.\n", 2);
	  return;
	}
	i++;
      }
      struct NODE* node = findNode(head, tkns[1]); // search alias
      if (tkns_size == 2) {
	// alias followed by a word
	if (node != NULL) {
	  // alias-name exists
	  int count = 0;
	  char tokens[MAXLEN];
	  memset(tokens, 0, sizeof(tokens));
	  strcat(tokens, node->alias);
	  strcat(tokens, " ");
	  while (node->tkns[count] != NULL) {
	    if (count == 0)
	      strcat(tokens, node->tkns[count]);
	    else
	      strcat(strcat(tokens, " "), node->tkns[count]);
	    count++;
	  }
	  printf("%s\n", tokens);
	  fflush(stdout);
	}
      }
      else {
	if (node != NULL) {
	  // if alias already exist, then replace
	  int count = 0;
	  while (node->tkns[count] != NULL) { free(node->tkns[count]); node->tkns[count++] = 0; }
	  count = 0;
	  while (tkns[count+2] != NULL) {	   
	    node->tkns[count] = malloc(strlen(tkns[count+2]) + 1);	    	  
	    strcpy(node->tkns[count], tkns[count+2]);
	    count++;
	  }
	}      
	else
	  addFirst(head, tkns[1], (tkns+2)); // add new alias	
      }
    }
  } else {
    // unalias
    if (tkns_size != 2) {
      Print("unalias: Incorrect number of arguments.\n", 1);
      return;
    }
    removeAlias(tkns[1]);
  }
}

/**
 * INTERACTIVE MODE:
 * Get user input and run it
 * @return 0: SUCCESS | 1: ERROR
 */
int InterM() {
  // read user input
  while(1) {       
    char* tkns[TOKEN]; // shell command tokens
    char buf[MAXLEN]; // store user command  
    int buf_size = 0;
    Print("mysh> ", 1);    
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
    if (tkns[0] == NULL)
      continue; // empty string (i.e, "    ")
    // alias manager    
    int a = strcmp(tkns[0], "alias");    
    if (a == 0 || !strcmp(tkns[0], "unalias")) {      
      if (a == 0)
	AliasManager(tkns, 1); // alias
      else
	AliasManager(tkns, 0); // unalias
      continue;
    }
    // if alias, then replace tokens
    struct NODE* found = findNode(head, tkns[0]);
    if (found != NULL) {      
      int count = 0;
      while (found->tkns[count] != NULL) {
	tkns[count] = found->tkns[count];
	count++;
      }
      tkns[count] = NULL;
    }
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
    char buf[MAXLEN]; // store lines in file
    char* tkns[TOKEN]; // shell command tokens
    int buf_size = 0;    
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
    if (tkns[0] == NULL)
      continue; // empty string (i.e, "    ")
    //alias manager
    int a = strcmp(tkns[0], "alias");
    if (a == 0 || !strcmp(tkns[0], "unalias")) {
      if (a == 0)
    	AliasManager(tkns, 1); // alias
      else
    	AliasManager(tkns, 0); // unalias

      continue;
    }
    // if alias, then replace tokens
    struct NODE* found = findNode(head, tkns[0]);
    if (found != NULL) {
      int count = 0;
      while (found->tkns[count] != NULL) {
    	tkns[count] = found->tkns[count];
    	count++;
      }
      tkns[count] = NULL;
    }
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
  head = malloc(sizeof(struct NODE)); // Linked List 
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
