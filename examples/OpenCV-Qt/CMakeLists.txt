# Copyright (c) 2017, Alexandre Pretyman
# All rights reserved.

cmake_minimum_required(VERSION 3.10)
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)
# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-opencv-qt)

hunter_add_package(OpenCV)
find_package(OpenCV REQUIRED)
message("OpenCV_DIR: ${OpenCV_DIR}")
message("OpenCV_CONFIG: ${OpenCV_CONFIG}")
message("OpenCV_LIBS: ${OpenCV_LIBS}")

add_executable(foo foo.cpp)
target_link_libraries(foo PRIVATE ${OpenCV_LIBS})
