#include<pthread.h>
#include<stdio.h>
#include<unistd.h>


int counter = 0;
pthread_mutex_t m;

void * incrementer(void* arg){
    for(int i=0; i<1000; i++){
        pthread_mutex_lock(&m);
        counter++;
        pthread_mutex_unlock(&m);
    }
    return NULL;
}
int main(){
    pthread_t ptid [10];

    for(int i=0; i<10; i++){
        pthread_create(ptid+i, NULL, &incrementer, NULL);
    }
    
    for(int i=0; i<10; i++) pthread_join(*(ptid+i), NULL);
    printf("%d\n", counter);
}