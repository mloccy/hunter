# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gflags)

# download gflags
hunter_add_package(gflags)

# now gflags can be used
find_package(gflags CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo gflags)
