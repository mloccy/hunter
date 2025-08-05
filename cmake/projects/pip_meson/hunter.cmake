include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_meson
    VERSION
    1.8.0-p0
    URL
    "https://github.com/mesonbuild/meson/releases/download/1.8.0/meson-1.8.0.tar.gz"
    SHA1
    42e858514e0d4820fdae8ff5b3185e029dd1c170
)


hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_meson)
hunter_download(PACKAGE_NAME pip_meson)

