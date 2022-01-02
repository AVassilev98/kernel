#include "bwio.h"
#include "common_defs.h"
#include "messager.h"
#include "scheduler.h"
#include "sys_call.h"
#include "ts7200.h"

int handle_sys_call(void *v0, void *v1, void *v2, void *v3)
{
    register SysCallType sys_call_reg asm("r8");
    volatile SysCallType sys_call = sys_call_reg;

    switch (sys_call)
    {
    case SYSCALL_CREATE:
    {
        return k_create(v0, v1);
    }
    case SYSCALL_MYTID:
    {
        return active_running_task->tid;
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
    case SYSCALL_SEND:
    {
        register SendParams *params = v0;
        return k_send_message(params->tid, params->msg, params->msglen, params->reply, params->rplen);
    }
    case SYSCALL_RECV:
    {
        int *tid = v0;
        return k_rcv_message(v0, v1, v2);
    }
    case SYSCALL_REPLY:
    {
        return k_reply(v0, v1, v2);
    }
    default:
    {
        dbgln("Invalid Syscall\n\r");
        return;
    }
    }
}
