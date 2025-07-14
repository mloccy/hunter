# Copyright (c) 2025, Colm Vize
# All rights reserved.
include(CMakeParseArguments) # cmake_parse_arguments
include(hunter_archive_options)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)
include(hunter_get_package_archive_format)
include(hunter_status_debug)

function(hunter_write_package_archive_format_file)

    set(one PACKAGE_NAME PARENT_PATH)
    cmake_parse_arguments(x "" "${one}" "" "${ARGN}")
    hunter_assert_not_empty_string(${x_PACKAGE_NAME})
    hunter_assert_not_empty_string(${x_PARENT_PATH})

    hunter_get_package_archive_format(
        PACKAGE_NAME ${x_PACKAGE_NAME}
        RESULT _package_format)

    set(__format_filepath "${x_PARENT_PATH}/FORMAT")
    file(WRITE "${__format_filepath}" "${_package_format}")
    file(READ "${__format_filepath}" _format_sanity_check)
    string(COMPARE EQUAL "${_format_sanity_check}" "${_package_format}" is_ok)

    if (NOT is_ok)
        hunter_internal_error(
            "Sanity check failed (${__format_filepath}):"
            " * '${_package_format}'"
            " * '${_format_sanity_check}'")
    endif()
    hunter_status_debug("Wrote FORMAT file for ${x_PACKAGE_NAME} RESULT: '${_package_format}'")
endfunction()
