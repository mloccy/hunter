# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_ros_geneus)

# DOCUMENTATION_START {
hunter_add_package(ros_geneus)
find_package(catkin CONFIG REQUIRED COMPONENTS geneus)

add_message_files(FILES dummy.msg)
generate_messages()

catkin_package()

# DOCUMENTATION_END }
