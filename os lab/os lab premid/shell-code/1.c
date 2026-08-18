#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/wait.h>

int main(void){
    pid_t pid = fork();
    switch(pid){
        case -1:
            perror("fork failed\n");
            exit(1);
        case 0:
            printf("I am child\n");
            exit(0);
        default:
            
            int status;
            wait(&status);
            printf("I am parent\n");
            exit(0);
    }
}