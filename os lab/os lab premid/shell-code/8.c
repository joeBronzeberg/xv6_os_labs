#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include<signal.h>

void sigint_handler(int sig){
    printf("I will run forever, try ctrl+d\n");
}
int main(){
    signal(SIGINT, sigint_handler);
    while(1);
			printf("%d\n", n);
}