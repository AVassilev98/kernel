#include "bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "sys_call_params.h"
#include "ts7200.h"

int handle_sys_call()
{
    register SysCallType sys_call_reg asm("r8");
    SysCallType sys_call = sys_call_reg;

    switch (sys_call)
    {
    case SYSCALL_CREATE:
    {
        register int priority asm("r0");
        register void (*code)() asm("r1");
        return k_create(priority, code);
    }
    case SYSCALL_MYTID:
    {
        return active_running_task->t_id;
    }
    case SYSCALL_PARENTTID:
    {
        return active_running_task->parent_tid;
    }
    case SYSCALL_PASS:
    {
        return;
    }
    case SYSCALL_EXIT:
    {
        k_exit();
        return;
    }
    default:
    {
        dbgln("Invalid Syscall\n\r");
        return;
    }
    }
}
