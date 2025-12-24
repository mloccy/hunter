
# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    wayland-protocols
    VERSION
    "1.41.0"
    URL
    "https://github.com/wayland-mirror/wayland-protocols/archive/refs/tags/1.41.tar.gz"
    SHA1
    5091cc5df8d84ad1ebaff4493b4a027e02d94ea0
)

set (config_arguments "tests=false")

hunter_cmake_args(
    wayland-protocols
    CMAKE_ARGS
    MESON_CONFIGURE_OPTIONS=${config_arguments}
)

hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_configuration_types(wayland-protocols CONFIGURATION_TYPES Release)
hunter_download(PACKAGE_NAME wayland-protocols)
