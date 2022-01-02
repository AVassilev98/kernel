#include "bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "scheduler_ring_buffer.h"
#include "task_table.h"
#include "ts7200.h"

static int tid_counter;
static TaskTable ready_task_table;
static SchedulerRingBuffer freeTaskDescriptors;
TaskDescriptor taskDescriptors[MAX_TASKS];
TaskDescriptor *active_running_task;
const int MultiplyDeBruijnBitPosition2[32] = {15, 14, 28, 13, 29, 1,  24, 12, 30, 22, 20, 0, 25, 17, 11, 7,
                                              31, 27, 2,  23, 21, 19, 16, 8,  26, 3,  18, 9, 4,  10, 5,  6};

#define USER_MODE 0x50
extern void Exit();
static inline void k_init_task_descriptor(TaskDescriptor *task_descriptor, void (*code)(), uint8_t priority)
{
    int i;
    task_descriptor->tid = task_descriptor->idx + (tid_counter << 4);
    tid_counter++;
    task_descriptor->stack_pointer = task_descriptor->stack + STACK_SIZE;

    *(--task_descriptor->stack_pointer) = (uint32_t)Exit;
    for (i = 0; i < 13; i++)
    {
        *(--task_descriptor->stack_pointer) = 0;
    }

    *(--task_descriptor->stack_pointer) = (uint32_t)code;
    *(--task_descriptor->stack_pointer) = USER_MODE;

    task_descriptor->priority = priority;
    task_descriptor->state = READY;
}

extern void init_task();
void k_scheduler_init()
{
    int i;
    task_table_init(&ready_task_table);

    scheduler_ring_buffer_init(&freeTaskDescriptors);
    for (i = 0; i < MAX_TASKS; i++)
    {
        taskDescriptors[i].idx = i;
        scheduler_ring_buffer_elem_push(&freeTaskDescriptors, &taskDescriptors[i]);
        taskDescriptors[i].state = DEAD;
    }
    tid_counter = 0;

    TaskDescriptor *first_user_task = scheduler_ring_buffer_elem_pop(&freeTaskDescriptors);
    k_init_task_descriptor(first_user_task, init_task, MAX_PRIORITY);
    first_user_task->parent_tid = -1;
    active_running_task = first_user_task;
}

int k_create(int priority, void (*code)())
{
    if (priority < MIN_PRIORITY || priority > MAX_PRIORITY)
    {
        return -1;
    }
    if (scheduler_ring_buffer_empty(&freeTaskDescriptors))
    {
        return -2;
    }

    TaskDescriptor *task = scheduler_ring_buffer_elem_pop(&freeTaskDescriptors);
    k_init_task_descriptor(task, code, priority);
    task->parent_tid = active_running_task->tid;

    task_table_elem_add(&ready_task_table, task);
    return task->tid;
}

void k_exit()
{
    active_running_task->state = DEAD;
    scheduler_ring_buffer_elem_push(&freeTaskDescriptors, active_running_task);
    active_running_task = NULL;
}

void k_block()
{
    active_running_task->state = BLOCKED;
}

void k_unblock(int idx, int ret_val)
{
    taskDescriptors[idx].state = READY;
    task_table_elem_add(&ready_task_table, &taskDescriptors[idx]);
    *(taskDescriptors[idx].stack_pointer + 2) = ret_val;
}

uint32_t *k_schedule(uint32_t *old_sp)
{
    if (active_running_task != NULL)
    {
        active_running_task->stack_pointer = old_sp;
        active_running_task = task_table_elem_exchange(&ready_task_table, active_running_task);
    }
    else
    {
        active_running_task = task_table_elem_pop(&ready_task_table);
    }

    if (active_running_task == NULL)
    {
        return NULL;
    }

    return active_running_task->stack_pointer;
}
