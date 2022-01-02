#pragma once
#include "common_defs.h"

void k_messager_init();
int k_reply(int tid, char *reply, int rplen);
int k_rcv_message(int *tid, char *msg, int msglen);
int k_send_message(int tid, char *msg, int msglen, char *reply, int replylen);