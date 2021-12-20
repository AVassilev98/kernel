#include "bwio/bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "sys_call_handler.h"
#include "ts7200.h"

void k_init()
{
    k_scheduler_init();
}

void k_run()
{
    int *addr = (int *)0x28;
    *addr = (int)&handle_sys_call;

    int i = 0;
    k_init();

    Create(10, NULL);
    Create(10, NULL);
    // Create(9, NULL);

    for (i = 0; i < 10; i++)
    {
        k_schedule();
        uint32_t t_id = active_running_task->t_id;
        char id = '0' + t_id;
        bwputc(COM2, id);
        bwputc(COM2, '\n');
    }
}

int _start()
{
    k_run();
    return 0;
}
