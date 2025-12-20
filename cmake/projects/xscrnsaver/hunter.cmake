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
    xscrnsaver
    VERSION
    "1.2.2"
    URL
    "https://www.x.org/releases/X11R7.7/src/lib/libXScrnSaver-1.2.2.tar.gz"
    SHA1
    4b8f01dee906453092f35183bff77928e67f9433
)

hunter_configuration_types(xscrnsaver CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xscrnsaver_dependencies
    x11
    xext
    xproto
)
hunter_cmake_args(
    xscrnsaver
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xscrnsaver_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xscrnsaver
)
hunter_cacheable(xscrnsaver)
hunter_download(
    PACKAGE_NAME xscrnsaver
    PACKAGE_INTERNAL_DEPS_ID "4"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXss.la"
    "lib/pkgconfig/xscrnsaver.pc"
)
