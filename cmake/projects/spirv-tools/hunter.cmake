# Copyright (c) 2019, Mathieu-Andre Chiasson
# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    spirv-tools
    VERSION
    2019.4-p0
    URL
    https://github.com/cpp-pm/SPIRV-Tools/archive/v2019.4-p0.tar.gz
    SHA1
    c6ea3b64476403c613e138beb12b6c5f96c0c8a6
)

hunter_add_version(
    PACKAGE_NAME
    spirv-tools
    VERSION
    2020.1-p0
    URL
    https://github.com/cpp-pm/SPIRV-Tools/archive/v2020.1-p0.tar.gz
    SHA1
    695e9abf892fe939fbe61398a06b6f177cd43e77
)

hunter_add_version(
    PACKAGE_NAME
    spirv-tools
    VERSION
    2020.4-p0
    URL
    https://github.com/cpp-pm/SPIRV-Tools/archive/v2020.4-p0.tar.gz
    SHA1
    e408dd86040ba66dbd7cdd386af96cdb11484c44
)
hunter_add_version(
    PACKAGE_NAME
    spirv-tools
    VERSION
    2025.1-p0
    URL
    https://github.com/mloccy/SPIRV-Tools/archive/refs/tags/v2025.1.tar.gz
    SHA1
    a5415ae0a114045bdd1b90aa4069ed43411048ad
)

hunter_add_version(
    PACKAGE_NAME
    spirv-tools
    VERSION
    2025.2-p0
    URL
    https://github.com/mloccy/SPIRV-Tools/archive/refs/tags/v2025.2.tar.gz
    SHA1
    4a74920139acec81bbc75548cd59eb352fcb938f
)


hunter_cmake_args(
    spirv-tools
    CMAKE_ARGS
      BUILD_TESTING=OFF
      SPIRV_SKIP_EXECUTABLES=ON
      SPIRV_SKIP_TESTS=ON
      SPIRV_WERROR=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(spirv-tools)
hunter_download(PACKAGE_NAME spirv-tools)
