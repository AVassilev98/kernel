#include "bwio/bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "sys_call.h"
#include "sys_call_handler.h"
#include "ts7200.h"

extern void swi_handler(int);

void print_regs(uint32_t reg)
{
    register uint32_t sp asm("sp");
    bwprintf(COM1, "sp: %x \r\n", sp);
}

void yield_task()
{
    int i;
    while (1)
    {
        bwprintf(COM1, "iteration: %d\r\n", i);
        Pass();
        i++;
    }
    Exit();
}

void k_init()
{
    k_scheduler_init();
    k_create(0, yield_task);
}

void k_run()
{
    int *addr = (int *)0x28;
    *addr = (uint32_t)&swi_handler;
    k_init();
    kernel_to_task(active_running_task->stack_pointer);
}

int _start()
{
    return 0;
    k_run();
    return 0;
}
