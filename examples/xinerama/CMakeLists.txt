# Copyright (c) 2016, Alexandre Pretyman
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-xinerama)

# download xinerama
hunter_add_package(xinerama)
