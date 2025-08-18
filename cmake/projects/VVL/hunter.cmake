# Copyright (c) 2025, Colm Vize
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    VVL
    VERSION
    1.4.315-p0
    URL
    "https://github.com/mloccy/Vulkan-ValidationLayers/archive/refs/tags/1.4.315.tar.gz"
    SHA1
    a802209d6ba8e6fc1933f375e5b66bfc73ea1a32
)

hunter_cmake_args(VVL CMAKE_ARGS BUILD_TESTS=OFF)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(VVL)
hunter_download(PACKAGE_NAME VVL)
