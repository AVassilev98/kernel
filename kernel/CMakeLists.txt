add_executable(kernel
    scheduler.c
    sys_call.c
    sys_call_handler.c
    kernel.c
    messager.c
    kernel_loop.s
)
target_compile_options(kernel PRIVATE
    ${GCC_C_COMPILE_FLAGS}
)

target_link_libraries(kernel
    ts7200
    gcc
)

if(WORKSPACE STREQUAL "Local")
    add_custom_target(upload ALL
        COMMAND sudo cp ${CMAKE_CURRENT_BINARY_DIR}/kernel /srv/tftp/kernel
        DEPENDS kernel
    )
endif()