# Copyright (c) 2015, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ccv)

# DOCUMENTATION_START {
hunter_add_package(ccv)
find_package(ccv REQUIRED CONFIG)

add_executable(foo test.c)
target_link_libraries(foo PRIVATE ccv::ccv)
# DOCUMENTATION_END }
