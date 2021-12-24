#pragma once

#include "common_defs.h"
#include "scheduler.h"

typedef struct SchedulerRingBuffer
{
    uint8_t head_index;
    uint8_t tail_index;
    uint8_t num_elems;
    TaskDescriptor *elems[MAX_TASKS];
} SchedulerRingBuffer;

void scheduler_ring_buffer_init(SchedulerRingBuffer *srb);
bool scheduler_ring_buffer_full(SchedulerRingBuffer *srb);
bool scheduler_ring_buffer_empty(SchedulerRingBuffer *srb);
void scheduler_ring_buffer_elem_push(SchedulerRingBuffer *srb, TaskDescriptor *task);
TaskDescriptor *scheduler_ring_buffer_elem_pop(SchedulerRingBuffer *srb);
