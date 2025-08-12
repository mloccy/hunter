# Copyright (c) 2025, Colm Vize
# All rights reserved.
include(CMakeParseArguments) # cmake_parse_arguments
include(hunter_archive_options)
include(hunter_assert_not_empty_string)

function(hunter_read_package_archive_format_file)

    set(one RESULT PARENT_PATH)
    cmake_parse_arguments(x "" "${one}" "" "${ARGN}")
    hunter_assert_not_empty_string("${x_RESULT}")
    hunter_assert_not_empty_string(${x_PARENT_PATH})

    set(__format_filepath "${x_PARENT_PATH}/FORMAT")

    if (NOT EXISTS ${__format_filepath})
        hunter_status_debug(
            "'hunter_read_package_archive_format_file' error,"
            "Format file not found: ${__format_filepath}"
            "Assuming BZip2 format")
        set(${x_RESULT} ${HUNTER_ARCHIVE_BZIP2_OPTION} PARENT_SCOPE)

    else()
        file(READ "${__format_filepath}" _format)
        hunter_assert_not_empty_string(${_format})
        set(${x_RESULT} ${_format} PARENT_SCOPE)
    endif()


    hunter_status_debug("Read FORMAT file for ${HUNTER_PACKAGE_NAME} RESULT: '${_format}'")
endfunction()
