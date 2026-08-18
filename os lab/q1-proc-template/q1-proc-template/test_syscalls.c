#include "types.h"
#include "stat.h"
#include "user.h"

void test_get_num_syscall(){
    int pid = getpid();
    int num_syscalls1 = get_num_syscall(pid);
    sleep(1);
    int num_syscalls2 = get_num_syscall(pid);
    
    printf(1,"\n_______TESTING get_num_syscall(pid)_______\n");
    printf(1, "get_num_syscall(%d): %d\n", pid, num_syscalls1);
    printf(1, "get_num_syscall(%d) [after sleep syscall]: %d\n", pid, num_syscalls2);
}


void test_get_num_timer_interrupts(){
    int pid = getpid();

    printf(1,"\n_______TESTING get_num_timer_interrupts(pid)_______\n");
    printf(1, "get_num_timer_interrupts(%d): %d\n", pid, get_num_timer_interrupts(pid));
    for(double i = 0; i < 10e6; i++);
    printf(1, "get_num_timer_interrupts(%d) [after long for loop]: %d\n", pid,  get_num_timer_interrupts(pid));
}

void test_proc_name(){
    printf(1,"\n_______TESTING fill_proc_name(pid) and get_proc_name(pid)_______\n");

    int pid = getpid(); 
    char* buf = malloc(16);
    if (buf == 0) {
        printf(1, "Memory allocation failed\n");
        exit();
    }
    
    int fill_status1 = fill_proc_name(pid, buf);
    printf(1, "fill_proc_name(%d): %s (Status: %d)\n", pid, buf, fill_status1);

    int fill_status2 = fill_proc_name(10000, buf);
    printf(1, "fill_proc_name(%d): %s (Status: %d)\n", 10000, buf, fill_status2);

    char name[16];
    if (get_proc_name(pid, name, sizeof(name)) > 0)
    printf(1, "Process with pid (%d) has name: %s\n",pid, name);
    else
    printf(1, "Process not found\n");

    if (get_proc_name(10000, name, sizeof(name)) > 0)
    printf(1, "Process with pid (%d) has name: %s\n",10000, name);
    else
    printf(1, "Process with pid (%d) was not found\n", 10000);
}

void test_is_proc_valid(){
    // Test is_proc_valid
    int pid = getpid(); 
    int valid1 = is_proc_valid(1);
    int valid2 = is_proc_valid(2);
    int valid3 = is_proc_valid(pid);
    int valid4 = is_proc_valid(10000);
    
    printf(1,"\n_______TESTING is_proc_valid(pid)_______\n");
    printf(1, "is_proc_valid(%d): %d\n", 1, valid1);
    printf(1, "is_proc_valid(%d): %d\n", 2, valid2);
    printf(1, "is_proc_valid(%d): %d\n", pid, valid3);
    printf(1, "is_proc_valid(%d): %d\n", 10000, valid4);
}
int main()
{
    test_is_proc_valid();
    test_proc_name();
    test_get_num_syscall();
    test_get_num_timer_interrupts();
    exit();
}