
#pragma once
#include "bwio.h"
#include "scheduler.h"
#include "task_table.h"

extern TaskDescriptor *active_running_task;
extern TaskDescriptor taskDescriptors[MAX_TASKS];
SchedulerRingBuffer mailboxes[MAX_TASKS];
extern TaskTable ready_task_table;

static void __attribute__((always_inline)) k_unblock(TaskDescriptor *td, int ret_val)
{
    td->state = READY;
    task_table_elem_add(&ready_task_table, td);
    *(td->stack_pointer + 2) = ret_val;
}

static void __attribute__((always_inline)) mem_cpy(uint32_t *target, uint32_t *src, uint32_t len)
{
    len >>= 2;
    while (len--)
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
        scheduler_ring_buffer_init(mb->rcv_buf);
    }
}

static int __attribute__((always_inline)) k_send_message(int tid, char *msg, int msglen, char *reply, int replylen)
{
    uint32_t receiver_idx = tid & 0xF;
    TaskDescriptor *receiver = &taskDescriptors[receiver_idx];
    if (receiver->tid != tid)
    {
        return -2;
    }

    active_running_task->repl_len = replylen;
    active_running_task->repl_msg = reply;
    active_running_task->state |= RPL_BLOCKED;

    // receive before send
    if (receiver->state & RCV_BLOCKED)
    {
        int len = msglen;
        int ret = msglen;
        if (receiver->rcv_msg_len < msglen)
        {
            ret = -1;
            len = receiver->rcv_msg_len;
        }
        *receiver->rcv_tid = active_running_task->tid;
        mem_cpy((uint32_t *)receiver->rcv_msg, (uint32_t *)msg, len);
        receiver->rcv_msg = NULL;
        k_unblock(receiver, ret);
        return 0;
    }

    // send before receive
    else
    {
        active_running_task->send_msg = msg;
        active_running_task->send_msg_len = msglen;
        scheduler_ring_buffer_elem_push(receiver->rcv_buf, active_running_task);
        return 0;
    }
}

static int __attribute__((always_inline)) k_rcv_message(int *tid, char *msg, int msglen)
{
    // Nobody to receieve from
    if (scheduler_ring_buffer_empty(active_running_task->rcv_buf))
    {
        active_running_task->rcv_tid = tid;
        active_running_task->rcv_msg = msg;
        active_running_task->rcv_msg_len = msglen;
        active_running_task->state |= RCV_BLOCKED;
        return 0;
    }

    // We can receive, no need to block
    TaskDescriptor *sender = scheduler_ring_buffer_elem_pop(active_running_task->rcv_buf);
    int ret = sender->send_msg_len;
    uint32_t len = sender->send_msg_len;
    *tid = sender->tid;
    if (msglen < len)
    {
        ret = -1;
        len = msglen;
    }

    mem_cpy((uint32_t *)msg, (uint32_t *)sender->send_msg, len);
    return ret;
}

static int __attribute__((always_inline)) k_reply(int tid, char *reply, int rplen)
{
    uint32_t receiver_idx = tid & 0xF;
    TaskDescriptor *receiver = &taskDescriptors[receiver_idx];
    if (tid != receiver->tid)
    {
        return -2;
    }
    if (!(receiver->state & RPL_BLOCKED))
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

    mem_cpy((uint32_t *)receiver->repl_msg, (uint32_t *)reply, len);
    k_unblock(receiver, ret);
    return ret;
}
