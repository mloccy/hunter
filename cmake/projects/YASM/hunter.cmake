# Copyright (c) 2014-2015, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    YASM
    VERSION
    "v1.3.0"
    URL
    "https://github.com/mloccy/yasm/archive/v1.3.0.zip"
    SHA1
    5c8f31a3bd11b6184e3f4b3dd435df9d6e0befb5
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(YASM)
hunter_download(PACKAGE_NAME YASM)
