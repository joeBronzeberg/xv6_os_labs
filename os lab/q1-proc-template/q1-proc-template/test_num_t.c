#include "types.h"
#include "stat.h"
#include "user.h"

void test_get_num_timer_interrupts(){
    int pid = getpid();
    printf(1, "%d\n", get_num_timer_interrupts(pid));
    for(double i = 0; i < 10e6; i++);
    sleep(1);
    printf(1, "%d\n", get_num_timer_interrupts(pid));
}

int main()
{
    test_get_num_timer_interrupts();
    exit();
}