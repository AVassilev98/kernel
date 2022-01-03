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
static inline void task_table_elem_add(TaskTable *tt, TaskDescriptor *td) __attribute__((always_inline));
extern const int MultiplyDeBruijnBitPosition2[32];

/*############ DEFINITIONS ################*/

#define ROW_TO_MASK(row) ((1u << 31) >> row)
#define TABLE_INIT() (1u << 31)
#define TABLE_EMPTY(table) (table->table_mask == TABLE_INIT())

static inline void task_table_init(TaskTable *tt)
{
    uint32_t i;
    for (i = 0; i < NUM_PRIORITY; i++)
    {
        scheduler_ring_buffer_init(&tt->table[i]);
    }
    tt->table_mask = TABLE_INIT();
}

static inline TaskDescriptor *task_table_elem_exchange(TaskTable *tt, TaskDescriptor *td)
{
    const int MultiplyDeBruijnBitPosition2[32] = {31, 30, 3,  29, 2,  17, 7,  28, 1, 9,  11, 16, 6,  14, 27, 23,
                                                  0,  4,  18, 8,  10, 12, 15, 24, 5, 19, 13, 25, 20, 26, 21, 22};

    uint32_t mask_lsb = (tt->table_mask) & (-tt->table_mask);

    if (td->state == READY)
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

    if (TABLE_EMPTY(tt))
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
}
