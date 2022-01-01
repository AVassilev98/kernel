#pragma once

typedef enum SysCallType
{
    SYSCALL_CREATE,
    SYSCALL_MYTID,
    SYSCALL_PARENTTID,
    SYSCALL_PASS,
    SYSCALL_EXIT
} SysCallType;

int Create(int priority, void (*code)());
int MyTid();
int MyParentTid();
void Pass();
void Exit();
