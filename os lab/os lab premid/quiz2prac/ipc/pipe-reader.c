#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<fcntl.h>
#include<sys/stat.h>

int main(){

    char * pipe_name = "/tmp/myfifo";
    mkfifo(pipe_name, 0666);

    int fd_r = open(pipe_name, O_RDONLY);

    char * new_pipe = "/tmp/exitsig";
    mkfifo(new_pipe, 0666);

    int fd_e = open(new_pipe, O_RDONLY | O_NONBLOCK);

    char buf[64];
    while(1){
        ssize_t bytes_read = read(fd_e, buf, sizeof(buf));
        if(bytes_read>0){
            break;
        }
        bzero(buf, 64);
        read(fd_r, buf, sizeof(buf));
        printf("message transmitted: %s\n", buf);
    }
    close(fd_e);
    close(fd_r);
    unlink(pipe_name);
    unlink(new_pipe);
}