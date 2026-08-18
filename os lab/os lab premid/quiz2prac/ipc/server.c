
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/signal.h>
#include<sys/fcntl.h>
#include<sys/un.h>
#include<sys/socket.h>
#include<sys/types.h>

#define SOCKET_PATH "unix_socket"


int main(){
    struct sockaddr_un server_addr, client_addr;
    bzero((char*)&server_addr, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, SOCKET_PATH);

    int sock_fd = socket(AF_UNIX, SOCK_DGRAM, 0);

    bind(sock_fd, (struct sockaddr*)&server_addr, sizeof(server_addr));

    char buf[256];
    bzero(buf, 256);

    int len_cli = sizeof(client_addr);
    recvfrom(sock_fd, buf, 255, 0, (struct sockaddr*)&client_addr, &len_cli);
    char res[10] = "recieved";
    sendto(sock_fd, res, strlen(res), 0, (struct sockaddr*)&client_addr, sizeof(client_addr));
}



int main(){

    struct sockaddr_un client_addr, server_addr;

    bzero((char *)&server_addr, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, SOCKET_PATH);

    int socket_fd = socket(AF_UNIX, SOCK_DGRAM, 0);

    bind(socket_fd, (struct sockaddr*)&server_addr, sizeof(server_addr));

    char buff[256];
    bzero(buff, 256);
    int len_cli = sizeof(client_addr);

    int n = recvfrom(socket_fd, buff, 255, 0, (struct sockaddr*)&client_addr, len_cli);
    printf("%s", buff);
    unlink(SOCKET_PATH);
}