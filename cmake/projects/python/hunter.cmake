# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)



if (NOT UNIX AND NOT APPLE)
    hunter_add_version(
        PACKAGE_NAME python
        VERSION "v0.1.0"
        URL "https://github.com/mloccy/python-cmake-buildsystem/archive/refs/tags/v0.1.0.tar.gz"
        SHA1 42ddd73b9222f8e6dc5824b1262f31d265f079dd
    )
else ()

    hunter_add_version(
        PACKAGE_NAME python
        VERSION "v0.1.0"
        URL "https://www.python.org/ftp/python/3.9.17/Python-3.9.17.tgz"
        SHA1 da39a3ee5e6b4b0d3255bfef95601890afd80709
    )

endif()

if (NOT UNIX AND NOT APPLE)
    hunter_configuration_types(xcb-proto CONFIGURATION_TYPES Release)
    hunter_pick_scheme(DEFAULT url_sha1_cmake)
else()
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
endif()


hunter_cacheable(python)
if (NOT UNIX AND NOT APPLE)
    hunter_download(PACKAGE_NAME python)
else()
    hunter_download(PACKAGE_NAME python 
    PACKAGE_INTERNAL_DEPS_ID "26"
    PACKAGE_UNRELOCATABLE_TEXT_FILES lib/pkgconfig/python3.pc)
endif()
