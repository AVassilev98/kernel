#include "scheduler_ring_buffer.h"

void scheduler_ring_buffer_init(SchedulerRingBuffer *srb)
{
    srb->num_elems = 0;
    srb->head_index = 0;
    srb->tail_index = 0;
}

bool scheduler_ring_buffer_full(SchedulerRingBuffer *srb)
{
    return srb->num_elems == MAX_TASKS;
}

bool scheduler_ring_buffer_empty(SchedulerRingBuffer *srb)
{
    return srb->num_elems == 0;
}

void scheduler_ring_buffer_elem_push(SchedulerRingBuffer *srb, unsigned char elem)
{
    srb->num_elems++;
    srb->elems[srb->tail_index++] = elem;
    srb->tail_index &= (MAX_TASKS - 1);
}

uint8_t ring_buffer_elem_pop(SchedulerRingBuffer *srb)
{
    srb->num_elems--;
    uint8_t ret_elem = srb->elems[srb->head_index++];
    srb->head_index &= (MAX_TASKS - 1);
    return ret_elem;
}