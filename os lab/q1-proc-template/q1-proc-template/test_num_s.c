#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

void test_get_num_syscall() {
    int pid = getpid();
    int num_syscalls1 = get_num_syscall(pid);

    int childpid = fork();
    if (childpid == 0) {
        // Child process: invoke various syscalls
        int fds[2];
        pipe(fds);                        // SYS_pipe
        write(fds[1], "x", 1);            // SYS_write
        char buf[10];
        read(fds[0], buf, 1);             // SYS_read
        close(fds[0]);                    // SYS_close
        close(fds[1]);                    // SYS_close
        getpid();                         // SYS_getpid
        sleep(1);                         // SYS_sleep
        uptime();                         // SYS_uptime

        int fd = open("test.txt", O_CREATE | O_WRONLY); // SYS_open
        write(fd, "hello", 5);           // SYS_write
        close(fd);                        // SYS_close
        unlink("test.txt");              // SYS_unlink

        mkdir("testdir");                // SYS_mkdir
        chdir("testdir");                // SYS_chdir
        chdir("..");                     // SYS_chdir
        unlink("testdir");               // SYS_unlink

        sbrk(1);                          // SYS_sbrk

        dup(1);                           // SYS_dup

        int pid2 = fork();                // SYS_fork
        if (pid2 == 0) {
            exit();                      // SYS_exit
        }
        wait();                           // SYS_wait

        // SYS_exec (fails intentionally)
        char *args[] = { "nonexistent", 0 };
        exec("nonexistent", args);       // SYS_exec

        // SYS_fstat on stdout
        struct stat st;
        fstat(1, &st);                   // SYS_fstat

        // SYS_mknod (creates dummy device node, may fail on xv6)
        mknod("nod", 1, 1);              // SYS_mknod
        unlink("nod");                   // cleanup

        link("test.txt", "testlink");    // SYS_link (may fail if file doesn't exist)
        unlink("testlink");              // cleanup

        exit();                           // SYS_exit
    }

    wait(); // wait for child to finish
    int num_syscalls2 = get_num_syscall(childpid);

    printf(1, "%d\n", num_syscalls1);
    printf(1, "%d\n", num_syscalls2);
}

int main() {
    test_get_num_syscall();
    exit();
}
