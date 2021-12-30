#include "bwio/bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "sys_call.h"
#include "sys_call_handler.h"
#include "ts7200.h"

extern void swi_handler(int);
extern void kernel_to_task(uint32_t *);

void print_regs(uint32_t reg)
{
    register uint32_t sp asm("sp");
    bwprintf(COM2, "sp: %x \r\n", sp);
}

void repeat_task()
{
    int tid = MyTid();
    int parent_tid = MyParentTid();
    bwprintf(COM2, "Entering task, id %d, parent id: %d\r\n", tid, parent_tid);

    while (true)
    {
        bwprintf(COM2, "In Task %d!\r\n", tid);
        Pass();
    }
    Exit();
}

void init_task()
{
    int tid = MyTid();
    int parent_tid = MyParentTid();
    bwprintf(COM2, "Entering init task. id %d, parent id: %d\r\n", tid, parent_tid);
    Create(10, repeat_task);
    bwputstr(COM2, "Created first task\r\n");
    Create(10, repeat_task);
    bwputstr(COM2, "Created second task\r\n");
    bwputstr(COM2, "Exiting init task\r\n");
    Exit();
}

void k_init()
{
    int *addr = (int *)0x28;
    *addr = (uint32_t)&swi_handler;

    bwsetfifo(COM2, OFF);
    bwsetspeed(COM2, 115200);
    bwsetfifo(COM1, OFF);
    bwsetspeed(COM1, 115200);
    k_scheduler_init();
}

void k_run()
{
    k_init();
    kernel_enter_loop(active_running_task->stack_pointer);
}

int main()
{
    k_run();
    bwputstr(COM2, "No more tasks to run. Exiting.\r\n");
    return 0;
}
