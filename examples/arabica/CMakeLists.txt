# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-arabica)

# DOCUMENTATION_START {
hunter_add_package(arabica)
find_package(arabica CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC arabica::arabica)
# DOCUMENTATION_END }
