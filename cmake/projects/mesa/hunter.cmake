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

set(deps directx-headers flex glslang pip_mako pip_pyyaml LLVM)
set(hunter_deps directx-headers flex glslang LLVM)
set(native_file_overrides flex bison llvm-config glslangValidator)
set(native_file_hints flex bison llvm-config glslang)
set(meson_configure_args "gallium-drivers=llvmpipe vulkan-drivers=swrast")
hunter_cmake_args(mesa
    CMAKE_ARGS
        DEPENDS_ON_PACKAGES=${deps}
        HUNTER_MANAGED_DEPENDENCIES=${hunter_deps}
        MESON_NATIVE_PROGRAMS_OVERRIDES_HINTS=${native_file_overrides}
        MESON_NATIVE_PROGRAMS_OVERRIDES_INI_NAMES=${native_file_overrides}
        MESON_CONFIGURE_OPTIONS=${meson_configure_args})

hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_cacheable(mesa)
hunter_download(PACKAGE_NAME mesa)