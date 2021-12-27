#include "bwio/bwio.h"
#include "sys_call.h"
#include "sys_call_params.h"
#include "ts7200.h"

int Create(int priority, void (*code)())
{
    register int ret asm("r0");
    asm("swi %[sys_call_id]" : "=r"(ret) : [ sys_call_id ] "I"(SYSCALL_CREATE));
    return ret;
}

int MyTid()
{
    register int ret asm("r0");
    asm("swi %[sys_call_id]" : "=r"(ret) : [ sys_call_id ] "I"(SYSCALL_MYTID));
    return ret;
}

int MyParentTid()
{
    register int ret asm("r0");
    asm("swi %[sys_call_id]" : "=r"(ret) : [ sys_call_id ] "I"(SYSCALL_PARENTTID));
    return ret;
}

void Pass()
{
    asm("swi %[sys_call_id]" : : [ sys_call_id ] "I"(SYSCALL_PASS));
}

void Exit()
{
    asm("swi %[sys_call_id]" : : [ sys_call_id ] "I"(SYSCALL_EXIT));
}
