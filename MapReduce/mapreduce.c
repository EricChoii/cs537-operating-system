#include "mapreduce.h"
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#define NUM_MAPS 1024

//////////////////////////////////////////////////////////////////////////////////
// Global Variables
//////////////////////////////////////////////////////////////////////////////////

int counter; // Number of Files
int NUM_REDUCER;
int NUM_FILES;
char** file_names; // File List

Partitioner partitioner;
Mapper map;
Reducer reducer;

pthread_mutex_t fileLock;

typedef struct __v_node{
  char* value;
  struct __v_node* next;
} v_node;
typedef struct __k_node{
  char* key;
  v_node* head;
  struct __k_node* next;
} k_node;
typedef struct __k_table {
  k_node* head;
  pthread_mutex_t lock; // Key Lock
} k_table;
typedef struct __p_table{
  k_table map[NUM_MAPS];
  int key_num; // Number of Keys
  int curr_visit; // Count # Dup. Keys
  pthread_mutex_t lock; // Partition Lock
  k_node* sorted; // Quick Sort
} p_table;
p_table hm[64];

//////////////////////////////////////////////////////////////////////////////////
// Functions
//////////////////////////////////////////////////////////////////////////////////

/**
 * HashMap Initialization
 * @param argc
 * @param argv
 * @param mapper
 * @param num_reducers
 * @param partition
 * @param reducer_arg
 * @result Void
 */
void init(int argc, char* argv[], Mapper mapper, int num_reducers, Partitioner partition, Reducer reducer_arg) {  
  // if fileLock free
  assert(pthread_mutex_init(&fileLock, NULL) == 0);
  // assignment
  counter = 0;
  partitioner = partition;
  NUM_REDUCER = num_reducers;

  NUM_FILES = argc - 1;
  file_names = (argv + 1);
  map = mapper;
  reducer = reducer_arg;

  // hash initialization
  for (int i = 0; i < NUM_REDUCER; i++){
    pthread_mutex_init(&hm[i].lock, NULL);
    hm[i].key_num = 0;
    hm[i].curr_visit = 0;
    hm[i].sorted = NULL;
    for (int j = 0; j < NUM_MAPS; j++){
      hm[i].map[j].head = NULL;
      pthread_mutex_init(&hm[i].map[j].lock, NULL);
    } 
  }
}

/**
 * Get Next Value of a HashMap Partition
 * @param *key
 * @param partition_number
 * @result Value
 */
char* get_func(char *key, int partition_number){
  k_node* arr = hm[partition_number].sorted;
  char* value;
  while(1){
    int curr = hm[partition_number].curr_visit;
    if (strcmp(arr[curr].key, key) == 0){
      if (arr[curr].head == NULL)
	return NULL;
      v_node* temp = arr[curr].head->next;
      value = arr[curr].head->value;
      //free(arr[curr].head -> value);
      //free(arr[curr].head);
      arr[curr].head = temp;
      return value;
    } else {
      //free(arr[curr].key);
      //free(&arr[curr]);
      hm[partition_number].curr_visit++;
      continue;
    }
    return NULL;
  }
}


/**
 * Mapping Process Helper
 * @param *arg
 * @result Void
 */
void* Map_thread(void* arg){
  for (;;){
    char* filename;
    pthread_mutex_lock(&fileLock);
    if(counter >= NUM_FILES){
      pthread_mutex_unlock(&fileLock);
      return NULL;
    }
    filename = file_names[counter++];
    pthread_mutex_unlock(&fileLock);
    (*map)(filename);
  }
}

/**
 * Compare Keys Passed in
 * @param *a
 * @param *b
 * @result Comparison
 */
int compareKey(const void* a, const void* b){
  char* n1 = ((k_node*)a)->key;
  char* n2 = ((k_node*)b)->key;
  return strcmp(n1, n2);
}

/**
 * Reducing Process Helper
 * @param *arg1
 * @result NULL
 */
void* Reduce_thread(void* arg1){
  int partition_number = *(int*)arg1;
  free(arg1); 
  arg1 = NULL;
  if(hm[partition_number].key_num == 0)
    return NULL;  
  hm[partition_number].sorted = malloc(sizeof(k_node)*hm[partition_number].key_num);
  int count = 0;
  for (int i = 0; i < NUM_MAPS; i++){
    k_node *curr = hm[partition_number].map[i].head;
    if (curr == NULL)
      continue;
    while (curr != NULL){
      hm[partition_number].sorted[count] = *curr;
      count++;
      curr = curr->next;
    }
  }
    
  qsort(hm[partition_number].sorted, hm[partition_number].key_num, sizeof(k_node), compareKey);
   
  for (int i = 0; i < hm[partition_number].key_num; i++){
    char *key = hm[partition_number].sorted[i].key;
    (*reducer)(key,get_func,partition_number);
  }

  //free the data on heap
  for (int i = 0; i < NUM_MAPS; i++){
    k_node *curr = hm[partition_number].map[i].head;
    if (curr == NULL)
      continue;
    while (curr != NULL){
      free(curr->key);
      curr->key = NULL;
      v_node* vcurr = curr->head;
      while (vcurr != NULL){
	free(vcurr->value);
	vcurr->value = NULL;
	v_node* temp = vcurr->next;
	free(vcurr);
	vcurr = temp;
      }
      vcurr = NULL;
      k_node* tempK = curr->next;
      free(curr);
      curr = tempK;
    }
    curr = NULL;
  }
  free(hm[partition_number].sorted);
  hm[partition_number].sorted = NULL;

  return NULL;
}

/**
 * MR_Emit
 * @param *key
 * @param *value
 * @result Void
 */
void MR_Emit(char *key, char *value){    
  unsigned long partition_number = (*partitioner)(key, NUM_REDUCER);
  unsigned long map_number = MR_DefaultHashPartition(key, NUM_MAPS);
  pthread_mutex_lock(&hm[partition_number].map[map_number].lock);
  k_node* temp = hm[partition_number].map[map_number].head;
  while(temp != NULL){
    if (strcmp(temp->key, key) == 0){
      break;
    }
    temp = temp->next;
  }
    
  // create a value node
  v_node* new_v = malloc(sizeof(v_node));
  if (new_v == NULL) {
    perror("malloc");
    pthread_mutex_unlock(&hm[partition_number].map[map_number].lock);
    return; // fail
  } 
  new_v->value = malloc(sizeof(char)*20);
  if (new_v->value == NULL)
    printf("ERROR: Malloc For Value");
  strcpy(new_v->value, value);
  new_v->next = NULL;
  //if there is no existing node for same key
  if (temp == NULL){
    k_node *new_key = malloc(sizeof(k_node));
    if (new_key == NULL) {
      perror("malloc");
      pthread_mutex_unlock(&hm[partition_number].map[map_number].lock);
      return; // fail
    }
    new_key->head = new_v;
    new_key->next = hm[partition_number].map[map_number].head;
    hm[partition_number].map[map_number].head = new_key;
        
    new_key->key = malloc(sizeof(char)*20);
    if (new_key->key == NULL)
      printf("ERROR: Malloc For Value");
    strcpy(new_key->key, key);
    pthread_mutex_lock(&hm[partition_number].lock);
    hm[partition_number].key_num++;
    pthread_mutex_unlock(&hm[partition_number].lock);

  } else {
    //if there is existing node for same key
    new_v->next = temp->head;
    temp->head = new_v;
  }

  pthread_mutex_unlock(&hm[partition_number].map[map_number].lock);
}

/**
 * Compute and Return a Hash Value
 * @param *key
 * @param *num_partitions
 * @result Hash Value
 */
unsigned long MR_DefaultHashPartition(char *key, int num_partitions){
  unsigned long hash = 5381;
  int c;
  while ((c = *key++) != '\0')
    hash = hash * 33 + c;
  return hash % num_partitions;
}

//////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////

/**
 * Main Function
 * @param argc
 * @param *argv[]
 * @result Void
 */
void MR_Run(int argc, char *argv[], 
	    Mapper map, int num_mappers, 
	    Reducer reduce, int num_reducers, 
	    Partitioner partition){

  init(argc, argv, map, num_reducers, partition, reduce);

  // create map threads
  pthread_t mapthreads[num_mappers];
  for (int i = 0; i < num_mappers; i++){
    pthread_create(&mapthreads[i], NULL, Map_thread, NULL);
  }

  // join waits for the threads to finish
  for (int k = 0; k < num_mappers; k++){
    pthread_join(mapthreads[k], NULL);
  }

  // create reduce threads
  pthread_t reducethreads[num_reducers];
  for (int j = 0; j < num_reducers; j++){
    void* arg = malloc(4);
    *(int*)arg = j;
    pthread_create(&reducethreads[j], NULL, Reduce_thread, arg);
  }

  for (int m = 0; m < num_reducers; m++){
    pthread_join(reducethreads[m], NULL);
  }
}
