
# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    wayland
    VERSION
    "1.24.0"
    URL
    "https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.24.0/downloads/wayland-1.24.0.tar.xz"
    SHA1
    0145501ee1ab8c1a168b9ad3f27b7b5a34fce6a0
)

set (config_arguments "documentation=false tests=false")

set(deps Expat libxml2)
hunter_cmake_args(
    wayland
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=${deps}
    MESON_CONFIGURE_OPTIONS=${config_arguments}
)

hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_download(PACKAGE_NAME wayland)
