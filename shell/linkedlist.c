#include <stdio.h>
#include <stdlib.h>
#define MAXLEN 4096

/**
 * Node Struct
 */
struct NODE { 
  struct NODE *next;
  char alias[MAXLEN];
  char* tkns[MAXLEN];
};

/**
 * Add node next to target node
 * @param target
 * @param alias
 * @param tkns
 */
void addFirst(struct NODE *target, char* alias, char* tkns[MAXLEN])
{
  int count = 0;
  struct NODE* newNode = malloc(sizeof(struct NODE));
  memset(newNode, 0, sizeof(struct NODE));
  newNode->next = target->next;  
  strcpy(newNode->alias, alias);
  while (tkns[count] != NULL) {
    newNode->tkns[count] = malloc(strlen(tkns[count]) + 1);
    strcpy(newNode->tkns[count], tkns[count]);
    count++;
  }
  target->next = newNode;
}

/**
 * Remove node followed by target node
 * @param target
 */
void removeFirst(struct NODE *target)
{
  struct NODE *removeNode = target->next;
  int count = 0;
  while (removeNode->tkns[count] != NULL) { free(removeNode->tkns[count++]); }
  target->next = removeNode->next;
  free(removeNode);
}

/**
 * Find node in the tree
 * @param node
 * @param alias
 */
struct NODE *findNode(struct NODE *head , char* alias)
{
  if (head == NULL) 
    return NULL;
  struct NODE *curr = head->next;
  while(curr != NULL)
    {
      if(!strcmp(curr->alias, alias))
	return curr;	  
      curr = curr->next;
    }
  return NULL;
}
