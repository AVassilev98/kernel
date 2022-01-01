#pragma once
#include "common_defs.h"

#define MAX_TASKS 16
#define MIN_PRIORITY 0
#define MAX_PRIORITY 15
#define NUM_PRIORITY 16

#define STACK_SIZE 1024 * 80

typedef enum State
{
    INIT,
    READY,
    RUNNING
} State;

typedef struct TaskDescriptor
{
    uint32_t *stack_pointer;
    int tid;
    int parent_tid;
    State state;
    uint8_t priority;
    uint32_t stack[STACK_SIZE];

} TaskDescriptor;

extern TaskDescriptor *active_running_task;
void k_scheduler_init();
int k_create(int priority, void (*code)());
void k_exit();
uint32_t *k_schedule(uint32_t *old_sp);
