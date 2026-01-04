# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    libxml2
    VERSION
    "2.9.7-p0"
    URL
    "https://github.com/hunter-packages/libxml2/archive/v2.9.7-p0.tar.gz"
    SHA1
    5d5d6da2a87267f160f76a26c5637cbc48b28784
)

hunter_add_version(
    PACKAGE_NAME
    libxml2
    VERSION
    "2.14.5"
    URL
    "https://github.com/mloccy/libxml2/archive/refs/tags/v2.14.5.tar.gz"
    SHA1
    ba40def69c65e53fbe2b20ed40230a059636c8a5
)

hunter_cacheable(libxml2)
hunter_pick_scheme(DEFAULT url_sha1_cmake)

hunter_cmake_args(
    libxml2
    CMAKE_ARGS
    LIBXML2_WITH_ICONV=Off
    LIBXML2_WITH_TESTS=Off)

if (MSVC)
    hunter_configuration_types(libxml2 CONFIGURATION_TYPES Release)
endif()
if (HUNTER_libxml2_VERSION VERSION_GREATER "2.9.7-p0")
    hunter_download(PACKAGE_NAME libxml2 PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/libxml-2.0.pc")
else()
    hunter_download(PACKAGE_NAME libxml2)
endif()
