#include "common_defs.h"
#include "scheduler.h"
#include "scheduler_ring_buffer.h"
#include "ts7200.h"

static uint32_t t_id_counter;
static SchedulerRingBuffer readyTable[NUM_PRIORITY];
static SchedulerRingBuffer freeTaskDescriptors;
static TaskDescriptor taskDescriptors[MAX_TASKS];
TaskDescriptor *active_running_task;

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
        scheduler_ring_buffer_elem_push(&freeTaskDescriptors, i);
    }
    active_running_task = NULL;
    t_id_counter = 0;
}

void k_init_task_descriptor(TaskDescriptor *task_descriptor, void (*code)(), uint8_t priority)
{
    task_descriptor->t_id = t_id_counter++;
    task_descriptor->stack_pointer = (uint32_t)(&task_descriptor->stack);
    task_descriptor->priority = priority;
    task_descriptor->state = INIT;
}

int k_create(int priority, void (*code)())
{
    bwprintf(COM2, "priority: %d ", priority);
    if (priority < MIN_PRIORITY || priority > MAX_PRIORITY)
    {
        return -1;
    }
    if (scheduler_ring_buffer_empty(&freeTaskDescriptors))
    {
        return -2;
    }

    uint32_t free_idx = ring_buffer_elem_pop(&freeTaskDescriptors);
    TaskDescriptor *task = &taskDescriptors[free_idx];
    k_init_task_descriptor(task, code, priority);

    SchedulerRingBuffer *srb = &readyTable[priority];
    scheduler_ring_buffer_elem_push(srb, task->t_id);
}

int k_get_highest_priority()
{
    int i;
    for (i = 0; i < NUM_PRIORITY; i++)
    {
        SchedulerRingBuffer *srb = &readyTable[MAX_PRIORITY - i];
        if (!scheduler_ring_buffer_empty(srb))
        {
            return ring_buffer_elem_pop(srb);
        }
    }
}

void k_schedule()
{
    if (active_running_task != NULL)
    {
        active_running_task->state = READY;
        SchedulerRingBuffer *srb = &readyTable[active_running_task->priority];
        scheduler_ring_buffer_elem_push(srb, active_running_task->t_id);
    }
    active_running_task = &taskDescriptors[k_get_highest_priority()];
    active_running_task->state = RUNNING;
}