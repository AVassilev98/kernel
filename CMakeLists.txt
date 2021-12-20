cmake_minimum_required (VERSION 2.8.11)
project (maklinkernel
    LANGUAGES C ASM)

set(TOOL_BIN_PATH ${CMAKE_CURRENT_SOURCE_DIR}/toolchain/gnuarm-4.0.2/arm-elf/bin)
set(TOOL_LIB_PATH ${CMAKE_CURRENT_SOURCE_DIR}/toolchain/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2)
set(TOOL_LIB_EXEC ${CMAKE_CURRENT_SOURCE_DIR}/toolchain/gnuarm-4.0.2/libexec/gcc/arm-elf/4.0.2)

# don't add -rpath, breaks compilation
set(CMAKE_SKIP_RPATH TRUE)

# remove -rdynamic option, breaks compilation
set( CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "" )
set(GCC_C_COMPILE_FLAGS -g -S -fPIC -Wall -mcpu=arm920t -msoft-float)
set(GCC_ASM_COMPILE_FLAGS)
set(GCC_LINK_FLAGS -static -nmagic -T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld)

set(CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> <DEFINES> <INCLUDES> ${GCC_ASM_COMPILE_FLAGS} -o <OBJECT> <SOURCE>")
string(
    REPLACE 
        "<ASSEMBLY_SOURCE>" "<OBJECT>.S" 
        MY_CREATE_ASSEMBLY "${CMAKE_C_CREATE_ASSEMBLY_SOURCE}"
)
string(
   REPLACE 
        "<SOURCE>" "<OBJECT>.S" 
         MY_COMPILE_OBJECT "${CMAKE_ASM_COMPILE_OBJECT}"
)
set(
    CMAKE_C_COMPILE_OBJECT 
        "${MY_CREATE_ASSEMBLY}"
        "${MY_COMPILE_OBJECT}"
) 

set(CMAKE_C_COMPILER ${TOOL_BIN_PATH}/gcc)
add_compile_options(-B${TOOL_LIB_EXEC})
set(CMAKE_ASM_COMPILER ${TOOL_BIN_PATH}/as)
set(CMAKE_LINKER ${TOOL_BIN_PATH}/ld)
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> <OBJECTS> <LINK_LIBRARIES> -o <TARGET>")

link_directories(${TOOL_LIB_PATH})
include_directories(include)

add_subdirectory(bwio)
add_subdirectory(kernel)