#include "bwio.h"
#include "common_defs.h"
#include "messager.h"
#include "messager_impl.h"
#include "scheduler.h"
#include "sys_call.h"
#include "ts7200.h"

int handle_sys_call()
{
    register SysCallType sys_call asm("r8");
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
        register SendParams *params asm("r0");
        return k_send_message(params->tid, params->msg, params->msglen, params->reply, params->rplen);
    }
    case SYSCALL_RECV:
    {
        register int *tid asm("r0");
        register uint8_t *msg asm("r1");
        register int msglen asm("r2");
        return k_rcv_message(tid, msg, msglen);
    }
    case SYSCALL_REPLY:
    {
        register int tid asm("r0");
        register uint8_t *reply asm("r1");
        register int rplen asm("r2");
        return k_reply(tid, reply, rplen);
    }
    default:
    {
        dbgln("Invalid Syscall\n\r");
        return;
    }
    }
}
