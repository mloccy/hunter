# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-arrayfire)

# download arrayfire
hunter_add_package(ArrayFire)

# now arrayfire can be used
find_package(ArrayFire CONFIG REQUIRED)

add_executable(foo-cpu foo.cpp)
target_link_libraries(foo-cpu ArrayFire::afcpu)

add_executable(foo-unified foo.cpp)
target_link_libraries(foo-unified ArrayFire::af)
