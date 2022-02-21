#include <stdio.h>
#include <stdlib.h>

/**
 * Node Struct
 */
struct NODE { 
  struct NODE *next;
  int data;
};

/**
 * Add node next to target node
 * @param target
 * @param data
 */
void addFirst(struct NODE *target, int data)
{
  struct NODE *newNode = malloc(sizeof(struct NODE));
  newNode->next = target->next;
  newNode->data = data;
  target->next = newNode;
}

/**
 * Remove node followed by target node
 * @param target
 */
void removeFirst(struct NODE *target)
{
  struct NODE *removeNode = target->next;
  target->next = removeNode->next;
  free(removeNode);
}

/**
 * Find node in the tree
 * @param node
 * @param data
 */
struct NODE *findNode(struct NODE *node , int data)
{
  if (node == NULL) 
    return NULL;
  struct NODE *curr = node->next;
  while(curr != NULL)
    {
      if(curr->data == data)
	return curr;
      curr = curr->next;
    }
  return NULL;
}
