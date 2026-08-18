#include<stdio.h>
#include<stdlib.h> 
#include<unistd.h>
#include<sys/wait.h>

int main(int argc, char* argv[]){
    if(argc!=3){
        fprintf(stderr, "Usage: %s <command> <argument>\n", argv[0]);
        exit(1);
    }

    pid_t pid = fork();

    if(pid<0){
        perror("fork failed");
        exit(1);
    }

    if(pid==0){
        printf("calling exec");
        execlp(argv[1], argv[1], argv[2], NULL);
        printf("exec failed");
        perror("exec failed");
        exit(1);
    }
    else{
        int status;
        if(wait(&status)<0){
            perror("wait failed");
            exit(1);
        }
        if(WIFEXITED(status) && WEXITSTATUS(status)==0){
            printf("command executed successfully\n");
        }
        else{
            fprintf(stderr, "command failed with status %d \n", WEXITSTATUS(status));
        }

    }
    return 0;
}