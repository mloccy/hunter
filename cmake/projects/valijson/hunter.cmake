# Copyright (c) 2025, Colm Vize
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_configuration_types)

hunter_add_version(
    PACKAGE_NAME
    valijson
    VERSION
    1.0.6
    URL
    "https://github.com/tristanpenman/valijson/archive/refs/tags/v1.0.6.tar.gz"
    SHA1
    8f0e5d37719b180737f723563aacc22130099952
)

hunter_configuration_types(valijson CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(valijson)
hunter_download(PACKAGE_NAME valijson)
