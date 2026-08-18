#include <stdio.h>
#include <stdlib.h>
#include <string.h>     // for "bzero"
#include <fcntl.h>      // for "open" and "O_WRONLY"
#include <unistd.h>     // for "write" and "close"

#define PIPE_NAME "pipe_example"

void error(char *msg)
{
    perror(msg);
    exit(0);
}

int main(){
    char buffer[256];
    int fd_w = open(PIPE_NAME, O_WRONLY);
    if(fd_w<0) error("Pipe not created yet");

    printf("enter message: ");
    bzero(buffer, sizeof(buffer));
    fgets(buffer, sizeof(buffer)-1, stdin);

    write(fd_w, &buffer, sizeof(buffer)-1);
    close(fd_w);
    
}
int main()
{
    char buffer[256];
    int fd1 = open(PIPE_NAME, O_WRONLY);

    if(fd1 < 0) error("Pipe not created yet");

    printf("Please enter the message: ");
    bzero(buffer,256);
    fgets(buffer,255,stdin);

    write(fd1, &buffer, sizeof(buffer));
    printf("Sending data...\n");
    close(fd1);
}