
# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    xkbcommon
    VERSION
    "1.24.0"
    URL
    "https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-1.13.1.tar.gz"
    SHA1
    f487d1e7f5e362b8971e23e354d9eb4bdc51e453
)

set (config_arguments "enable-docs=false enable-tools=false enable-x11=true enable-wayland=true c_link_args=-lXau")

set(deps bison xcb libxml2)
hunter_cmake_args(
    xkbcommon
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=${deps}
    MESON_CONFIGURE_OPTIONS=${config_arguments}
)

hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_download(PACKAGE_NAME xkbcommon)
