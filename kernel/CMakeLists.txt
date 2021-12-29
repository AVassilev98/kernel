add_executable(kernel
    scheduler.c
    scheduler_ring_buffer.c
    task_table.c
    sys_call.c
    sys_call_handler.c
    kernel.c
    kernel_loop.s
)
target_compile_options(kernel PRIVATE
    ${GCC_C_COMPILE_FLAGS}
)

target_link_libraries(kernel
    bwio
    gcc
)