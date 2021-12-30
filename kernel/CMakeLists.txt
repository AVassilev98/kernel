add_executable(kernel
    scheduler.c
    sys_call.c
    sys_call_handler.c
    kernel.c
    kernel_loop.s
)
target_compile_options(kernel PRIVATE
    ${GCC_C_COMPILE_FLAGS}
)

target_link_libraries(kernel
    ts7200
    gcc
)