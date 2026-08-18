#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{

    int e_flag = 0;
    if (argc > 1 && strcmp(argv[1], "-e") == 0) {
        e_flag = 1;
    }   
    if (!e_flag)
    {
        printf(1, "PID\tNAME\tSTATE\tSYS\tINT\n");

    int pid = getpid(); 
    char name[16];
    char state[16];
    if(get_proc_state(pid, state, sizeof(state)) > 0){
        if (get_proc_name(pid, name, sizeof(name)) > 0){
            int scnt = 0, icnt = 0;
            scnt = get_num_syscall(pid);
            icnt = get_num_timer_interrupts(pid);
            printf(1, "%d\t%s\t%s\t%d\t%d\n", pid, name, state, scnt, icnt);
        }
    }
        
    }
    else 
    {
        printf(1, "PID\tSTATE\tSYS\tINT\n");
        for(int pid=1; pid<=64; pid++){
        if(is_proc_valid(pid)==1){
            char state[16];
            if(get_proc_state(pid, state, sizeof(state)) > 0){
            
                    int scnt = 0, icnt = 0;
                    scnt = get_num_syscall(pid);
                    icnt = get_num_timer_interrupts(pid);
                    printf(1, "%d\t%s\t%d\t%d\n", pid, state, scnt, icnt);
                
            }
        }
        }
    }
    exit();
}