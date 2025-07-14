# Copyright (c) 2025, Colm Vize
# All rights reserved.
include(CMakeParseArguments) # cmake_parse_arguments
include(hunter_archive_options)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)
include(hunter_status_debug)

function(hunter_set_package_archive_format)

    set(one FORMAT PACKAGE_NAME)
    cmake_parse_arguments(x "" "${one}" "" "${ARGN}")

    hunter_assert_not_empty_string(${x_FORMAT})
    hunter_assert_not_empty_string(${x_PACKAGE_NAME})
    set(result_variable "HUNTER_ARCHIVE_${x_PACKAGE_NAME}_FORMAT")

    if ("${x_FORMAT}" STREQUAL "${HUNTER_ARCHIVE_BZIP2_OPTION}")
        set("${result_variable}" "${HUNTER_ARCHIVE_BZIP2_OPTION}" PARENT_SCOPE)
    elseif("${x_FORMAT}" STREQUAL "${HUNTER_ARCHIVE_GZIP_OPTION}")
        set("${result_variable}}" "${HUNTER_ARCHIVE_GZIP_OPTION}" PARENT_SCOPE)
    elseif(${x_FORMAT} STREQUAL "${HUNTER_ARCHIVE_LZMA_OPTION}")
        set("${result_variable}" "${HUNTER_ARCHIVE_LZMA_OPTION}" PARENT_SCOPE)
    else()
        hunter_internal_error(
            "'hunter_set_package_archive_format' incorrect usage,"
            "invalid format option: ${x_FORMAT} valid options are: ${HUNTER_ARCHIVE_OPTIONS}")
    endif()

    hunter_status_debug("set format for ${x_PACKAGE_NAME} to '${x_FORMAT}'")

endfunction()
