# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    nuklear
    VERSION
    1.0.0-p1
    URL
    "https://github.com/mloccy/Nuklear/archive/refs/tags/1.0.0-p1.tar.gz"
    SHA1
    c25b618c9551ac6ef5f39a8394e2ac2078ec7671
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(nuklear)
hunter_download(PACKAGE_NAME nuklear)
