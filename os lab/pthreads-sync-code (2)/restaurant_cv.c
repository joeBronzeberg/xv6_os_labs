#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<pthread.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <wait.h>
#include<time.h>

int T;
int N;

int room_cnt;
int served_cnt;
int batch_done;
pthread_mutex_t m_room;
pthread_cond_t cv_batch_done = PTHREAD_COND_INITIALIZER;
pthread_cond_t cv_room_full = PTHREAD_COND_INITIALIZER;
pthread_cond_t cv_all_served = PTHREAD_COND_INITIALIZER;
// pthread_cond_t cv_room_empty  = PTHREAD_COND_INITIALIZER;

int queue_cnt;
pthread_mutex_t m_queue;
pthread_cond_t cv_queue_suff;


void* Costumer_thread(void *arg){

    int p = *(int*)arg;

    pthread_mutex_lock(&m_queue);

        queue_cnt++;
        if(queue_cnt==N) pthread_cond_signal(&cv_queue_suff);
        printf("%d: waiting for my batch rep to propogate signal to me\n", p);
        pthread_cond_wait(&cv_queue_suff, &m_queue);

    pthread_mutex_unlock(&m_queue);
    
    pthread_mutex_lock(&m_room);
        // the next batch is ready, and only one among them waits here, then propogates signal
        while(batch_done==0){
            printf("%d :: i am rep, waiting for prev batch to complete\n", p);
            pthread_cond_wait(&cv_batch_done, &m_room);
        }

        // costumer is let in
        printf("%d: entered room\n", p);
        room_cnt++;
        if(room_cnt<N) pthread_cond_signal(&cv_queue_suff); // signal more to come in
        else { // he is the Nth costumer to enter room
            batch_done = 0; // door closed
            pthread_mutex_lock(&m_queue);
                queue_cnt-=N;   // one batch seated
                if(queue_cnt>=N) pthread_cond_signal(&cv_queue_suff); // let one guy wait for the curr batch to finish
            pthread_mutex_unlock(&m_queue);
        }

        while(room_cnt < N){
            printf("%d: waiting for the room to get filled\n", p);
            pthread_cond_wait(&cv_room_full, &m_room); // let all come in
        }
        pthread_cond_signal(&cv_room_full);
        served_cnt++;
        if(served_cnt==N) pthread_cond_signal(&cv_all_served);

    pthread_mutex_unlock(&m_room);


    // let him eat
    int t = rand()%7;
    sleep(t);
    printf("%d: i am done eating\n",p);

    pthread_mutex_lock(&m_room);
        while(served_cnt<N){
            printf("%d: wating for others to get served before i leave\n",p);
            pthread_cond_wait(&cv_all_served, &m_room);
        }
        pthread_cond_signal(&cv_all_served);

        printf("%d: i am leaving\n",p);
        room_cnt--;
        if(room_cnt==0){
            printf("%d :: i am last person to leave, my batch done\n", p);
            served_cnt = 0;
            batch_done = 1;
            pthread_cond_signal(&cv_batch_done);
        }
    pthread_mutex_unlock(&m_room);

    return NULL;
}

int main(){
    T = 10;
    N = 5;
    room_cnt = 0;
    served_cnt = 0;
    queue_cnt = 0;
    batch_done = 1;

    srand(time(NULL));

    int costumer_id[T];
    for(int i=0; i<T; i++) costumer_id[i] = i+1;

    pthread_t costumer_tid[T];

    for(int i=0; i<T; i++){
        int t = rand()%3;
        sleep(t);
        pthread_create(&costumer_tid[i], NULL, Costumer_thread, (void*)&costumer_id[i]);
    }

    for(int i=0; i<T;i++){
        pthread_join(costumer_tid[i], NULL);
    }
}