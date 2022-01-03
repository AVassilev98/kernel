#include "bwio.h"
#include "sys_call.h"
#include "ts7200.h"

int Create(int priority, void (*code)())
{
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_CREATE));
    register int ret asm("r0");
    return ret;
}

int MyTid()
{
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_MYTID));
    register int ret asm("r0");
    return ret;
}

int MyParentTid()
{
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_PARENTTID));
    register int ret asm("r0");
    return ret;
}

void Pass()
{
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_PASS));
}

void Exit()
{
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_EXIT));
}

int Send(int tid, char *msg, int msglen, char *reply, int rplen)
{
    register int ret asm("r0");
    volatile SendParams params = {tid, msg, msglen, reply, rplen};
    asm("mov r0, %[param_ptr]" ::[param_ptr] "r"(&params));
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_SEND));
    return ret;
}

int Receive(int *tid, char *msg, int msglen)
{
    register int ret asm("r0");
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_RECV));
    return ret;
}

int Reply(int tid, char *reply, int rplen)
{
    register int ret asm("r0");
    asm("swi %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_REPLY));
    return ret;
}
