# Copyright (c) 2016-2020, Ruslan Baratov, David Hirvonen, Rahul Sheth
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-re2)

hunter_add_package(re2)
find_package(re2 CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo re2::re2)
