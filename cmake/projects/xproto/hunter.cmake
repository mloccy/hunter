# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/proto/
hunter_add_version(
    PACKAGE_NAME
    xproto
    VERSION
    "7.0.23"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/xproto-7.0.23.tar.bz2"
    SHA1
    5d7f00d1dbe6cf8e725841ef663f0ee2491ba5b2
)

# https://www.x.org/releases/individual/proto/
hunter_add_version(
    PACKAGE_NAME
    xproto
    VERSION
    "7.0.31"
    URL
    "https://www.x.org/releases/individual/proto/xproto-7.0.31.tar.bz2"
    SHA1
    779fa333c5522cca40ca810c25a8fa60b6ccedfb
)

hunter_add_version(
    PACKAGE_NAME
    xproto
    VERSION
    "2021.5"
    URL
    "https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/archive/xorgproto-2021.5/xorgproto-xorgproto-2021.5.tar.gz"
    SHA1
    a7f19b5ee37e6fb662af913b582378a4a317baf6
)

if (HUNTER_xproto_VERSION VERSION_GREATER "7.0.31")
    hunter_pick_scheme(DEFAULT url_sha1_autogen_autotools)
else()
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
endif()
hunter_configuration_types(xproto CONFIGURATION_TYPES Release)




hunter_cacheable(xproto)
if (HUNTER_xproto_VERSION VERSION_GREATER "7.0.31")
    hunter_cmake_args(
        xproto
        CMAKE_ARGS
        DEPENDS_ON_PACKAGES=xorg-macros
        PKGCONFIG_EXPORT_TARGETS=applewmproto;bigreqsproto;compositeproto;damageproto;dmxproto;dpmsproto;dri2proto;dri3proto;fixesproto;fontsproto;glproto;inputproto;kbproto;presentproto;randrproto;recordproto;renderproto;resourceproto;scrnsaverproto;videoproto;xproto;xcmiscproto;xextproto;xf86bigfontproto;xf86dgaproto;xf86driproto;xf86vidmodeproto;xineramaproto;
    )

    hunter_download(
        PACKAGE_NAME xproto
        PACKAGE_INTERNAL_DEPS_ID "4"
        PACKAGE_UNRELOCATABLE_TEXT_FILES
        "share/pkgconfig/xproto.pc"
        "share/pkgconfig/applewmproto.pc"
        "share/pkgconfig/bigreqsproto.pc"
        "share/pkgconfig/compositeproto.pc"
        "share/pkgconfig/damageproto.pc"
        "share/pkgconfig/dmxproto.pc"
        "share/pkgconfig/dpmsproto.pc"
        "share/pkgconfig/dri2proto.pc"
        "share/pkgconfig/dri3proto.pc"
        "share/pkgconfig/fixesproto.pc"
        "share/pkgconfig/fontsproto.pc"
        "share/pkgconfig/glproto.pc"
        "share/pkgconfig/inputproto.pc"
        "share/pkgconfig/kbproto.pc"
        "share/pkgconfig/presentproto.pc"
        "share/pkgconfig/randrproto.pc"
        "share/pkgconfig/recordproto.pc"
        "share/pkgconfig/renderproto.pc"
        "share/pkgconfig/resourceproto.pc"
        "share/pkgconfig/scrnsaverproto.pc"
        "share/pkgconfig/videoproto.pc"
        "share/pkgconfig/xproto.pc"
        "share/pkgconfig/xcmiscproto.pc"
        "share/pkgconfig/xextproto.pc"
        "share/pkgconfig/xf86bigfontproto.pc"
        "share/pkgconfig/xf86dgaproto.pc"
        "share/pkgconfig/xf86driproto.pc"
        "share/pkgconfig/xf86vidmodeproto.pc"
        "share/pkgconfig/xineramaproto.pc"
    )
else()
    hunter_cmake_args(
        xproto
        CMAKE_ARGS
        DEPENDS_ON_PACKAGES=xorg-macros
        PKGCONFIG_EXPORT_TARGETS=xproto
    )
    hunter_download(
        PACKAGE_NAME xproto
        PACKAGE_INTERNAL_DEPS_ID "4"
        PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/xproto.pc"
    )
endif()
