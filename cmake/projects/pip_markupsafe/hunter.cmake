# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_markupsafe
    VERSION
    3.0.2
    URL
    "https://github.com/pallets/markupsafe/releases/download/3.0.2/markupsafe-3.0.2.tar.gz"
    SHA1
    b99c84f6c6e966a5221346989fa530afc0997884
)

set(HUNTER_REQUIRED_PYTHON_VERSION "3.8.0")
hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_markupsafe)
hunter_download(PACKAGE_NAME pip_markupsafe)
