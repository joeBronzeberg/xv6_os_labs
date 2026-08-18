#include<pthread.h>
#include<stdio.h>
#include<unistd.h>


void * messenger(void* arg){
    pthread_t ptid = *(pthread_t*)arg;

    printf("%lu\n", ptid);
    return NULL;
}
int main(){
    int N;
    printf("Enter N: ");
    scanf("%d",&N);

    pthread_t ptid [N];

    for(int i=0; i<N; i++){
        pthread_create(ptid+i, NULL, &messenger, (void*)ptid+i);
    }
    
    for(int i=0; i<N; i++) pthread_join(*(ptid+i), NULL);
    printf("This is main thread\n");
}