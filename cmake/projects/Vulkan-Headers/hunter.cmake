# Copyright (c) 2019, Rahul Sheth
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Headers
    VERSION
    1.1.127-p0
    URL
    "https://github.com/cpp-pm/Vulkan-Headers/archive/v1.1.127-p0.tar.gz"
    SHA1
    6dc8553af090daafa19ccb823d6e137ec89df4bd
)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Headers
    VERSION
    1.2.133-p0
    URL
    "https://github.com/cpp-pm/Vulkan-Headers/archive/v1.2.133-p0.tar.gz"
    SHA1
    435cc47891936db6d2f8f7fc31ae690363e2ef0f
)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Headers
    VERSION
    1.2.182-p0
    URL
    "https://github.com/cpp-pm/Vulkan-Headers/archive/v1.2.182-p0.tar.gz"
    SHA1
    8ec404420c7be25fe8b649e65850a01b28155c1e
)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Headers
    VERSION
    1.4.307-p1
    URL
    "https://github.com/mloccy/Vulkan-Headers/archive/refs/tags/v1.4.307-p1.tar.gz"
    SHA1
    16bf7d2a073bda4bcdb9feb35fcd00b7bbe030ac
)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Headers
    VERSION
    1.4.315-p0
    URL
    "https://github.com/KhronosGroup/Vulkan-Headers/archive/refs/tags/v1.4.315.tar.gz"
    SHA1
    346706c49b63ad27bbf15331be4426e90326512b
)

if("${HUNTER_Vulkan-Headers_VERSION}" VERSION_LESS "1.2.182")
    hunter_cmake_args(
        Vulkan-Headers
        CMAKE_ARGS
          VULKAN_HEADERS_SKIP_INSTALL=OFF
    )
else()
    hunter_cmake_args(
        Vulkan-Headers
        CMAKE_ARGS
          VULKAN_HEADERS_EXPORT_CMAKE_TARGETS=ON
    )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Vulkan-Headers)
hunter_download(PACKAGE_NAME Vulkan-Headers)
