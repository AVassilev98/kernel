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
int Send(int tid, char *msg, int msglen, char *reply, int rplen);
int Receive(int *tid, char *msg, int msglen);
int Reply(int tid, char *reply, int rplen);