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
    f3501dbf428f895c658983f9125379b86ba9bc70
)

set(deps glslang pip_mako pip_pyyaml LLVM)

hunter_cmake_args(mesa CMAKE_ARGS DEPENDS_ON_PACKAGES=${deps})
hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_cacheable(mesa)
hunter_download(PACKAGE_NAME mesa)