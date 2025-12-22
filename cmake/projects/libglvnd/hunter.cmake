
# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libglvnd
    VERSION
    "1.7.0-p0"
    URL
    "https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v1.7.0/libglvnd-v1.7.0.tar.gz"
    SHA1
    ffc0fc6dc44ffa3707da8bfa939c9cef32cc14e5
)

set (config_arguments "egl=true c_link_args=-lxcb x11=enabled asm=enabled")

set(deps x11)
hunter_cmake_args(
    libglvnd
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=${deps}
    MESON_CONFIGURE_OPTIONS=${config_arguments}
)

hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_download(PACKAGE_NAME libglvnd)
