#pragma once
#include "bwio.h"
#include "scheduler_ring_buffer.h"
#include "ts7200.h"

/*############ DECLARATIONS ################*/

typedef struct TaskTable
{
    uint32_t table_mask;
    SchedulerRingBuffer table[NUM_PRIORITY];
} TaskTable;

static void task_table_init(TaskTable *tt) __attribute__((always_inline));
static TaskDescriptor *task_table_elem_exchange(TaskTable *tt, TaskDescriptor *td) __attribute__((always_inline));
static void task_table_elem_add(TaskTable *tt, TaskDescriptor *td) __attribute__((always_inline));

/*############ DEFINITIONS ################*/

#define ROW_TO_MASK(row) (0x8000 >> row)
#define TABLE_MASK_INIT(mask) (mask = 1 << 31)
#define TABLE_EMPTY(mask) (mask == 1 << 31)

static inline void task_table_init(TaskTable *tt)
{
    uint32_t i;
    for (i = 0; i < MAX_TASKS; i++)
    {
        scheduler_ring_buffer_init(&tt->table[i]);
    }
    TABLE_MASK_INIT(tt->table_mask);
}

static inline TaskDescriptor *task_table_elem_exchange(TaskTable *tt, TaskDescriptor *td)
{
    static const int MultiplyDeBruijnBitPosition2[32] = {15, 14, 28, 13, 29, 1,  24, 12, 30, 22, 20, 0, 25, 17, 11, 7,
                                                         31, 27, 2,  23, 21, 19, 16, 8,  26, 3,  18, 9, 4,  10, 5,  6};

    uint32_t mask_lsb = (tt->table_mask) & (-tt->table_mask);

    if (td != NULL)
    {
        uint32_t priority = td->priority;
        uint32_t active_mask = ROW_TO_MASK(priority);
        if (active_mask < mask_lsb)
        {
            return td;
        }

        tt->table_mask |= active_mask;
        SchedulerRingBuffer *srb = &tt->table[priority];
        scheduler_ring_buffer_elem_push(srb, td);
    }

    if (TABLE_EMPTY(mask_lsb))
    {
        return NULL;
    }

    uint32_t new_task_priority = MultiplyDeBruijnBitPosition2[(uint32_t)(mask_lsb * 0x077CB531U) >> 27];

    SchedulerRingBuffer *srb = &tt->table[new_task_priority];
    TaskDescriptor *ret = scheduler_ring_buffer_elem_pop(srb);

    if (scheduler_ring_buffer_empty(srb))
    {
        tt->table_mask &= ~mask_lsb;
    }
    return ret;
}

static inline void task_table_elem_add(TaskTable *tt, TaskDescriptor *td)
{
    SchedulerRingBuffer *srb = &tt->table[td->priority];
    scheduler_ring_buffer_elem_push(srb, td);
    tt->table_mask |= ROW_TO_MASK(td->priority);
    dbgln("tt->table_mask: %x\r\n", tt->table_mask);
}
