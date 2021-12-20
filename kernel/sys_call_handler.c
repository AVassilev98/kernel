#include "bwio/bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "sys_call_params.h"
#include "ts7200.h"

void handle_sys_call()
{
    register void *params_reg asm("r0");
    // Move the params pointer onto the stack
    void *params = params_reg;

    register uint32_t *lr asm("lr");
    SysCallType sys_call = (*(lr - 1)) & 0xFFFFFF;

    switch (sys_call)
    {
    case SYSCALL_CREATE:
    {
        SysCallCreateParams *create_params = params;
        k_create(create_params->priority, create_params->code);
        break;
    }
    case SYSCALL_MYTID:
    case SYSCALL_PARENTTID:
    case SYSCALL_PASS:
    case SYSCALL_EXIT:
    default:
        bwprintf(COM2, "INVALID!!!\n");
        break;
    }
}
