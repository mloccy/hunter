include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

if (WIN32)
    hunter_add_version(
        PACKAGE_NAME
        pkgconf
        VERSION
        "0.26-1"
        URL
        "http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/pkg-config_0.26-1_win32.zip"
        SHA1
        67c804dec019e667fb602c066ae9020a436727c7)
else()
    hunter_pick_scheme(DEFAULT url_sha1_unpack_install)
    hunter_add_version(
        PACKAGE_NAME
        pkgconf
        VERSION
        "0.26-1"
        URL
        "https://pkgconfig.freedesktop.org/releases/pkg-config-0.26.tar.gz"
        SHA1
        fd71a70b023b9087c8a7bb76a0dc135a61059652)
endif()

set(deps gettext glib)
hunter_cmake_args(pkgconf CMAKE_ARGS DEPENDS_ON_PACKAGES=${deps})
hunter_download(PACKAGE_NAME pkgconf)