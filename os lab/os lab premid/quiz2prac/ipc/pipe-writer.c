#include <stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<string.h>
#include<sys/stat.h>
#include<signal.h>

void signal_handler(int sig){
    char *new_pipe = "/tmp/exitsig";
    mkfifo(new_pipe, 0666);
    int fd = open(new_pipe, O_WRONLY);
    char mess[5] = {'e','x','i','t','\0'};
    write(fd, mess, sizeof(mess));
    close(fd);
    exit(0);
}

int main(void){

    signal(SIGINT,signal_handler);

    char *pipe_name = "/tmp/myfifo";

    mkfifo(pipe_name, 0666);

    int fd_w = open(pipe_name, O_WRONLY);

    char buf[64];

    while(1){
        bzero(buf, 64);
        printf("enter message: ");
        fgets(buf, 64, stdin);
        write(fd_w, buf, sizeof(buf));
    }
}
