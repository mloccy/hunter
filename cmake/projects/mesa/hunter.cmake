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

set(deps zlib flex glslang pip_mako pip_pyyaml LLVM)
set(native_file_overrides flex bison llvm-config glslangValidator pkg-config)
set(native_file_hints flex bison llvm-config glslang pkg-config)
find_program(pkg_config_path pkg-config)

if (NOT pkg_config_path)
    list(APPEND deps pkg-config)
    list(APPEND native_file_overrides pkg-config)
    list(APPEND native_file_hints pkg-config)
endif()

if(WIN32)
    list(APPEND deps DirectX-Headers)
    set(meson_configure_args "gallium-drivers=llvmpipe,d3d12 vulkan-drivers=swrast")
else()
    set(meson_configure_args "gallium-drivers=llvmpipe vulkan-drivers=swrast")
endif()

hunter_cmake_args(mesa
    CMAKE_ARGS
        DEPENDS_ON_PACKAGES=${deps}
        MESON_NATIVE_PROGRAMS_OVERRIDES_HINTS=${native_file_hints}
        MESON_NATIVE_PROGRAMS_OVERRIDES_INI_NAMES=${native_file_overrides}
        MESON_CONFIGURE_OPTIONS=${meson_configure_args})

hunter_pick_scheme(DEFAULT url_sha1_meson)
hunter_cacheable(mesa)
hunter_download(PACKAGE_NAME mesa)