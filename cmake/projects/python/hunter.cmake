# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)



if (NOT UNIX OR APPLE)
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
        SHA1 bd75def230af4e8602be83ebb9ebeb5f46f97c8b
    )

endif()

if (NOT UNIX OR APPLE)
    hunter_pick_scheme(DEFAULT url_sha1_cmake)
else()
    include(hunter_configuration_types)
    hunter_configuration_types(python CONFIGURATION_TYPES Release)
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
endif()


if (NOT UNIX OR APPLE)
    hunter_download(PACKAGE_NAME python)
else()
    set(python_dependencies autoconf-archive)
    hunter_cmake_args(
        python
        CMAKE_ARGS
        DEPENDS_ON_PACKAGES=${python_dependencies}
    )
    hunter_download(PACKAGE_NAME python
    PACKAGE_INTERNAL_DEPS_ID "26"
    PACKAGE_UNRELOCATABLE_TEXT_FILES lib/pkgconfig/python3.pc)
endif()

hunter_cacheable(python)