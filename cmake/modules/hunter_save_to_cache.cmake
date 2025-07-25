# Copyright (c) 2015-2016, Ruslan Baratov
# All rights reserved.

include(hunter_create_cache_meta_directory)
include(hunter_create_deps_info)
include(hunter_internal_error)
include(hunter_lock_directory)
include(hunter_make_directory)
include(hunter_pack_directory)
include(hunter_patch_unrelocatable_text_files)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)
include(hunter_unpack_directory)
include(hunter_get_package_archive_format)
include(hunter_write_package_archive_format_file)

# Save results of install
# Note:
#  1. Non-install schemes is always cacheable (HUNTER_PACKAGE_SCHEME_INSTALL)
#  2. Skip everything if package is not cacheable (HUNTER_PACKAGE_CACHEABLE)
#  3. Pack everything from HUNTER_PACKAGE_INSTALL_PREFIX to Cache
#  4. Unpack archive from Cache to HUNTER_INSTALL_PREFIX
#  5. Save cache.sha1 file
function(hunter_save_to_cache)
  hunter_assert_not_empty_string("${HUNTER_CACHED_ROOT}")
  hunter_assert_not_empty_string("${HUNTER_INSTALL_PREFIX}")
  hunter_assert_not_empty_string("${HUNTER_PACKAGE_HOME_DIR}")
  hunter_assert_not_empty_string("${HUNTER_PACKAGE_INSTALL_PREFIX}")
  hunter_assert_not_empty_string("${HUNTER_PACKAGE_NAME}")

  string(COMPARE NOTEQUAL "${HUNTER_PACKAGE_COMPONENT}" "" has_component)
  string(
      COMPARE
      NOTEQUAL
      "${HUNTER_PACKAGE_INTERNAL_DEPS_ID}"
      ""
      has_internal_deps_id
  )

  set(human_readable "${HUNTER_PACKAGE_NAME}")
  if(has_component)
    set(
        human_readable
        "${human_readable} (component: ${HUNTER_PACKAGE_COMPONENT})"
    )
  endif()
  hunter_status_debug("Saving to cache: ${human_readable}")

  set(cache_file "${HUNTER_PACKAGE_HOME_DIR}/cache.sha1")

  ### Non-install packages must be saved already (see hunter_load_from_cache)
  if(NOT HUNTER_PACKAGE_SCHEME_INSTALL)
    if(NOT EXISTS "${cache_file}")
      hunter_internal_error("Cache file not found")
    endif()
    if(has_internal_deps_id)
      hunter_internal_error(
          "HUNTER_PACKAGE_INTERNAL_DEPS_ID for non-install package"
      )
    endif()
    hunter_status_debug("Non-install (already cached)")
    return()
  endif()

  ### Skip non-cacheable
  if(NOT HUNTER_PACKAGE_CACHEABLE)
    hunter_status_debug("Not cacheable")
    if(has_internal_deps_id)
      hunter_internal_error(
          "HUNTER_PACKAGE_INTERNAL_DEPS_ID for non-cacheable package"
      )
    endif()
    return()
  endif()

  hunter_patch_unrelocatable_text_files(
      FROM "${HUNTER_PACKAGE_INSTALL_PREFIX}"
      TO "__HUNTER_PACKAGE_INSTALL_PREFIX__"
      INSTALL_PREFIX "${HUNTER_PACKAGE_INSTALL_PREFIX}"
  )

  # HUNTER_INSTALL_PREFIX could be present on the text file and must be replaced
  # The cached package can be uncompressed in a different HUNTER_INSTALL_PREFIX
  # see https://github.com/ruslo/hunter/issues/472
  hunter_patch_unrelocatable_text_files(
      FROM "${HUNTER_INSTALL_PREFIX}"
      TO "__HUNTER_PACKAGE_INSTALL_PREFIX__"
      INSTALL_PREFIX "${HUNTER_PACKAGE_INSTALL_PREFIX}"
  )

  ### Lock cache directory
  set(cache_directory "${HUNTER_CACHED_ROOT}/_Base/Cache")
  hunter_lock_directory("${cache_directory}" "")

  hunter_get_package_archive_format(PACKAGE_NAME ${HUNTER_PACKAGE_NAME} RESULT _package_format)

  ### Save local install directory to cache archive
  hunter_pack_directory(
      "${HUNTER_PACKAGE_INSTALL_PREFIX}"
      "${cache_directory}/raw"
      archive_sha1
      "${_package_format}"
  )

  hunter_assert_not_empty_string("${archive_sha1}")

  ### Install to global directory from cache archive
  hunter_unpack_directory(${archive_sha1} ${_package_format})

  hunter_patch_unrelocatable_text_files(
      FROM "__HUNTER_PACKAGE_INSTALL_PREFIX__"
      TO "${HUNTER_INSTALL_PREFIX}"
      INSTALL_PREFIX "${HUNTER_INSTALL_PREFIX}"
  )

  ### Save cache meta-data
  hunter_create_cache_meta_directory("${cache_directory}" cache_meta_dir)
  hunter_assert_not_empty_string("${cache_meta_dir}")

  ### create cache.sha1 file in home (before saving dependencies)
  hunter_status_debug("Saving cache file: ${cache_file}")
  hunter_status_debug("With SHA1: ${archive_sha1}")
  file(WRITE "${cache_file}" "${archive_sha1}")

  # Sanity check
  file(READ "${cache_file}" archive_sha1_check)

  string(COMPARE EQUAL "${archive_sha1}" "${archive_sha1_check}" is_ok)
  if(NOT is_ok)
    hunter_internal_error(
        "Sanity check failed (${cache_file}):"
        " * '${archive_sha1}'"
        " * '${archive_sha1_check}'"
    )
  endif()

  # Get dependencies (non-recursively)
  if(has_component)
    hunter_get_package_deps(
        PACKAGE "${HUNTER_PACKAGE_NAME}"
        COMPONENT "${HUNTER_PACKAGE_COMPONENT}"
        RESULT basic_dependencies
    )
  else()
    hunter_get_package_deps(
        PACKAGE "${HUNTER_PACKAGE_NAME}"
        RESULT basic_dependencies
    )
  endif()
  set(basic_deps_info "${cache_meta_dir}/basic-deps.info")
  set(basic_deps_done "${cache_meta_dir}/basic-deps.DONE")
  set(basic_deps_info_nolf "${cache_meta_dir}/basic-deps.info.NOLF")
  set(basic_deps_info_temp "${cache_meta_dir}/basic-deps.info.TEMP")

  file(WRITE "${basic_deps_info_nolf}" "")
  list(LENGTH basic_dependencies len)
  if(len EQUAL 0)
    hunter_status_debug("No basic dependencies for package: ${human_readable}")
  else()
    hunter_status_debug("Basic dependencies for package: ${human_readable}")
    foreach(x ${basic_dependencies})
      hunter_status_debug("  ${x}")
      file(APPEND "${basic_deps_info_nolf}" "${x}\n")
    endforeach()
  endif()

  # About '@ONLY': no substitutions expected but COPYONLY can't be
  # used with NEWLINE_STYLE
  configure_file(
      "${basic_deps_info_nolf}"
      "${basic_deps_info_temp}"
      @ONLY
      NEWLINE_STYLE LF
  )

  if(EXISTS "${basic_deps_info}")
    if(NOT EXISTS "${basic_deps_done}")
      hunter_internal_error("File not found: ${basic_deps_done}")
    endif()
    # TEMP and saved should be the same
    file(SHA1 "${basic_deps_info}" basic_deps_info_sha1)
    file(SHA1 "${basic_deps_info_temp}" basic_deps_info_temp_sha1)
    string(
        COMPARE EQUAL
        "${basic_deps_info_sha1}" "${basic_deps_info_temp_sha1}"
        is_equal
    )
    if(NOT is_equal)
      hunter_internal_error("Basic dependencies info mismatch")
    endif()
  else()
    file(RENAME "${basic_deps_info_temp}" "${basic_deps_info}")
    file(WRITE "${basic_deps_done}" "")
  endif()

  # Get all package dependencies recursively.
  # List sorted alphabetically and saved in file in format:
  #   <package> <component> <sha1>
  #   <package> <sha1>
  set(temp_deps_info "${cache_meta_dir}/deps.info-TEMP")
  file(REMOVE "${temp_deps_info}")
  hunter_create_deps_info("${temp_deps_info}")
  if(NOT EXISTS "${temp_deps_info}")
    hunter_internal_error("Dependency list is not created: ${temp_deps_info}")
  endif()

  # Save package dependencies to file
  file(STRINGS "${temp_deps_info}" dep_list)
  list(LENGTH dep_list len)
  if(len EQUAL 0)
    hunter_status_debug("No dependencies for package: ${human_readable}")
  else()
    hunter_status_debug("Dependencies for package: ${human_readable}")
    foreach(dependency_entry ${dep_list})
      hunter_status_debug("  ${dependency_entry}")
    endforeach()
  endif()

  file(SHA1 "${temp_deps_info}" deps_sha1)
  hunter_make_directory("${cache_meta_dir}" "${deps_sha1}" cache_meta_dir)

  hunter_status_debug("Cache directory: ${cache_meta_dir}")

  set(deps_info "${cache_meta_dir}/deps.info")
  file(RENAME "${temp_deps_info}" "${deps_info}")

  hunter_status_debug("Dependencies saved: ${deps_info}")

  file(WRITE "${cache_meta_dir}/cache.sha1" "${archive_sha1}")
  file(WRITE "${cache_meta_dir}/CACHE.DONE" "")

  hunter_write_package_archive_format_file(PACKAGE_NAME ${HUNTER_PACKAGE_NAME} PARENT_PATH ${cache_meta_dir})

  # Sanity check
  file(READ "${cache_meta_dir}/cache.sha1" archive_sha1_check)

  string(COMPARE EQUAL "${archive_sha1}" "${archive_sha1_check}" is_ok)
  if(NOT is_ok)
    hunter_internal_error(
        "Sanity check failed (${cache_meta_dir}):"
        " * '${archive_sha1}'"
        " * '${archive_sha1_check}'"
    )
  endif()
endfunction()
