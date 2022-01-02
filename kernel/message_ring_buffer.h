#pragma once

#include "common_defs.h"
#include "scheduler.h"

/*############ DECLARATIONS ################*/
typedef struct Message
{
    uint8_t *msg;
    int len;
    int tid;
} Message;

typedef struct MessageRingBuffer
{
    uint8_t head_index;
    uint8_t tail_index;
    uint8_t num_elems;
    Message elems[MAX_TASKS];
} MessageRingBuffer;

static void message_ring_buffer_init(MessageRingBuffer *mrb) __attribute__((always_inline));
static bool message_ring_buffer_full(MessageRingBuffer *mrb) __attribute__((always_inline));
static bool message_ring_buffer_empty(MessageRingBuffer *mrb) __attribute__((always_inline));
static void message_ring_buffer_elem_push(MessageRingBuffer *mrb, Message msg) __attribute__((always_inline));
static void message_ring_buffer_elem_pop(MessageRingBuffer *mrb, Message *msg) __attribute__((always_inline));

/*############ DEFINITIONS ################*/

static inline void message_ring_buffer_init(MessageRingBuffer *mrb)
{
    mrb->num_elems = 0;
    mrb->head_index = 0;
    mrb->tail_index = 0;
}

static inline bool message_ring_buffer_full(MessageRingBuffer *mrb)
{
    return mrb->num_elems == MAX_TASKS;
}

static inline bool message_ring_buffer_empty(MessageRingBuffer *mrb)
{
    return mrb->num_elems == 0;
}

static inline void message_ring_buffer_elem_push(MessageRingBuffer *mrb, Message msg)
{
    mrb->num_elems++;
    mrb->elems[mrb->tail_index++] = msg;
    mrb->tail_index &= (MAX_TASKS - 1);
}

static inline void message_ring_buffer_elem_pop(MessageRingBuffer *mrb, Message *msg)
{
    mrb->num_elems--;
    *msg = mrb->elems[mrb->head_index++];
    mrb->head_index &= (MAX_TASKS - 1);
}