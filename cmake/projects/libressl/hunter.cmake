# Copyright (c) 2025, Colm Vize
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libressl
    VERSION
    4.1.0
    URL
    "https://github.com/libressl/portable/releases/download/v4.1.0/libressl-4.1.0.tar.gz"
    SHA1
    17c9a7e38f802d47c50d747f40f8c77a2bb995ac
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libressl)
hunter_download(PACKAGE_NAME libressl)
