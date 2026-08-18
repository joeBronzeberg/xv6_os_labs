#include<stdlib.h>
#include<stdio.h>
#include<signal.h>
#include<unistd.h>
#include<sys/wait.h>

int main(){
    pid_t pid = fork();
    int signal = SIGTERM;
    if(pid==0){
        execlp("sleep", "sleep", 100, NULL);
        exit(0);
    }

    else{
        if(kill(pid, signal)==-1){
            exit(1);
        }
        wait(0);
        printf("killed %d \n", pid);
        exit(0);
    }
}