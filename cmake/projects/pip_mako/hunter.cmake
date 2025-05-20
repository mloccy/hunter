# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_mako
    VERSION
    1.3.7
    URL
    "https://github.com/sqlalchemy/mako/archive/refs/tags/rel_1_3_10.tar.gz"
    SHA1
    d53e56ec2325984c808cc29da197d6b863df12eb
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_mako)
hunter_download(PACKAGE_NAME pip_mako)
