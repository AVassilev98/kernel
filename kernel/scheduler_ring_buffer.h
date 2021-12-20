#pragma once

#include "common_defs.h"
#define MAX_TASKS 16

typedef struct SchedulerRingBuffer
{
    uint8_t head_index;
    uint8_t tail_index;
    uint8_t num_elems;
    uint8_t elems[MAX_TASKS];
} SchedulerRingBuffer;

void scheduler_ring_buffer_init(SchedulerRingBuffer *srb);
bool scheduler_ring_buffer_full(SchedulerRingBuffer *srb);
bool scheduler_ring_buffer_empty(SchedulerRingBuffer *srb);
void scheduler_ring_buffer_elem_push(SchedulerRingBuffer *srb, unsigned char elem);
uint8_t ring_buffer_elem_pop(SchedulerRingBuffer *srb);
