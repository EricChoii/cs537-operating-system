#ifndef LL_H
#define LL_H

#include <stdlib.h>

struct Node {
  struct Node *next;
  void *data;
};

typedef struct Node node;

/**
 * @return Empty List
 */
struct Node **List();

/**
 * Add a new element to the linkedlist
 * @param head
 * @param idx    Position to Put Element
 * @param elem   Element to be Put
 * @param size   Element Size
 * @return 0: Success | 1: Error
 */
int push(struct Node **head, int idx, void *elem, size_t size);

/**
 * Remove the element from the linkedlist
 * @param head
 * @param idx    Position to Remove Element
 * @return 0: Success | 1: Error
 */
int pop(struct Node **head, int idx);

/**
 * Print the linkedlist
 * @param head
 * @param Function Pointer
 * @return Void
 */
void print(struct Node **head, void (*print)(void *));

/**
 * Clear the linkedlist
 * @param head
 * @param Function Pointer
 * @return Void
 */
void clear(struct Node **head, void (*clean)(void *));

/**
 * @param head
 * @return Length of the linkedlist
 */
int length(struct Node **head);

/**
 * Get an element in the linkedlist at the specified position
 * @param head
 * @param idx
 * @return Void
 */
void *get(struct Node **head, int idx);

#endif
