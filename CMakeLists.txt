cmake_minimum_required (VERSION 2.8.11)
project (maklinkernel
    LANGUAGES C ASM)

set(TOOL_BIN_PATH ${CMAKE_CURRENT_SOURCE_DIR}/toolchain/gnuarm-4.0.2/arm-elf/bin)
set(TOOL_LIB_PATH ${CMAKE_CURRENT_SOURCE_DIR}/toolchain/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2)
set(TOOL_LIB_EXEC ${CMAKE_CURRENT_SOURCE_DIR}/toolchain/gnuarm-4.0.2/libexec/gcc/arm-elf/4.0.2)

# don't add -rpath, breaks compilation
set(CMAKE_SKIP_RPATH TRUE)

# remove -rdynamic option, breaks compilation
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "src/")
set(GCC_C_COMPILE_FLAGS -O2 -S -fPIC -Wall -mcpu=arm920t -msoft-float)
set(GCC_ASM_COMPILE_FLAGS)
set(GCC_LINK_FLAGS "-static -e main -nmagic -T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld")

if(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
    add_compile_definitions(Debug)
else()
    add_compile_definitions(Release)
endif()

if(NOT TS7200_TARGET_TYPE)
    message(SEND_ERROR "must specify TS7200_TARGET_TYPE. Can be one of: {Physical, Emulator}")
endif()
if(NOT WORKSPACE)
    message(SEND_ERROR "must specify WORKSPACE. Can be one of: {Local, Remote}")
endif()

if(${TS7200_TARGET_TYPE} STREQUAL "Emulator")
    add_compile_definitions(Emulator)
endif()

set(CMAKE_ASM_COMPILE_OBJECT "<CMAKE_ASM_COMPILER> <INCLUDES> ${GCC_ASM_COMPILE_FLAGS} -o <OBJECT> <SOURCE>")
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
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <LINK_FLAGS> ${GCC_LINK_FLAGS} <OBJECTS> <LINK_LIBRARIES> -o <TARGET>")

link_directories(${TOOL_LIB_PATH})
include_directories(include)

add_subdirectory(lib)
add_subdirectory(kernel)