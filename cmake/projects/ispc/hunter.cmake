# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    ispc
    VERSION
    1.29.1
    URL
    "https://github.com/mloccy/ispc/archive/refs/tags/v1.29.1.tar.gz"
    SHA1
    3ea1af89dca0301b436c8dc51020ed0b349aa927
)

hunter_cmake_args(ispc CMAKE_ARGS ISPC_INCLUDE_TESTS=Off ISPC_INCLUDE_EXAMPLES=Off ISPC_PREPARE_PACKAGE=On)
hunter_configuration_types(ispc CONFIGURATION_TYPES Release)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ispc)
hunter_download(PACKAGE_NAME ispc)
