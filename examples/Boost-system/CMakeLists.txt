# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

set(Boost_DEBUG ON CACHE BOOLEAN "")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS system)
find_package(Boost CONFIG REQUIRED system)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::system)

file(GLOB_RECURSE boost_configs "${BOOST_ROOT}/*/BoostConfig.cmake")
list(LENGTH boost_configs len)
if(NOT len GREATER "0")
  message(FATAL_ERROR "Not even one *Config: ${boost_configs}")
endif()
