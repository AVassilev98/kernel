#pragma once

#include "common_defs.h"
#include "scheduler.h"

/*############ DECLARATIONS ################*/

typedef struct SchedulerRingBuffer
{
    uint8_t head_index;
    uint8_t tail_index;
    uint8_t num_elems;
    TaskDescriptor *elems[MAX_TASKS];
} SchedulerRingBuffer;

static void scheduler_ring_buffer_init(SchedulerRingBuffer *srb) __attribute__((always_inline));
static bool scheduler_ring_buffer_full(SchedulerRingBuffer *srb) __attribute__((always_inline));
static bool scheduler_ring_buffer_empty(SchedulerRingBuffer *srb) __attribute__((always_inline));
static void scheduler_ring_buffer_elem_push(SchedulerRingBuffer *srb, TaskDescriptor *task) __attribute__((always_inline));
static TaskDescriptor *scheduler_ring_buffer_elem_pop(SchedulerRingBuffer *srb) __attribute__((always_inline));

/*############ DEFINITIONS ################*/

static inline void scheduler_ring_buffer_init(SchedulerRingBuffer *srb)
{
    srb->num_elems = 0;
    srb->head_index = 0;
    srb->tail_index = 0;
}

static inline bool scheduler_ring_buffer_full(SchedulerRingBuffer *srb)
{
    return srb->num_elems == MAX_TASKS;
}

static inline bool scheduler_ring_buffer_empty(SchedulerRingBuffer *srb)
{
    return srb->num_elems == 0;
}

static inline void scheduler_ring_buffer_elem_push(SchedulerRingBuffer *srb, TaskDescriptor *task)
{
    srb->num_elems++;
    srb->elems[srb->tail_index++] = task;
    srb->tail_index &= (MAX_TASKS - 1);
}

static inline TaskDescriptor *scheduler_ring_buffer_elem_pop(SchedulerRingBuffer *srb)
{
    srb->num_elems--;
    TaskDescriptor *ret_task = srb->elems[srb->head_index++];
    srb->head_index &= (MAX_TASKS - 1);
    return ret_task;
}
