#include "types.h"
#include "stat.h"
#include "user.h"

void test_is_proc_valid(){
    int pid = getpid(); 
    int valid1 = is_proc_valid(1);
    int valid2 = is_proc_valid(2);
    int valid3 = is_proc_valid(pid);
    int valid4 = is_proc_valid(1200);
    int childpid = fork();
    if (childpid == 0) exit();
    int valid5 = is_proc_valid(childpid);
    printf(1, "%d\n", valid1);
    printf(1, "%d\n", valid2);
    printf(1, "%d\n", valid3);
    printf(1, "%d\n", valid4);
    printf(1, "%d\n", valid5);
}
int main()
{
    test_is_proc_valid();
    exit();
}