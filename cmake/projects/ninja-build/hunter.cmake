# Copyright (c) 2025, Colm Vize
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_status_debug)

hunter_add_version(
    PACKAGE_NAME
    ninja-build
    VERSION
    "1.13.1"
    URL
    "https://github.com/mloccy/ninja/archive/refs/tags/v1.13.1.tar.gz"
    SHA1
    44ca5725ccd743b110f7aa3164bde10bdde77aef)

hunter_cmake_args(
    ninja-build
    CMAKE_ARGS
    BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ninja-build)
hunter_download(PACKAGE_NAME ninja-build)
