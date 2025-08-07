include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

if (WIN32)
    hunter_add_version(
        PACKAGE_NAME
        gettext
        VERSION
        "0.26-1"
        URL
        "http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/gettext-runtime_0.18.1.1-2_win32.zip"
        SHA1
        a7cc1ce2b99b408d1bbea9a3b4520fcaf26783b3
    )

    hunter_pick_scheme(DEFAULT url_sha1_unpack_install)
else()
    hunter_add_version(
        PACKAGE_NAME
        gettext
        VERSION
        "0.26-1"
        URL
        "https://ftp.gnu.org/pub/gnu/gettext/gettext-0.26.tar.gz"
        SHA1
        303f56fa7f0acba9400b6e92afe2f9cdcf0ce8e7
    )
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
    hunter_cacheable(gettext)
    hunter_configuration_types(gettext CONFIGURATION_TYPES Release)
endif()
hunter_download(PACKAGE_NAME gettext)