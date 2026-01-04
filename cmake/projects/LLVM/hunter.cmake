# Copyright (c) 2014-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)
include(hunter_source_subdir)
include(hunter_set_package_archive_format)
include(hunter_archive_options)


hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "18.1.8"
	URL
	"https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-18.1.8.tar.gz"
    SHA1
    a7512056b47bf93929d6d04a17c9b887d12ab83c
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "13.0.1-p2"
	URL
	"https://github.com/mloccy/llvm-project/archive/refs/tags/llvmorg-13.0.1-p2.tar.gz"
    SHA1
    dc440ff4fd30853ebc88a539431ec97043a55b5b
)


hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "13.0.1"
    URL
    "https://github.com/llvm/llvm-project/archive/llvmorg-13.0.1.tar.gz"
    SHA1
    ff95b6a8a507b334ee63c207fd6adddd794c19a3
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "13.0.0"
    URL
    "https://github.com/llvm/llvm-project/archive/llvmorg-13.0.0.tar.gz"
    SHA1
    807949B6C957B1D93B707DB45CB6E7DFFC886FA1
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "12.0.1"
    URL
    "https://github.com/llvm/llvm-project/archive/llvmorg-12.0.1.tar.gz"
    SHA1
    B608C40C5B946CE2D78C0EFA96754244FEBCF46B
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "11.0.1"
    URL
    "https://github.com/llvm/llvm-project/archive/llvmorg-11.0.1.tar.gz"
    SHA1
    99290C28654EFE520247B7859ED45CF7BC895641
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "6.0.1-p0"
    URL
    "https://github.com/hunter-packages/llvm/archive/v6.0.1-p0.tar.gz"
    SHA1
    0942eedb9f349f3de7c483600de026192cc9e3ee
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "4.0.1-p0"
    URL
    "https://github.com/hunter-packages/llvm/archive/v4.0.1-p0.tar.gz"
    SHA1
    fd70af82551d3a693c4270d71e994b810f33f593
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "3.6.2-p0"
    URL
    "https://github.com/hunter-packages/llvm/archive/v3.6.2-p0.tar.gz"
    SHA1
    81eed993cbbc7243597a4b16d2e371618156396b
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "3.6.2"
    URL
    "http://llvm.org/releases/3.6.2/llvm-3.6.2.src.tar.xz"
    SHA1
    7a00257eb2bc9431e4c77c3a36b033072c54bc7e
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "3.6.0"
    URL
    "http://llvm.org/releases/3.6.0/llvm-3.6.0.src.tar.xz"
    SHA1
    6eb2b7381d924bb3f267281c9058c817d825d824
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz"
    SHA1
    58d817ac2ff573386941e7735d30702fe71267d5
)

hunter_add_version(
    PACKAGE_NAME
    LLVM
    VERSION
    "3.4.2"
    URL
    "http://llvm.org/releases/3.4.2/llvm-3.4.2.src.tar.gz"
    SHA1
    c5287384d0b95ecb0fd7f024be2cdfb60cd94bc9
)

if(HUNTER_LLVM_VERSION VERSION_GREATER 6.0.1)
    hunter_source_subdir(LLVM SOURCE_SUBDIR llvm)
endif()

set(deps libxml2 ZLIB python)


hunter_cmake_args(
  LLVM
  CMAKE_ARGS
    LLVM_INCLUDE_EXAMPLES=OFF
    LLVM_INCLUDE_TESTS=OFF
    LLVM_INCLUDE_DOCS=OFF
    Python_ROOT=${HUNTER_INSTALL_PREFIX}
    Python2_ROOT=${HUNTER_INSTALL_PREFIX}
    Python3_ROOT=${HUNTER_INSTALL_PREFIX}
    DEPENDS_ON_PACKAGES=${deps}
)

hunter_configuration_types(LLVM CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)

if(MSVC_IDE AND HUNTER_LLVM_VERSION VERSION_LESS 4.0.1)
  hunter_report_broken_package(
      "LLVM build broken on Visual Studio, see:"
      "http://llvm.1065342.n5.nabble.com/Install-Problem-of-Compiler-rt-with-Visual-Studio-Express-2013-for-Windows-Desktop-td66575.html"
      " (use MINGW or NMake generators)"
  )
endif()

hunter_set_package_archive_format(PACKAGE_NAME LLVM FORMAT ${HUNTER_ARCHIVE_LZMA_OPTION})
hunter_cacheable(LLVM)
hunter_download(PACKAGE_NAME LLVM)
