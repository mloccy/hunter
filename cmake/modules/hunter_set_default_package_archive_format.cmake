# Copyright (c) 2025, Colm Vize
# All rights reserved.
include(CMakeParseArguments) # cmake_parse_arguments
include(hunter_archive_options)
include(hunter_internal_error)
include(hunter_assert_not_empty_string)
include(hunter_set_package_archive_format)
include(hunter_status_debug)

function(hunter_set_default_package_archive_format)

    set(one PACKAGE)
    cmake_parse_arguments(x "" "${one}" "" "${ARGN}")
    hunter_assert_not_empty_string(${x_PACKAGE})

    if (NOT ${HUNTER_ARCHIVE_${x_PACKAGE}_FORMAT})
        hunter_status_debug("Setting default format for ${x_PACKAGE} to '${HUNTER_ARCHIVE_BZIP2_OPTION}'")
        hunter_set_package_archive_format(PACKAGE ${x_PACKAGE} FORMAT ${HUNTER_ARCHIVE_BZIP2_OPTION})
    endif()

endfunction()
