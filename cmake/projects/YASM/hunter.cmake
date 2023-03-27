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
    "https://github.com/mloccy/yasm/archive/v1.3.0.tar.gz"
    SHA1
    91dc051e4d48bd10a1da37205cc29d8c63d78f0c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(YASM)
hunter_download(PACKAGE_NAME YASM)
