# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    Qt6
    VERSION
    "6.9.1"
    URL
    "https://github.com/qt/qtbase/archive/refs/tags/v6.9.1.tar.gz"
    SHA1
    30061e33852ae8de4a58a69d6be8027d2e236465
)


find_program(NINJA_BUILD ninja)

if(NOT NINJA_BUILD)
    hunter_add_package(ninja-build)
    find_program(NINJA_BUILD ninja PATHS "${HUNTER_INSTALL_PREFIX}/bin")
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Qt6)
hunter_configuration_types(Qt6 CONFIGURATION_TYPES Release)

set(old_make_program ${CMAKE_MAKE_PROGRAM} )
set(old_generator ${CMAKE_GENERATOR})

set(CMAKE_MAKE_PROGRAM ${NINJA_BUILD})
set(CMAKE_GENERATOR "Ninja")

hunter_download(PACKAGE_NAME Qt6)

set(CMAKE_GENERATOR "${old_generator}")
set(CMAKE_MAKE_PROGRAM ${old_make_program})