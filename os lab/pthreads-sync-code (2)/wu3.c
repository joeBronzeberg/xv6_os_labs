#include<stdio.h>
#include<pthread.h>
#include<unistd.h>
#include<stdlib.h>

pthread_cond_t c = PTHREAD_COND_INITIALIZER;
pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;

int *can_do;
void* myrand(void* arg){
    int i = *(int *)arg;

    pthread_mutex_lock(&m);
    while(!can_do[i]) pthread_cond_wait(&c, &m);
    pthread_mutex_unlock(&m);

    int t = rand()%10;
    // sleep(t);
    printf("%d : time = %d\n", i, t);

    pthread_mutex_lock(&m);
    can_do[i+1] = 1;
    pthread_cond_broadcast(&c);
    pthread_mutex_unlock(&m);

    return NULL;
}
int main(){
    int N = 10;
    int Is[N+1];
    int done_st[N+1];
    can_do = done_st;

    for(int i=0; i<N+1; i++){
        Is[i] = i;
        can_do[i] = 0;
    }
    can_do[0] = 1;

    pthread_t ptids[N];

    for(int i=0; i<N;i++) pthread_create(ptids+i, NULL, &myrand,(void*)(Is+i));
    for(int i=0; i<N; i++) pthread_join(*(ptids+i), NULL);

}