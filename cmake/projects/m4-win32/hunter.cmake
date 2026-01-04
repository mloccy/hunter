# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_user_error)
include(hunter_cmake_args)

if (NOT WIN32)
    hunter_user_error("This package is only available on WIN32 environments")
endif()

hunter_add_version(
    PACKAGE_NAME
    m4-win32
    VERSION
    1.4.14-1
    URL
    "http://downloads.sourceforge.net/gnuwin32/m4-1.4.14-1-bin.zip"
    SHA1
    70490a29b5fbbcccaeeb96d0ca57d9217a3e73fa
)
hunter_cmake_args(m4-win32 CMAKE_ARGS DEPENDS_ON_PACKAGES=regex2-win32)
hunter_pick_scheme(DEFAULT url_sha1_unpack_install)
hunter_download(PACKAGE_NAME m4-win32)
