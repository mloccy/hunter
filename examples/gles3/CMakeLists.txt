# Copyright (c) 2013-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gles3)

find_package(gles3 REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC gles3::gles3)
