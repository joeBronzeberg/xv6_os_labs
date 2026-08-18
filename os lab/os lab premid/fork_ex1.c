
       #include <signal.h>  // declarations of signal() func and macros like SIGINT
       #include <stdint.h>  // definitions of int16_t, uint8_t...
       #include <stdio.h>   // declarations of printf(), perror(), puts()
       #include <stdlib.h>  // exit(), macros EXIT_SUCCESS, EXIT_FAILURE
       #include <unistd.h>  // posix os api- fork(), pid_t

       int main(void)
       {
           pid_t pid;

           if (signal(SIGCHLD, SIG_IGN) == SIG_ERR) {
               perror("signal");
               exit(EXIT_FAILURE);
           }

           pid = fork();
           
           switch (pid) {
           case -1:
               perror("fork");
               exit(EXIT_FAILURE);
           case 0:
               puts("Child exiting.");
               exit(EXIT_SUCCESS);
           default:
               printf("Child is PID %jd\n", (intmax_t) pid);
               puts("Parent exiting.");
               exit(EXIT_SUCCESS);
           }
       }