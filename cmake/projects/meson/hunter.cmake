include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    meson
    VERSION
    1.8.0-p0
    URL
    "https://github.com/mesonbuild/meson/releases/download/1.8.0/meson-1.8.0.tar.gz"
    SHA1
    da39a3ee5e6b4b0d3255bfef95601890afd80709
)


hunter_pick_scheme(DEFAULT meson)
hunter_cacheable(meson)
hunter_download(PACKAGE_NAME meson)

