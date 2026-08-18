#include<stdio.h>
#include<unistd.h>

int main(void){

    printf("before exc\n");

    char * args[] = {"ls", "-l", NULL};
    // execvp("ls", args);
    // execv("/bin/ls", args);
    execlp("ls", "ls", "-l", NULL);
    // execl("/bin/ls", "ls", NULL);
    perror("exec failed");
    return 1;
}