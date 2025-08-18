# Copyright (c) 2019, Rahul Sheth
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    VUL
    VERSION
    1.4.315-p0
    URL
    "https://github.com/mloccy/Vulkan-Utility-Libraries/archive/refs/tags/1.4.315-p0.tar.gz"
    SHA1
    a392bc5e99eb96534d0247ebe12a451361005f50
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(VUL)
hunter_download(PACKAGE_NAME VUL)
