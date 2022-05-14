#include "LinkedList.h"
#include <unistd.h>

struct Node **List() {
  struct Node **head = (struct Node **) malloc(sizeof(struct Node *));
  *head = NULL;
  return head;
}

int push(struct Node **head, int idx, void *elem, size_t size) {
  struct Node *new_node = (struct Node *) malloc(sizeof(struct Node));
  new_node->data = malloc(size);
  char *dp = (char *) elem;
  char *node_dp = (char *) new_node->data;
  for (unsigned long i = 0; i < size; ++i) *node_dp++ = *dp++;  
  struct Node *curr = *head;
  if (idx < -1) return 1;
  // add to the end
  if (idx == -1) {
    new_node->next = NULL;
    if (length(head) == 0) *head = new_node;
    while (curr) {
      if (curr->next == NULL) break;
      curr = curr->next;
    }
    curr->next = new_node;
    return 0;
  }
  
  // add to the specified position
  int sc = 0;
  struct Node *prev = NULL;  
  while (curr && sc < idx) {
    prev = curr;
    curr = curr->next;
    sc++;
  }
  if (sc < idx) return 1;
  new_node->next = curr;
  if (prev == NULL) *head = new_node;
  else prev->next = new_node;
  return 0;
}

int pop(struct Node **head, int idx) {
  struct Node *curr = *head;
  if (idx < -1) return 1;
  struct Node *prev = NULL;
  // remove the last element
  if (idx == -1) {
    if (length(head) == 0) return 1;
    while (curr) {
      if (curr->next == NULL) break;
      prev = curr;
      curr = curr->next;
    }
    free(curr->data);
    free(curr);
    if (prev == NULL) *head = NULL;
    else prev->next = NULL;
    return 0;
  }
  
  // remove an element at the specified position
  int sc = 0;
  while (sc < idx) {
    prev = curr;
    curr = curr->next;
    sc++;
    if (curr == NULL) return 1;
  }
  if (prev == NULL) *head = curr->next;
  else prev->next = curr->next;
  free(curr->data);
  free(curr);
  return 0;
}

void *get(struct Node **head, int idx) {
  struct Node *curr = *head;
  if (idx < -1) return NULL;
  // get the last element
  if (idx == -1) {
    if (length(head) == 0) return NULL;
    while (curr) {
      if (curr->next == NULL) break;
      curr = curr->next;
    }
    return curr->data;
  }  
  // get an element at the specified position
  int sc = 0;
  while (sc < idx) {
    curr = curr->next;
    sc ++;
    if (curr == NULL) return NULL;
  }
  return curr->data;
}

int length(struct Node **head) {
  if (*head == NULL) return 0;
  struct Node *curr = *head;
  int c = 0;
  while (curr) {
    curr = curr->next;
    c++;
  }
  return c;
}

void print(struct Node **head, void (*print)(void *)) {
  if (*head == NULL) return;
  struct Node *curr = *head;
  while (curr) {
    (*print)(curr->data);
    curr = curr->next;
  }
}

void clear(struct Node **head, void (*clean)(void *)) {
  while (*head) {
    if (clean != NULL) clean(get(head, 0));
    pop(head, 0);
  }
  free(head);
}
