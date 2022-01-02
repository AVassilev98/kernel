
#pragma once
#include "bwio.h"
#include "message_ring_buffer.h"
#include "scheduler.h"
#include "task_table.h"

typedef struct Mailbox
{
    int *rcv_tid;
    uint8_t *rcv_msg;
    int rcv_msg_len;

    uint8_t *repl_msg;
    int repl_len;

    MessageRingBuffer rcv_buf;
} Mailbox;

extern TaskDescriptor *active_running_task;
extern TaskDescriptor taskDescriptors[MAX_TASKS];
MessageRingBuffer mailboxes[MAX_TASKS];
extern TaskTable ready_task_table;

inline void k_block()
{
    active_running_task->state = BLOCKED;
}

inline void k_unblock(TaskDescriptor *td, int ret_val)
{
    td->state = READY;
    task_table_elem_add(&ready_task_table, td);
    // *(td->stack_pointer + 2) = ret_val;
}

inline void mem_cpy(uint8_t *target, uint8_t *src, uint32_t len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        *target = *src;
        target++;
        src++;
    }
}

void k_messager_init()
{
    int i;
    for (i = 0; i < MAX_TASKS; i++)
    {
        TaskDescriptor *mb = &taskDescriptors[i];
        mb->rcv_msg = NULL;
        mb->repl_msg = NULL;
        mb->rcv_buf = &mailboxes[i];
        message_ring_buffer_init(mb->rcv_buf);
    }
}

static int k_send_message(int tid, uint8_t *msg, int msglen, uint8_t *reply, int replylen)
{
    uint32_t receiver_idx = tid & 0xF;
    TaskDescriptor *receiver = &taskDescriptors[receiver_idx];
    if (receiver->tid != tid)
    {
        return -2;
    }

    active_running_task->repl_len = replylen;
    active_running_task->repl_msg = reply;
    k_block();

    // receive before send
    if (receiver->rcv_msg != NULL)
    {
        int len = msglen;
        int ret = msglen;
        if (receiver->rcv_msg_len < msglen)
        {
            ret = -1;
            len = receiver->rcv_msg_len;
        }
        *receiver->rcv_tid = active_running_task->tid;
        mem_cpy(receiver->rcv_msg, msg, len);
        receiver->rcv_msg = NULL;
        k_unblock(receiver, ret);
        return 0;
    }

    // send before receive
    else
    {
        Message m = {msg, msglen, active_running_task->tid};
        message_ring_buffer_elem_push(receiver->rcv_buf, m);
        return 0;
    }
}

static int k_rcv_message(int *tid, uint8_t *msg, int msglen)
{
    // Nobody to receieve from
    if (message_ring_buffer_empty(active_running_task->rcv_buf))
    {
        active_running_task->rcv_tid = tid;
        active_running_task->rcv_msg = msg;
        active_running_task->rcv_msg_len = msglen;
        k_block();
        return 0;
    }

    // We can receive, no need to block
    Message m;
    message_ring_buffer_elem_pop(active_running_task->rcv_buf, &m);
    int ret = m.len;
    uint32_t len = m.len;
    *tid = m.tid;
    if (msglen < m.len)
    {
        ret = -1;
        len = msglen;
    }

    mem_cpy(msg, m.msg, len);
    return ret;
}

static int k_reply(int tid, uint8_t *reply, int rplen)
{
    uint32_t receiver_idx = tid & 0xF;
    TaskDescriptor *receiver = &taskDescriptors[receiver_idx];
    if (tid != receiver->tid)
    {
        return -2;
    }
    if (receiver->repl_msg == NULL)
    {
        return -3;
    }

    int ret = rplen;
    uint32_t len = rplen;
    if (receiver->repl_len < rplen)
    {
        ret = -1;
        len = receiver->repl_len;
    }

    mem_cpy(receiver->repl_msg, reply, len);
    k_unblock(receiver, ret);
    return ret;
}