#include "bwio.h"
#include "sys_call.h"
#include "ts7200.h"

int Create(int priority, void (*code)())
{
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_CREATE));
    asm("swi 0");
    register int ret asm("r0");
    return ret;
}

int MyTid()
{
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_MYTID));
    asm("swi 0");
    register int ret asm("r0");
    return ret;
}

int MyParentTid()
{
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_PARENTTID));
    asm("swi 0");
    register int ret asm("r0");
    return ret;
}

void Pass()
{
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_PASS));
    asm("swi 0");
}

void Exit()
{
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_EXIT));
    asm("swi 0");
}

volatile int Send(volatile int tid, volatile char *msg, volatile int msglen, volatile char *reply, volatile int rplen)
{
    register int ret asm("r0");
    volatile SendParams params = {tid, msg, msglen, reply, rplen};
    asm("mov r0, %[param_ptr]" ::[param_ptr] "r"(&params));
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_SEND));
    asm("swi 0");
    return ret;
}

volatile int Receive(volatile int *tid, volatile char *msg, volatile int msglen)
{
    register int ret asm("r0");
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_RECV));
    asm("swi 0");
    return ret;
}

volatile int Reply(volatile int tid, volatile char *reply, volatile int rplen)
{
    register int ret asm("r0");
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_REPLY));
    asm("swi 0");
    return ret;
}
