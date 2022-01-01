#include "bwio.h"
#include "sys_call.h"
#include "ts7200.h"

int Create(int priority, void (*code)())
{
    register int ret asm("r0");
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_CREATE));
    asm("swi 0");
    return ret;
}

int MyTid()
{
    register int ret asm("r0");
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_MYTID));
    asm("swi 0");
    return ret;
}

int MyParentTid()
{
    register int ret asm("r0");
    asm("mov r8, %[sys_call_id]" ::[sys_call_id] "I"(SYSCALL_PARENTTID));
    asm("swi 0");
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
