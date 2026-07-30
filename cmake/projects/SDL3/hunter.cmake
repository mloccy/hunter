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
        "v3.3.6-p3"
        URL
        "https://github.com/mloccy/SDL/archive/refs/tags/SDL3.3.6-hunter-p3.tar.gz"
        SHA1
        c654e5c125389ed322f2925598f8dafd1da9d2d6
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.3.6-p2"
        URL
        "https://github.com/mloccy/SDL/archive/refs/tags/SDL3.3.6-hunter-p2.tar.gz"
        SHA1
        be09810ce58f2009990d65913af7dea2dd11a637
)

hunter_add_version(
        PACKAGE_NAME
        SDL3
        VERSION
        "v3.3.6-p1"
        URL
        "https://github.com/mloccy/SDL/archive/refs/tags/SDL3.3.6-hunter-p1.tar.gz"
        SHA1
        6d090faf871726b3321f2df21ad5287ebbe03711
)

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

hunter_cmake_args(SDL3 CMAKE_ARGS CMAKE_POSITION_INDEPENDENT_CODE=ON SDL_SHARED=ON SDL_STATIC=ON SDL_WAYLAND_SHARED=OFF SDL_X11_SHARED=OFF SDL_TEST_LIBRARY=OFF)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SDL3)
hunter_download(PACKAGE_NAME SDL3)
