#pragma once
#include "common_defs.h"

#define MAX_TASKS 32
#define MIN_PRIORITY 0
#define MAX_PRIORITY 30
#define NUM_PRIORITY 31

#define STACK_SIZE 1024 * 80

#define READY (1 << 0)
#define RCV_BLOCKED (1 << 1)
#define RPL_BLOCKED (1 << 2)

typedef struct TaskDescriptor
{
    int *rcv_tid;
    char *rcv_msg;
    int rcv_msg_len;

    char *repl_msg;
    int repl_len;

    char *send_msg;
    int send_msg_len;

    struct SchedulerRingBuffer *rcv_buf;

    uint32_t *stack_pointer;
    int idx;
    int tid;
    int parent_tid;
    uint32_t state;
    uint32_t priority;
} TaskDescriptor;

extern TaskDescriptor *active_running_task;
void k_scheduler_init();
int k_create(int priority, void (*code)());
void k_exit();
uint32_t *k_schedule(uint32_t *old_sp);
