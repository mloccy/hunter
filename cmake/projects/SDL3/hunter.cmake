# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)
include(hunter_cmake_args)



hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.3.6-p0"
        URL
        "https://github.com/mloccy/SDL/archive/refs/tags/SDL3.3.6-hunter.tar.gz"
        SHA1
        ca5a58758898e7ca633031ff97478cd1ee8ab9a2
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.0.5-alpha"
        URL
        "https://github.com/mloccy/SDL/archive/refs/tags/v3.0.5-alpha.tar.gz"
        SHA1
        11fa89fb6bcda62d419720831d16c1a28d1bed98
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.0.4-alpha"
        URL
        "https://codeload.github.com/mloccy/SDL/tar.gz/refs/tags/v3.0.4-alpha"
        SHA1
        99de4ba345f2c88b49d78925954e982b7ef45c8a
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.0.3-alpha"
        URL
        "https://codeload.github.com/mloccy/SDL/tar.gz/refs/tags/v3.0.3-alpha"
        SHA1
        4846409fe721859194643686471c774027fc8e29
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.0.2-alpha"
        URL
        "https://codeload.github.com/mloccy/SDL/tar.gz/refs/tags/v3.0.2-alpha"
        SHA1
        4057d5b9ce99d9a4b92fd5d5ded94636961bee24
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.0.1-alpha"
        URL
        "https://codeload.github.com/mloccy/SDL/tar.gz/refs/tags/v3.0.1-alpha"
        SHA1
        aa527d3da230129d5287f151133e2a192c6a3a08
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.0.0-alpha"
        URL
        "https://codeload.github.com/mloccy/SDL/tar.gz/refs/tags/v3.0.0-alpha"
        SHA1
        d7fea0137a2a5ad03182dafcc066f5c7d6ee04c4
)

hunter_cmake_args(SDL3 CMAKE_ARGS CMAKE_POSITION_INDEPENDENT_CODE=On)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL3)
hunter_download(PACKAGE_NAME SDL3)
