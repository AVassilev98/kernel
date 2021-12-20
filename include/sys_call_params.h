#pragma once

typedef enum SysCallType
{
    SYSCALL_CREATE,
    SYSCALL_MYTID,
    SYSCALL_PARENTTID,
    SYSCALL_PASS,
    SYSCALL_EXIT
} SysCallType;

typedef struct SysCallCreateParams
{
    int priority;
    void (*code)();
} SysCallCreateParams;