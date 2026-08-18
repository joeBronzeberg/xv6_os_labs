#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>      // for "open" and "O_RDONLY"
#include <unistd.h>     // for "read"
#include <sys/stat.h>   // for "mkfifo"

#define PIPE_NAME "pipe_example"


int main(){

    char buff[256];
    bzero(buff, sizeof(buff));

    char * name = PIPE_NAME;
    mkfifo(name, 0666);

    int fd_r = open(name, O_RDONLY);

    if(fd_r<0) error("opening file");
    int n = read(fd_r, &buff, sizeof(buff));
    close(fd_r);
    unlink(name);

}
int main()
{
    char buffer[256];
    mkfifo(PIPE_NAME, 0666); // 0666 - read and write permission for the owner, group, and others
    int fd0 = open(PIPE_NAME, O_RDONLY);

    read(fd0, &buffer, sizeof(buffer));
    printf("Here is the message: %s\n",buffer);
    close(fd0);
    unlink(PIPE_NAME);
}