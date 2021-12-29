#include "bwio/bwio.h"
#include "common_defs.h"
#include "scheduler.h"
#include "scheduler_ring_buffer.h"
#include "task_table.h"
#include "ts7200.h"

static int t_id_counter;
static TaskTable ready_task_table;
static SchedulerRingBuffer freeTaskDescriptors;
static TaskDescriptor taskDescriptors[MAX_TASKS];
TaskDescriptor *active_running_task;

#define USER_MODE 0x50
extern void Exit();
void k_init_task_descriptor(TaskDescriptor *task_descriptor, void (*code)(), uint8_t priority)
{
    int i;
    task_descriptor->t_id = t_id_counter++;
    task_descriptor->stack_pointer = task_descriptor->stack + STACK_SIZE;

    *(--task_descriptor->stack_pointer) = (uint32_t)Exit;
    for (i = 0; i < 13; i++)
    {
        *(--task_descriptor->stack_pointer) = 0;
    }

    *(--task_descriptor->stack_pointer) = (uint32_t)code;
    *(--task_descriptor->stack_pointer) = USER_MODE;

    task_descriptor->priority = priority;
    task_descriptor->state = INIT;
}

extern void init_task();
void k_scheduler_init()
{
    int i;
    task_table_init(&ready_task_table);

    scheduler_ring_buffer_init(&freeTaskDescriptors);
    for (i = 0; i < MAX_TASKS; i++)
    {
        scheduler_ring_buffer_elem_push(&freeTaskDescriptors, &taskDescriptors[i]);
    }
    t_id_counter = 0;

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
    task->parent_tid = active_running_task->t_id;

    task_table_elem_add(&ready_task_table, task);
    if (active_running_task == NULL)
    {
        active_running_task = task;
    }
    return 0;
}

void k_exit()
{
    scheduler_ring_buffer_elem_push(&freeTaskDescriptors, active_running_task);
    active_running_task = NULL;
}

uint32_t *k_schedule(uint32_t *old_sp)
{
    active_running_task->state = READY;
    active_running_task->stack_pointer = old_sp;

    active_running_task = task_table_elem_exchange(&ready_task_table, active_running_task);

    if (active_running_task == NULL)
    {
        bwputstr(COM2, "Got Null Task!\r\n");
        return NULL;
    }

    active_running_task->state = RUNNING;
    return active_running_task->stack_pointer;
}
