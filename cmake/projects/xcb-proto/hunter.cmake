# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# https://xcb.freedesktop.org/dist/
hunter_add_version(
    PACKAGE_NAME
    xcb-proto
    VERSION
    "1.17.0"
    URL
    "https://xcb.freedesktop.org/dist/xcb-proto-1.17.0.tar.gz"
    SHA1
    9b0c92edd2ec32cc086ac3f67cbefb90e2e945ab
)

hunter_add_version(
    PACKAGE_NAME
    xcb-proto
    VERSION
    "1.13"
    URL
    "https://xcb.freedesktop.org/dist/xcb-proto-1.13.tar.bz2"
    SHA1
    f7fa35ab59af18cecadbe83fe705281dcfd82ffd
)

hunter_add_version(
    PACKAGE_NAME
    xcb-proto
    VERSION
    "1.11"
    URL
    "https://xcb.freedesktop.org/dist/xcb-proto-1.11.tar.bz2"
    SHA1
    608bd60663e223464d38acec0183ddb827776401
)

# http://www.x.org/releases/X11R7.7/src/xcb/
hunter_add_version(
    PACKAGE_NAME
    xcb-proto
    VERSION
    "1.7.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/xcb/xcb-proto-1.7.1.tar.bz2"
    SHA1
    82a568559235fc6e26d0a38911c5ea18f8e8455c
)

set(xcb_proto_dependencies python)
hunter_configuration_types(xcb-proto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    xcb-proto
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=xcb-proto
    DEPENDS_ON_PACKAGES=${xcb_proto_dependencies}
    CMAKE_POSITION_INDEPENDENT_CODE=On
)
hunter_cacheable(xcb-proto)

if (HUNTER_xcb-proto_VERSION STREQUAL "1.17.0")
    hunter_download(
        PACKAGE_NAME xcb-proto
        PACKAGE_INTERNAL_DEPS_ID "3"
        PACKAGE_UNRELOCATABLE_TEXT_FILES "share/pkgconfig/xcb-proto.pc"
    )
else()
    hunter_download(
        PACKAGE_NAME xcb-proto
        PACKAGE_INTERNAL_DEPS_ID "3"
        PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/xcb-proto.pc"
    )
endif()
