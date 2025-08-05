# Copyright (c) 2016-2020, Rahul Sheth, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    directx-headers
    VERSION
    1.616.0
    URL
    "https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v1.616.0.tar.gz"
    SHA1
    661b31c2eb158150e16a51c522ac9eb3713612db
)

hunter_cmake_args(
    directx-headers
    CMAKE_ARGS
        DXHEADERS_BUILD_TEST=OFF
        DXHEADERS_BUILD_GOOGLE_TEST=OFF
        DXHEADERS_INSTALL=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(directx-headers)
hunter_download(PACKAGE_NAME directx-headers)
