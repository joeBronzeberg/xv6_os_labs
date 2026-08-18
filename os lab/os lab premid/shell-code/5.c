#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>

int main(){
    pid_t pid = fork();

    if(pid==0){
        printf("calling exec with new line\n ");
        printf("calling exec");     // not printing
        execlp("ls", "ls", NULL);
        printf("i dont print\n");
        exit(1);
    }
    else{
        wait(0);
        printf("hey\n");
        exit(0);
    }
}