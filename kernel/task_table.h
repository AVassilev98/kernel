#pragma once
#include "scheduler_ring_buffer.h"

typedef struct TaskTable
{
    SchedulerRingBuffer table[NUM_PRIORITY];
} TaskTable;

void task_table_init(TaskTable *tt);
TaskDescriptor *task_table_elem_exchange(TaskTable *tt, TaskDescriptor *td);
void task_table_elem_add(TaskTable *tt, TaskDescriptor *td);
