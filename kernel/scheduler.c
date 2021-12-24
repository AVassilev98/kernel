#include "bwio/bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "scheduler_ring_buffer.h"
#include "ts7200.h"

static uint32_t t_id_counter;
static SchedulerRingBuffer readyTable[NUM_PRIORITY];
static SchedulerRingBuffer freeTaskDescriptors;
static TaskDescriptor taskDescriptors[MAX_TASKS];
TaskDescriptor *active_running_task;

#define USER_MODE 0x50

void k_scheduler_init()
{
    int i;
    for (i = 0; i < NUM_PRIORITY; i++)
    {
        scheduler_ring_buffer_init(&readyTable[i]);
    }

    scheduler_ring_buffer_init(&freeTaskDescriptors);
    for (i = 0; i < MAX_TASKS; i++)
    {
        scheduler_ring_buffer_elem_push(&freeTaskDescriptors, &taskDescriptors[i]);
    }
    active_running_task = NULL;
    t_id_counter = 0;
}

void k_init_task_descriptor(TaskDescriptor *task_descriptor, void (*code)(), uint8_t priority)
{
    int i;
    task_descriptor->t_id = t_id_counter++;
    task_descriptor->stack_pointer = task_descriptor->stack + STACK_SIZE;

    *(--task_descriptor->stack_pointer) = (uint32_t)code;
    *(--task_descriptor->stack_pointer) = USER_MODE;
    for (i = 0; i < 12; i++)
    {
        *(--task_descriptor->stack_pointer) = 0;
    }

    task_descriptor->priority = priority;
    task_descriptor->state = INIT;
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

    SchedulerRingBuffer *srb = &readyTable[priority];
    scheduler_ring_buffer_elem_push(srb, task);
    if (active_running_task == NULL)
    {
        active_running_task = task;
    }
}

TaskDescriptor *k_get_highest_priority()
{
    int i;
    for (i = 0; i < NUM_PRIORITY; i++)
    {
        SchedulerRingBuffer *srb = &readyTable[MAX_PRIORITY - i];
        if (!scheduler_ring_buffer_empty(srb))
        {
            return scheduler_ring_buffer_elem_pop(srb);
        }
    }
}

uint32_t *k_schedule(uint32_t *old_sp)
{
    active_running_task->state = READY;
    active_running_task->stack_pointer = old_sp;

    uint32_t priority = active_running_task->priority;
    SchedulerRingBuffer *srb = &readyTable[priority];

    scheduler_ring_buffer_elem_push(srb, active_running_task);
    active_running_task = k_get_highest_priority();
    active_running_task->state = RUNNING;

    if (active_running_task == NULL)
    {
        return NULL;
    }
    return active_running_task->stack_pointer;
}
