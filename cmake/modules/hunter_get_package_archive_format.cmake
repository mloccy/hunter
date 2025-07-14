# Copyright (c) 2025, Colm Vize
# All rights reserved.
include(CMakeParseArguments) # cmake_parse_arguments
include(hunter_archive_options)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)

function(hunter_get_package_archive_format)

    set(one PACKAGE RESULT)
    cmake_parse_arguments(x "" "${one}" "" "${ARGN}")

    hunter_assert_not_empty_string(${x_PACKAGE})
    hunter_assert_not_empty_string(${x_RESULT})


    if (NOT ${HUNTER_ARCHIVE_${x_PACKAGE}_FORMAT})
        hunter_internal_error(
            "'hunter_get_package_archive_format' error,"
            "'hunter_set_package_archive_format' was not called for ${x_PACKAGE}!")
    else()
        set(${x_RESULT} ${HUNTER_ARCHIVE_${x_PACKAGE}_FORMAT} PARENT_SCOPE)
    endif()
endfunction()