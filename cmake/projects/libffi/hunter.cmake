# Copyright (c) 2016-2017 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)


if (UNIX)

    hunter_add_version(
        PACKAGE_NAME
        libffi
        VERSION
        "3.2.1"
        URL
        "https://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz"
        SHA1
        280c265b789e041c02e5c97815793dfc283fb1e6
    )

    hunter_add_version(
        PACKAGE_NAME
        libffi
        VERSION
        "3.3.0"
        URL
        "https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz"
        SHA1
        8df6cb570c8d6596a67d1c0773bf00650154f7aa
    )
    hunter_configuration_types(libffi CONFIGURATION_TYPES Release)
    hunter_pick_scheme(DEFAULT url_sha1_autotools)

    hunter_cmake_args(
        libffi
        CMAKE_ARGS
        PKGCONFIG_EXPORT_TARGETS=libffi
    )

    hunter_cacheable(libffi)
    hunter_download(
        PACKAGE_NAME libffi
        PACKAGE_INTERNAL_DEPS_ID "2"
        PACKAGE_UNRELOCATABLE_TEXT_FILES
        "lib/libffi.la"
        "lib/pkgconfig/libffi.pc"
    )
else()
    hunter_add_version(
        PACKAGE_NAME
        libffi
        VERSION
        "3.2.1"
        URL
        "https://github.com/mloccy/Libffi/archive/refs/tags/3.2.1.tar.gz"
        SHA1
        ffe14515087416e25f4747b0e20e844f5f2f9d3a
    )

    hunter_pick_scheme(DEFAULT url_sha1_cmake)
    hunter_cacheable(libffi)
    hunter_download(PACKAGE_NAME libffi)
endif()