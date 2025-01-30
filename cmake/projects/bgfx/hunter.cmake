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
    URL "https://github.com/mloccy/bgfx.cmake/archive/refs/tags/1.0.0.tar.gz"
    SHA1 b8a5c0d7a1c8933fb50e561dad6fbb9462b9b1b3
)

hunter_cmake_args(bgfx CMAKE_ARGS BGFX_BUILD_EXAMPLES=OFF BGFX_BUILD_TESTS=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(bgfx)
hunter_download(PACKAGE_NAME bgfx)
