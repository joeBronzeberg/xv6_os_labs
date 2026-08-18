#include<signal.h>
#include<stdio.h>
#include<stdlib.h>

void myHandler(int sig){
    printf("caught signal %d\n", sig);
    exit(0); // if not there, keeps executing
}
int main(){
    
    void (*prevHandler)(int) = signal(SIGINT, myHandler);

    if(prevHandler== SIG_ERR){
        perror("signal");
        exit(1);
    }
    while(1){
        printf("running... press ctrl+c to send SIGINT\n");
        sleep(1);
    }
}