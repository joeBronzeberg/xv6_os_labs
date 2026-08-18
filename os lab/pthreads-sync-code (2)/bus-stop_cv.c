#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<pthread.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <wait.h>
#include<time.h>

// int C; // capacity of bus
// int N, P;
// int start = 0;
// pthread_mutex_t m_start;
// pthread_cond_t cv_start;

// int bus_cnt = 0;
// int bus_qcnt = 0;
// pthread_mutex_t m_bus_cnt;

// pthread_cond_t cv_bus_came;

// int* pas_cnt;
// void* bus_function(void* arg){
//     int id = *(int *)arg;

//     pthread_mutex_lock(&m_start);
//         while(start==0) pthread_cond_wait(&cv_start, &m_start);
//     pthread_mutex_unlock(&m_start);

//     int t = rand()%10;
//     sleep(t);

    
//     pthread_mutex_lock(&m_bus_cnt);
//         bus_cnt++;
//         printf("bus %d entered at: %d\n", id, t);

//     pthread_mutex_unlock(&m_bus_cnt);
    

//     return NULL;
// }

int main(){
    
    N = 5;
    P = 100;
    C = 25;
    pas_cnt = (int*)malloc(sizeof(int)*N);

    srand(time(NULL));

    pthread_t b_tid[N], p_tid[P];
    int b_id[N], p_id[P];

    for(int i=0; i<N; i++) b_id[i] = i+1;
    for(int i=0; i<P; i++) p_id[i] = i+1;

    // create bus threads
    for(int i=0; i<N; i++){
        pthread_create(&b_tid[i], NULL, bus_function, (void*)&b_id[i]);
    }
    
    // create passenger threads

    for(int i=0; i<P; i++){
        pthread_create(&p_tid[i], NULL, passenger_function, (void*)&p_id[i]);
    }


    pthread_mutex_lock(&m_start);
        start = 1;
        printf("simulation starting\n");
        pthread_cond_broadcast(&cv_start);
    pthread_mutex_unlock(&m_start);

    for(int i = 0; i<N; i++){
        pthread_join(b_tid[i], NULL);
    }
    for(int i = 0; i<P; i++){
        pthread_join(p_tid[i], NULL);
    }

    free(pas_cnt);

    printf("simulation ended\n");
}