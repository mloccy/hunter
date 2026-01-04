# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_user_error)

if (NOT WIN32)
    hunter_user_error("This package is only available on WIN32 environments")
endif()

hunter_add_version(
    PACKAGE_NAME
    regex2-win32
    VERSION
    1.4.14-1
    URL
    "http://downloads.sourceforge.net/gnuwin32/m4-1.4.14-1-dep.zip"
    SHA1
    f04c27b98aa7ded325d14fad068cc0a7ba118271
)

hunter_pick_scheme(DEFAULT url_sha1_unpack_install)
hunter_download(PACKAGE_NAME regex2-win32)
