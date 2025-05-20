include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    mesa
    VERSION
    25.0.6-p0
    URL
    "https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-25.0.6/mesa-mesa-25.0.6.tar.gz"
    SHA1
    42e858514e0d4820fdae8ff5b3185e029dd1c170
)

hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_cacheable(mesa)
hunter_download(PACKAGE_NAME mesa)