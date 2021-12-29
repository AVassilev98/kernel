#include "task_table.h"

void task_table_init(TaskTable *tt)
{
    uint32_t i;
    for (i = 0; i < MAX_TASKS; i++)
    {
        scheduler_ring_buffer_init(&tt->table[i]);
    }
}

TaskDescriptor *task_table_elem_exchange(TaskTable *tt, TaskDescriptor *td)
{
    int priority = td->priority;
    SchedulerRingBuffer *srb = &tt->table[priority];
    scheduler_ring_buffer_elem_push(srb, td);

    for (priority = MAX_PRIORITY; priority > 0; priority--)
    {
        srb = &tt->table[priority];
        if (!scheduler_ring_buffer_empty(srb))
        {
            return scheduler_ring_buffer_elem_pop(srb);
        }
    }
    return NULL;
}

void task_table_elem_add(TaskTable *tt, TaskDescriptor *td)
{
    SchedulerRingBuffer *srb = &tt->table[td->priority];
    scheduler_ring_buffer_elem_push(srb, td);
}
