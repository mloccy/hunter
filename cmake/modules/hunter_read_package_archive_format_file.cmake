# Copyright (c) 2025, Colm Vize
# All rights reserved.
include(CMakeParseArguments) # cmake_parse_arguments
include(hunter_archive_options)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)

function(hunter_read_package_archive_format_file)

    set(one RESULT)
    cmake_parse_arguments(x "" "${one}" "" "${ARGN}")
    hunter_assert_not_empty_string("${x_RESULT}")
    hunter_assert_not_empty_string("${HUNTER_PACKAGE_HOME_DIR}")

    set(__format_filepath "${HUNTER_PACKAGE_HOME_DIR}/FORMAT")

    if (NOT EXISTS ${__format_filepath})
        hunter_internal_error(
            "'hunter_read_package_archive_format_file' error,"
            "Format file not found: ${__format_filepath}")
    endif()

    file(READ "${__format_filepath}" _format)
    hunter_assert_not_empty_string(${_format})

    set(${x_RESULT} ${_format} PARENT_SCOPE)

    hunter_status_debug("Read FORMAT file for ${HUNTER_PACKAGE_NAME} RESULT: '${_format}'")
endfunction()
