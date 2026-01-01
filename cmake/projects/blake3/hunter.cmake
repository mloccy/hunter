include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)
include(hunter_source_subdir)

hunter_add_version(
  PACKAGE_NAME blake3
  VERSION "1.8.2"
  URL "https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.8.2.tar.gz"
  SHA1 "7981f8c05e1bafb08d14be055bed76b7d00ded83")

hunter_cmake_args(
  blake3
  CMAKE_ARGS
    BLAKE3_USE_TBB=OFF
    BLAKE3_TESTING=OFF
    BLAKE3_EXAMPLES=OFF
)

  hunter_source_subdir(
      blake3
      SOURCE_SUBDIR "c"
  )


hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(blake3)
hunter_download(PACKAGE_NAME blake3)
