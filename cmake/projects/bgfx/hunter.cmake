# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

hunter_add_version(
    PACKAGE_NAME bgfx
    VERSION "1.0.0"
    URL "https://github.com/mloccy/bgfx.cmake/releases/download/1.0.0/bgfx.tar.gz"
    SHA1 01c5e53c6b43706ec21353bdf4d52e8b47cae856
)

hunter_cmake_args(bgfx CMAKE_ARGS BGFX_BUILD_EXAMPLES=OFF BGFX_BUILD_TESTS=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(bgfx)
hunter_download(PACKAGE_NAME bgfx)
