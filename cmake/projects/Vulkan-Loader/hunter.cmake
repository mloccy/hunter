# Copyright (c) 2025, Colm Vize
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Loader
    VERSION
    1.4.307-p0
    URL
    "https://github.com/mloccy/Vulkan-Loader/archive/refs/tags/v1.4.307-p0.tar.gz"
    SHA1
    aa658c03ec4eb407b4897df6c5b9dbb7a5a93d04
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Vulkan-Loader)
hunter_download(PACKAGE_NAME Vulkan-Loader)
