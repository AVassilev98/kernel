add_executable(kernel
    scheduler.c
    scheduler_ring_buffer.c
    sys_call.c
    sys_call_handler.c
    kernel.c
)

target_link_libraries(kernel
    bwio
    gcc
)