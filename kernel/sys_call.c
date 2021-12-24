#include "bwio/bwio.h"
#include "sys_call.h"
#include "sys_call_params.h"
#include "ts7200.h"

int Create(int priority, void (*code)())
{
    SysCallCreateParams params;
    params.priority = priority;
    params.code = code;
    register SysCallCreateParams *p_params asm("r0") = &params;
    register int ret asm("r0");
    register int id asm("r7") = SYSCALL_CREATE;
    asm("swi %[sys_call_id]" : "=r"(ret) : "0"(p_params), [ sys_call_id ] "I"(SYSCALL_CREATE));
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
    register int id asm("r7") = SYSCALL_PASS;
    asm("swi %[sys_call_id]" : : [ sys_call_id ] "I"(SYSCALL_PASS));
}

void Exit()
{
    register int id asm("r7") = SYSCALL_EXIT;
    asm("swi %[sys_call_id]" : : [ sys_call_id ] "I"(SYSCALL_EXIT));
}
