# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-KTX-Software)

# DOCUMENTATION_START {
hunter_add_package(KTX-Software)
find_package(KTX-Software CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC KTX-Software::ktx)
# DOCUMENTATION_END }
