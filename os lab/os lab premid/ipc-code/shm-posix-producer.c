#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/mman.h>

int main()
{
    int N = 1000;
	const int SIZE = 4096;
	const char *name = "feed";

	int shm_fd;
	void *ptr;

	/* create the shared memory segment */
	shm_fd = shm_open(name, O_CREAT | O_RDWR, 0666);

	/* configure the size of the shared memory segment */
	ftruncate(shm_fd,SIZE);

	/* now map the shared memory segment in the address space of the process */
	ptr = mmap(0,SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
	if (ptr == MAP_FAILED) {
		printf("Map failed\n");
		return -1;
	}

	/**
	 * Now write to the shared memory region.
 	 *
	 * Note we must increment the value of ptr after each write.
	 */
    char f[8] = {'f', 'r', 'e', 'e', 'e', 'e', 'e', '\0'};
    char o[8] = {'O', 'S', 'i', 's', 'F', 'U', 'N', '\0'};

    int offset = 0;

    while(offset < SIZE){
        sprintf(ptr+offset, "%s", f);
        offset+=8;
    }


    const char *fifo = "/tmp/myfifo";
    mkfifo(fifo, 0666);             // create named pipe 
    int pipe_fd;
    pipe_fd = open(fifo, O_WRONLY); // pipe_fd to write

    if(pipe_fd==-1){
        printf("pipe open failed\n");
        return 0;
    }
    int prod_cnt = 0;
    offset = 0;

    while(prod_cnt<N){

        while(offset < SIZE){
            if(strcmp((char *)(ptr+offset), f)==0) break;
            offset+=8;
        }

        if(offset < SIZE){
            prod_cnt++;

            sprintf(ptr+offset, "%s", o);
            ssize_t bytes_written = write(pipe_fd, &offset, sizeof(offset));
            printf("bytes written- %ld, offset- %d \n", bytes_written, offset);
            offset+=8;
        }

        if(offset >= SIZE){
            offset = 0;
        }

    }
    close(pipe_fd);

    

	return 0;
}
