# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-applicationservices)

find_package(applicationservices REQUIRED)

add_executable(foo foo.mm)
target_link_libraries(foo PUBLIC applicationservices::applicationservices)
