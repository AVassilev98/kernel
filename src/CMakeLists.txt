add_executable(kernel
    entry.c
)
target_link_libraries(kernel
    bwio
    gcc
)