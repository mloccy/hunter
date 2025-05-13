# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/lib
hunter_add_version(
    PACKAGE_NAME
    autoconf-archive
    VERSION
    "2024.10.16-p0"
    URL
    "https://ftp.nluug.nl/pub/gnu/autoconf-archive/autoconf-archive-2024.10.16.tar.xz"
    SHA1
    74be8b0ae9b11535dc0dba3f559ac302061e3c7f
)

hunter_configuration_types(autoconf-archive CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)

hunter_cacheable(autoconf-archive)
hunter_download(
    PACKAGE_NAME autoconf-archive
    PACKAGE_INTERNAL_DEPS_ID "17"
)
