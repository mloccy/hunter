# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)
include(hunter_configuration_types)

if (NOT LINUX)
    hunter_add_version(
        PACKAGE_NAME python
        VERSION "3.9.17"
        URL "https://github.com/mloccy/python-cmake-buildsystem/archive/refs/tags/v0.1.0.tar.gz"
        SHA1 4a9ba7c91136a1d8371578cc30ff551c5c1356dc
    )
else ()

    hunter_add_version(
        PACKAGE_NAME python
        VERSION "3.9.17"
        URL "https://www.python.org/ftp/python/3.9.17/Python-3.9.17.tgz"
        SHA1 bd75def230af4e8602be83ebb9ebeb5f46f97c8b
    )

endif()

hunter_configuration_types(python CONFIGURATION_TYPES Release)

if (NOT UNIX OR APPLE)
    hunter_pick_scheme(DEFAULT url_sha1_cmake)
else()
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
endif()

hunter_cacheable(python)

if (NOT UNIX OR APPLE)
    hunter_download(PACKAGE_NAME python)
else()
    set(python_dependencies ZLIB libffi)
    hunter_cmake_args(
        python
        CMAKE_ARGS
        DEPENDS_ON_PACKAGES=${python_dependencies}
    )
    hunter_download(PACKAGE_NAME python
    PACKAGE_INTERNAL_DEPS_ID "26"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
        lib/pkgconfig/python3.pc
        bin/python
        bin/python3
        bin/python3.9)
endif()