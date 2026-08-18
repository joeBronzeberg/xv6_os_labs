#include<stdlib.h>
#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

int main(){
    int n;
    printf("enter n : ");
    scanf("%d", &n);

    for(int i=0;i<n;i++){
        pid_t pid = fork();

        if(pid==0){
            printf("%d : terminating\n", getpid()); exit(0);
        }
        else{
            pid_t ret = wait(0);
            printf("%d : child terminated %d\n", getpid(), ret);
        }
    }
    printf("%d: terminating\n", getpid());
    exit(0);
}