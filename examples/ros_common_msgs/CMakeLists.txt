# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_ros_common_msgs)

# DOCUMENTATION_START {

hunter_add_package(ros_common_msgs)
find_package(catkin CONFIG REQUIRED
    COMPONENTS std_msgs actionlib_msgs geometry_msgs diagnostic_msgs nav_msgs
    sensor_msgs shape_msgs stereo_msgs trajectory_msgs visualization_msgs)

catkin_package()

add_executable(main main.cpp)
target_link_libraries(main ${catkin_LIBRARIES})

# DOCUMENTATION_END }
