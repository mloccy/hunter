# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-pthreads-win32)

# DOCUMENTATION_START {
hunter_add_package(pthreads-win32)
find_package(pthreads-win32 CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC pthreads-win32::pthreads)
# DOCUMENTATION_END }
