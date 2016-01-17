#ifndef __MP2_GIVEN_INCLUDE__
#define __MP2_GIVEN_INCLUDE__

#include <linux/pid.h>
#include <linux/sched.h>

/* Added struct for easy interface passing */
struct info_send
{
    char opcode;
    int pid;
    unsigned int duration_ms;
    unsigned int period_ms;

};

struct task_struct* find_task_by_pid(unsigned int nr)
{
    struct task_struct* task;
    rcu_read_lock();
    task=pid_task(find_vpid(nr), PIDTYPE_PID);
    rcu_read_unlock();

    return task;
}

#endif
