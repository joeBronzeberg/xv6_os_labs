#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>

int main(void){
    pid_t pid = fork();
    if(pid<0){
        perror("fork failed");
        exit(1);
    }
    if(pid==0){
        pid_t  child_pid = getpid();
        printf("Child: pid = %d \n",child_pid);
        exit(12);
    }
    else{
        int status;
        pid_t terminated_pid = waitpid(pid, &status,0);
        printf("Parent: Child %d terminated with status %d \n", terminated_pid, WEXITSTATUS(status));
        exit(0);
    }
}