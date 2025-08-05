# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)


if (WIN32)
    hunter_add_version(
        PACKAGE_NAME
        flex
        VERSION
        "2.5.25"
        URL
        "https://github.com/mloccy/winflexbison/archive/refs/tags/v2.5.25.tar.gz"
        SHA1
        de9f5b644e5a0ffe5451ba22ba2a8459f6ffc58f)
    hunter_pick_scheme(DEFAULT url_sha1_cmake)

else()

    hunter_add_version(
        PACKAGE_NAME
        flex
        VERSION
        "2.6.4"
        URL
        "https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz"
        SHA1
        fafece095a0d9890ebd618adb1f242d8908076e1)

    hunter_pick_scheme(DEFAULT url_sha1_flex_autotools)

endif()

hunter_configuration_types(flex CONFIGURATION_TYPES Release)
hunter_cacheable(flex)
hunter_download(PACKAGE_NAME flex
                PACKAGE_INTERNAL_DEPS_ID "1")
