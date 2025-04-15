cmake_minimum_required(VERSION 4.0.0)
include(pico_sdk_import.cmake)

project(test_project C CXX ASM)
set(CMAKE_C_STANDARD 23)
set(CMAKE_CXX_STANDARD 26)
pico_sdk_init()

add_executable(solar solar.c)

pico_add_extra_outputs(solar)

target_link_libraries(solar pico_stdlib hardware_adc)
