
#include "bwio.h"
#include "message_ring_buffer.h"
#include "scheduler.h"

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
Mailbox g_mailboxes[MAX_TASKS];

inline void memcpy(uint8_t *target, uint8_t *src, int len)
{
    while (len--)
    {
        *target++ = *src++;
    }
}

void k_messager_init()
{
    int i;
    for (i = 0; i < MAX_TASKS; i++)
    {
        Mailbox *mb = &g_mailboxes[i];
        mb->rcv_msg = NULL;
        mb->repl_msg = NULL;
        message_ring_buffer_init(&mb->rcv_buf);
    }
}

int k_send_message(int tid, uint8_t *msg, int msglen, uint8_t *reply, int replylen)
{
    return 0;
    uint32_t target_idx = tid & 0xF;
    uint32_t requester_idx = active_running_task->idx;
    Mailbox *target_mailbox = &g_mailboxes[target_idx];
    Mailbox *requester_mailbox = &g_mailboxes[requester_idx];
    if (taskDescriptors[target_idx].tid != tid)
    {
        return -2;
    }

    // receive before send
    if (target_mailbox->rcv_msg != NULL)
    {
        int len = msglen;
        int ret = msglen;
        if (target_mailbox->rcv_msg_len < msglen)
        {
            ret = -1;
            len = target_mailbox->rcv_msg_len;
        }
        *target_mailbox->rcv_tid = active_running_task->tid;
        memcpy(target_mailbox->rcv_msg, msg, len);
        target_mailbox->rcv_msg = NULL;
        k_unblock(target_idx, ret);
        return ret;
    }

    // send before receive
    else
    {
        Message m = {msg, msglen, active_running_task->tid};
        message_ring_buffer_elem_push(&target_mailbox->rcv_buf, m);
    }

    requester_mailbox->repl_len = replylen;
    requester_mailbox->repl_msg = reply;
    k_block();
}

int k_rcv_message(int *tid, uint8_t *msg, int msglen)
{
    return 0;
    uint32_t receiver_idx = active_running_task->tid & 0xF;
    Mailbox *receiver_mailbox = &g_mailboxes[receiver_idx];

    // Nobody to receieve from
    if (message_ring_buffer_empty(&receiver_mailbox->rcv_buf))
    {
        receiver_mailbox->rcv_tid = tid;
        receiver_mailbox->rcv_msg = msg;
        receiver_mailbox->rcv_msg_len = msglen;
        k_block();
        return 0;
    }

    // We can receive, no need to block
    Message m;
    message_ring_buffer_elem_pop(&receiver_mailbox->rcv_buf, &m);
    int ret = m.len;
    uint32_t len = m.len;
    *tid = m.tid;
    if (msglen < m.len)
    {
        ret = -1;
        len = msglen;
    }

    memcpy(msg, m.msg, len);
    return ret;
}

int k_reply(int tid, uint8_t *reply, int rplen)
{
    return 0;
    uint32_t target_idx = tid & 0xF;
    Mailbox *target_mailbox = &g_mailboxes[target_idx];
    if (tid != taskDescriptors[target_idx].tid)
    {
        return -2;
    }
    if (target_mailbox->repl_msg == NULL)
    {
        return -3;
    }

    int ret = rplen;
    uint32_t len = rplen;
    if (target_mailbox->repl_len < rplen)
    {
        ret = -1;
        len = target_mailbox->repl_len;
    }

    memcpy(target_mailbox->repl_msg, reply, len);
    k_unblock(target_idx, ret);
    return ret;
}