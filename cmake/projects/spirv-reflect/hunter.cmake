# Copyright (c) 2019, Mathieu-Andre Chiasson
# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    spirv-reflect
    VERSION
    1.4.335.0-p0
    URL
    https://github.com/mloccy/SPIRV-Reflect/archive/refs/tags/vulkan-sdk-1.4.335.0.tar.gz
    SHA1
    88e653a9fc8e249b8d3739165460dc317cd5494a
)

hunter_cmake_args(
    spirv-reflect
    CMAKE_ARGS
      SPIRV_REFLECT_STATIC_LIB=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(spirv-reflect)
hunter_download(PACKAGE_NAME spirv-reflect)
