
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include<sys/types.h>
#include <sys/mman.h>
#include <unistd.h>

int main()
{
    int N = 1000;
    const char *fifo = "/tmp/myfifo";
    mkfifo(fifo, 0666);             // create named pipe 
    int pipe_fd;


	const char *name = "feed";
	const int SIZE = 4096;
	int shm_fd;
	void *ptr;
	int i;

	/* open the shared memory segment */
	shm_fd = shm_open(name, O_CREAT | O_RDWR, 0666);
	if (shm_fd == -1) {
		printf("shared memory failed\n");
		exit(-1);
	}

	/* now map the shared memory segment in the address space of the process */
	ptr = mmap(0,SIZE, PROT_WRITE | PROT_READ, MAP_SHARED, shm_fd, 0);
	if (ptr == MAP_FAILED) {
		printf("Map failed\n");
		exit(-1);
	}

    int cons_cnt = 0;
    pipe_fd = open(fifo, O_RDONLY); // pipe_fd to read from

    while(cons_cnt < N){



        int offset=-1;

        read(pipe_fd, &offset, sizeof(offset));
        if(offset==-1){
            printf("nothing read\n");
            continue;
        }

        cons_cnt++;

        /* now read from the shared memory region */
        printf("%s , %d, %d\n", (char *)(ptr+offset), offset, cons_cnt);

        char buff[8] = {'f', 'r', 'e', 'e', 'e', 'e','e', '\0'};
        sprintf(ptr+offset,"%s", buff);
        
        sleep(0.1);

    }
    close(pipe_fd);

    /* remove the shared memory segment */
    if (shm_unlink(name) == -1) {
        printf("Error removing %s\n",name);
        exit(-1);
    }

	return 0;
}
