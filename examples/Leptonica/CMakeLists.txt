cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Leptonica)

# download Leptonica
# DOCUMENTATION_START {
hunter_add_package(Leptonica)
find_package(Leptonica CONFIG REQUIRED)
add_executable(example example.c)

target_link_libraries(example Leptonica::leptonica)
# DOCUMENTATION_END }

enable_testing()

add_test(example example)
