#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <wait.h>
#include <pthread.h>

int item_to_produce;
// curr_buf_size;
pthread_mutex_t m_item_to_prod = PTHREAD_MUTEX_INITIALIZER;
int total_items, max_buf_size, num_workers, num_masters;

int start;
pthread_cond_t c_start = PTHREAD_COND_INITIALIZER;
pthread_mutex_t m_start = PTHREAD_MUTEX_INITIALIZER;

int prod_ended;
pthread_cond_t c_prod_ended = PTHREAD_COND_INITIALIZER;
pthread_mutex_t m_prod_ended = PTHREAD_MUTEX_INITIALIZER;


int *buffer;
// no lock for buffer

int *empty_queue, *filled_queue;
int front_eq, end_eq, front_fq, end_fq, sz_eq, sz_fq;
pthread_mutex_t m_fq = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t m_eq = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t c_fq_empty = PTHREAD_COND_INITIALIZER;
pthread_cond_t c_eq_empty = PTHREAD_COND_INITIALIZER;


void print_produced(int num, int master) {
  printf("Produced %d by master %d\n", num, master);
}

void print_consumed(int num, int worker) {
  printf("Consumed %d by worker %d\n", num, worker);
}

void *master_function(void* myid){

    int thread_id = *((int *)myid);

    pthread_mutex_lock(&m_start);
      while(start==0) pthread_cond_wait(&c_start, &m_start);
    pthread_mutex_unlock(&m_start);

    int e_pos;  // empty_pos
    int i_prod; // item to produce
    while(1){
        int prod_ended_info;
        pthread_mutex_lock(&m_prod_ended);
          prod_ended_info = prod_ended;
        pthread_mutex_unlock(&m_prod_ended);

        if(prod_ended_info==1) break;

        pthread_mutex_lock(&m_eq);

          while(sz_eq==0) pthread_cond_wait(&c_eq_empty, &m_eq);  // no place to write
          e_pos = empty_queue[front_eq];
          front_eq = (front_eq+1)%max_buf_size;
          sz_eq--;
          if(sz_eq!=0) pthread_cond_signal(&c_eq_empty); // signal other master thread if there are more empty pos

        pthread_mutex_unlock(&m_eq);

        pthread_mutex_lock(&m_item_to_prod);
          i_prod = item_to_produce;
          item_to_produce++;
        pthread_mutex_unlock(&m_item_to_prod);


        buffer[e_pos] = i_prod;
        print_produced(i_prod, thread_id);

        pthread_mutex_lock(&m_fq);

          filled_queue[end_fq] = e_pos;
          end_fq = (end_fq+1)%max_buf_size;
          sz_fq++;

          if(i_prod == total_items){
              pthread_mutex_lock(&m_prod_ended);
              prod_ended  = 1;
              pthread_mutex_unlock(&m_prod_ended);
          }

          if(sz_fq!=0) pthread_cond_signal(&c_fq_empty);

        pthread_mutex_unlock(&m_fq);

    }
    return NULL;
}
void *worker_function(void* myid){

    int thread_id = *((int *)myid);

    pthread_mutex_lock(&m_start);
      while(start==0) pthread_cond_wait(&c_start, &m_start);
    pthread_mutex_unlock(&m_start);

    int f_pos;
    int i_cons;

    while(1){
        int prod_ended_info = 0;

        pthread_mutex_lock(&m_fq);

          while(sz_fq==0){
            pthread_mutex_lock(&m_prod_ended);
              prod_ended_info = prod_ended;
            pthread_mutex_unlock(&m_prod_ended);
            if(prod_ended_info==1){
              break;
            }
            pthread_cond_wait(&c_fq_empty, &m_fq);
          }
          if(prod_ended_info==1){
              pthread_mutex_unlock(&m_fq);
              break;
          }
          f_pos = filled_queue[front_fq];
          front_fq = (front_fq+1)%max_buf_size;
          sz_fq--;
          if(sz_fq!=0) pthread_cond_signal(&c_fq_empty);

        pthread_mutex_unlock(&m_fq);

        
        i_cons = buffer[f_pos];
        print_consumed(i_cons, thread_id);

        pthread_mutex_lock(&m_eq);
          empty_queue[end_eq] = f_pos;
          end_eq = (end_eq+1)%max_buf_size;
          sz_eq++;
          if(sz_eq!=0) pthread_cond_signal(&c_eq_empty);
        pthread_mutex_unlock(&m_eq);

    }
    return NULL;
    
}
//produce items and place in buffer
//modify code below to synchronize correctly

// void *generate_requests_loop(void *data)
// {
//   int thread_id = *((int *)data);

//   while(1)
//     {

//       if(item_to_produce >= total_items) {
// 	break;
//       }
 
//       buffer[curr_buf_size++] = item_to_produce;
//       print_produced(item_to_produce, thread_id);
//       item_to_produce++;
//     }
//   return 0;
// }

//write function to be run by worker threads
//ensure that the workers call the function print_consumed when they consume an item

int main(int argc, char *argv[])
{
  int *master_thread_id;
  pthread_t *master_thread;
  int *worker_thread_id;
  pthread_t *worker_thread;
  item_to_produce = 1;
  start = 0;
  // curr_buf_size = 0;
  prod_ended = 0;

  int i;
  
   if (argc < 5) {
    printf("./master-worker #total_items #max_buf_size #num_workers #masters e.g. ./exe 10000 1000 4 3\n");
    exit(1);
  }
  else {
    num_masters = atoi(argv[4]);
    num_workers = atoi(argv[3]);
    total_items = atoi(argv[1]);
    max_buf_size = atoi(argv[2]);
  }
    

   buffer = (int *)malloc (sizeof(int) * max_buf_size);
   empty_queue = (int *)malloc (sizeof(int) * max_buf_size);
   filled_queue = (int *)malloc (sizeof(int) * max_buf_size);

    

   master_thread_id = (int *)malloc(sizeof(int) * num_masters);
   master_thread = (pthread_t *)malloc(sizeof(pthread_t) * num_masters);
   worker_thread_id = (int*)malloc(sizeof(int)*num_workers);
   worker_thread = (pthread_t*)malloc(sizeof(pthread_t)*num_workers);

  for (i = 0; i < num_masters; i++){
    master_thread_id[i] = i;
    worker_thread_id[i] = i;
  }

    // create master threads
  for (i = 0; i < num_masters; i++)
    pthread_create(&master_thread[i], NULL, master_function, (void *)&master_thread_id[i]);
  
  //create worker consumer threads

  for(i = 0; i< num_workers; i++){
    pthread_create(worker_thread+i, NULL, worker_function, (void*)&worker_thread_id[i]);
  }
  

  // fill empty_queue with all numbers from 0 to max_buf_size-1
    pthread_mutex_lock(&m_eq);
    for(int i = 0; i<max_buf_size; i++) empty_queue[i] = i;
    front_eq = 0;
    end_eq = 0;
    sz_eq  = max_buf_size;
    pthread_mutex_unlock(&m_eq);

    // filled_queue initially empty
    pthread_mutex_lock(&m_fq);
    front_fq = 0;
    end_fq = 0;
    sz_fq  = 0;
    pthread_mutex_unlock(&m_fq);


// start the program

    pthread_mutex_lock(&m_start);
    start = 1;
    pthread_cond_broadcast(&c_start);
    pthread_mutex_unlock(&m_start);
    
    
  //wait for all threads to complete
  for (i = 0; i < num_masters; i++)
    {
      pthread_join(master_thread[i], NULL);
      printf("master %d joined\n", i);
    }
  for (i = 0; i < num_workers; i++)
    {
      pthread_join(worker_thread[i], NULL);
      printf("worker %d joined\n", i);
    }

  /*----Deallocating Buffers---------------------*/
  free(buffer);
  free(master_thread_id);
  free(master_thread);
  free(worker_thread_id);
  free(worker_thread);
  free(empty_queue);
  free(filled_queue);

  return 0;
}
