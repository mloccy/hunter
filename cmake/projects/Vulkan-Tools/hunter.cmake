# Copyright (c) 2025, Colm Vize
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    Vulkan-Tools
    VERSION
    1.4.313
    URL
    https://github.com/mloccy/VulkanTools/archive/refs/tags/1.4.313.tar.gz
    SHA1
    fb45437485eb39ef9243eb326c419b897d39de75
)
hunter_configuration_types(Vulkan-Tools CONFIGURATION_TYPES Release)

hunter_cmake_args(
    Vulkan-Tools
    CMAKE_ARGS
      BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Vulkan-Tools)
hunter_download(PACKAGE_NAME Vulkan-Tools)