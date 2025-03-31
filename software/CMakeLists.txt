# Make sure to run `export PICO_SDK_PATH=/usr/share/pico-sdk`

cmake_minimum_required(VERSION 3.13)
include(pico_sdk_import.cmake)

project(test_project C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
pico_sdk_init()

add_executable(solar
    solar.c
)

pico_enable_stdio_usb(solar 1)
pico_enable_stdio_uart(solar 1)

pico_add_extra_outputs(solar)

target_link_libraries(solar pico_stdlib)
