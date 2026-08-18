
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/un.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<sys/fcntl.h>
#include<sys/signal.h>
#include<string.h>

#define SOCKET_PATH "unix_socket"

int main(){
    struct sockaddr_un server_addr;
    bzero((char*)&server_addr, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, SOCKET_PATH);


    int sock_fd = socket(AF_UNIX, SOCK_DGRAM, 0);

    char buf[256];
    bzero(buf, sizeof(buf));
    printf("enter message: ");
    fgets(buf, 255, stdin);


    int n = sendto(sock_fd, buf, strlen(buf), 0, (struct sockaddr*)&server_addr, sizeof(server_addr));
    close(sock_fd);

}
int main(){
    struct sockaddr_un server_addr;
    bzero((char *)&server_addr, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;

    strcpy(server_addr.sun_path, SOCKET_PATH);

    int socket_fd = socket(AF_UNIX, SOCK_DGRAM, 0);

    char buf[256];
    bzero(buf, 256);
    fgets(buf, 255, stdin);

    int n = sendto(socket_fd, buf, strlen(buf), 0, (struct sockaddr*)&server_addr, sizeof(server_addr));
    close(socket_fd);

}