# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

hunter_add_version(
    PACKAGE_NAME python
    VERSION "v0.1.0"
    URL "https://github.com/mloccy/python-cmake-buildsystem/archive/refs/tags/v0.1.0.tar.gz"
    SHA1 42ddd73b9222f8e6dc5824b1262f31d265f079dd
)


hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(python)
hunter_download(PACKAGE_NAME python)
