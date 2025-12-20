# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/lib/
hunter_add_version(
    PACKAGE_NAME
    xtst
    VERSION
    "1.2.1"
    URL
    "https://www.x.org/releases/X11R7.7/src/lib/libXtst-1.2.1.tar.gz"
    SHA1
    c9c68a91dc2e6824c659dc036722f347b037b188
)

hunter_configuration_types(xtst CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xtst_dependencies
    x11
    xext
    xi
)
hunter_cmake_args(
    xtst
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xtst_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xtst
)
hunter_cacheable(xtst)
hunter_download(
    PACKAGE_NAME xtst
    PACKAGE_INTERNAL_DEPS_ID "4"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXtst.la"
    "lib/pkgconfig/xtst.pc"
)
