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
    re2c
    VERSION
    4.3
    URL
    https://github.com/skvadrik/re2c/archive/refs/tags/4.3.tar.gz
    SHA1
    5d830bd96f36a4e3bbfc1f0b26cd83bf88f87e3d
)

hunter_cmake_args(
    re2c
    CMAKE_ARGS
      RE2C_BUILD_TESTS=OFF
      RE2C_REBUILD_PARSERS=OFF
      RE2C_REBUILD_DOCS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(re2c)
hunter_download(PACKAGE_NAME re2c)
