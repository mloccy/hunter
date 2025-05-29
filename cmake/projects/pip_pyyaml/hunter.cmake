# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_pyyaml
    VERSION
    6.0.2
    URL
    "https://github.com/yaml/pyyaml/archive/refs/tags/6.0.2.tar.gz"
    SHA1
    23ce62113eac84113295692b006e123f1553adb4
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_pyyaml)
hunter_download(PACKAGE_NAME pip_pyyaml)
