#pragma once

typedef enum SysCallType
{
    SYSCALL_CREATE,
    SYSCALL_MYTID,
    SYSCALL_PARENTTID,
    SYSCALL_PASS,
    SYSCALL_EXIT,
    SYSCALL_SEND,
    SYSCALL_RECV,
    SYSCALL_REPLY,
} SysCallType;

typedef struct SendParams
{
    int tid;
    char *msg;
    int msglen;
    char *reply;
    int rplen;
} SendParams;

int Create(int priority, void (*code)());
int MyTid();
int MyParentTid();
void Pass();
void Exit();
int volatile Send(volatile int tid, volatile char *msg, volatile int msglen, volatile char *reply, volatile int rplen);
int volatile Receive(volatile int *tid, volatile char *msg, volatile int msglen);
int volatile Reply(volatile int tid, volatile char *reply, volatile int rplen);