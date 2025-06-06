include(hunter_internal_error)
include(hunter_pick_archiver)
include(hunter_status_debug)
include(hunter_assert_not_empty_string)

function(hunter_get_toolchain_binaries)
  set(optional_params)
  set(one_value_params
       OUT_AR
       OUT_AS
       OUT_LD
       OUT_NM
       OUT_OBJCOPY
       OUT_OBJDUMP
       OUT_RANLIB
       OUT_STRIP
       OUT_CPP
       OUT_CC
       OUT_CXX
       OUT_AUTORECONF
       OUT_ACLOCAL
       OUT_AUTOMAKE
       OUT_LIBTOOLIZE
       OUT_AUTOUPDATE
  )
  set(multi_value_params)
  cmake_parse_arguments(
      PARAM
      "${optional_params}"
      "${one_value_params}"
      "${multi_value_params}"
      ${ARGN}
  )

  if(PARAM_UNPARSED_ARGUMENTS)
    hunter_internal_error(
        "Invalid arguments passed to hunter_get_toolchain_binaries"
        " ${PARAM_UNPARSED_ARGUMENTS}"
    )
  endif()


  string(COMPARE NOTEQUAL "${ANDROID}" "" is_android)
  string(COMPARE NOTEQUAL "${RASPBERRY_PI}" "" is_raspberry_pi)
  if(is_android)
    hunter_assert_not_empty_string("${CMAKE_CXX_ANDROID_TOOLCHAIN_MACHINE}")
    hunter_assert_not_empty_string("${CMAKE_C_ANDROID_TOOLCHAIN_PREFIX}")
    # CMAKE_C_ANDROID_TOOLCHAIN_SUFFIX can be empty

    # Extra Android variables that can't be set in toolchain
    # (some variables available only after toolchain processed).
    set(
        CMAKE_C_PREPROCESSOR
        "${CMAKE_C_ANDROID_TOOLCHAIN_PREFIX}cpp${CMAKE_C_ANDROID_TOOLCHAIN_SUFFIX}"
    )
    if(NOT EXISTS "${CMAKE_C_PREPROCESSOR}")
      # GCC has been removed from NDK r18.
      set(CMAKE_C_PREPROCESSOR "")
    endif()
  endif()

  if(is_android OR is_raspberry_pi)
    hunter_assert_not_empty_string("${CMAKE_C_FLAGS}")
    hunter_assert_not_empty_string("${CMAKE_CXX_FLAGS}")
    hunter_assert_not_empty_string("${CMAKE_AR}")
    hunter_assert_not_empty_string("${CMAKE_C_COMPILER}")
    hunter_assert_not_empty_string("${CMAKE_CXX_COMPILER}")
    hunter_assert_not_empty_string("${CMAKE_LINKER}")
    hunter_assert_not_empty_string("${CMAKE_NM}")
    hunter_assert_not_empty_string("${CMAKE_OBJCOPY}")
    hunter_assert_not_empty_string("${CMAKE_OBJDUMP}")
    hunter_assert_not_empty_string("${CMAKE_RANLIB}")
    hunter_assert_not_empty_string("${CMAKE_STRIP}")
  endif()

  # -> CMAKE_AR
  # -> CMAKE_RANLIB
  hunter_pick_archiver()

  string(COMPARE NOTEQUAL "${PARAM_OUT_AR}" "" has_out_ar)
  string(COMPARE NOTEQUAL "${PARAM_OUT_AS}" "" has_out_as)
  string(COMPARE NOTEQUAL "${PARAM_OUT_LD}" "" has_out_ld)
  string(COMPARE NOTEQUAL "${PARAM_OUT_NM}" "" has_out_nm)
  string(COMPARE NOTEQUAL "${PARAM_OUT_OBJCOPY}" "" has_out_objcopy)
  string(COMPARE NOTEQUAL "${PARAM_OUT_OBJDUMP}" "" has_out_objdump)
  string(COMPARE NOTEQUAL "${PARAM_OUT_RANLIB}" "" has_out_ranlib)
  string(COMPARE NOTEQUAL "${PARAM_OUT_STRIP}" "" has_out_strip)
  string(COMPARE NOTEQUAL "${PARAM_OUT_CPP}" "" has_out_cpp)
  string(COMPARE NOTEQUAL "${PARAM_OUT_CC}" "" has_out_cc)
  string(COMPARE NOTEQUAL "${PARAM_OUT_CXX}" "" has_out_cxx)

  string(COMPARE NOTEQUAL "${PARAM_OUT_AUTORECONF}" "" has_out_autoreconf)
  string(COMPARE NOTEQUAL "${PARAM_OUT_ACLOCAL}" "" has_out_aclocal)
  string(COMPARE NOTEQUAL "${PARAM_OUT_OUT_AUTOMAKE}" "" has_out_automake)
  string(COMPARE NOTEQUAL "${PARAM_OUT_LIBTOOLIZE}" "" has_out_libtoolize)
  string(COMPARE NOTEQUAL "${PARAM_OUT_AUTOUPDATE}" "" has_out_autoupdate)

  
  # Sets the toolchain binaries
  #   AR=${CMAKE_AR}
  #   AS=${CMAKE_ASM_COMPILER}
  #   LD=${CMAKE_LINKER}
  #   NM=${CMAKE_NM}
  #   OBJCOPY=${CMAKE_OBJCOPY}
  #   OBJDUMP=${CMAKE_OBJDUMP}
  #   RANLIB=${CMAKE_RANLIB}
  #   STRIP=${CMAKE_STRIP}
  #   CPP=${CMAKE_C_PREPROCESSOR}
  #   CC=${CMAKE_C_COMPILER}
  #   CXX=${CMAKE_CXX_COMPILER}
  #
  hunter_status_debug("Toolchain Binaries:")
  if(has_out_ar)
    hunter_status_debug("  AR=${CMAKE_AR}")
    if(CMAKE_AR)
       set(${PARAM_OUT_AR} ${CMAKE_AR} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_as)
    hunter_status_debug("  AS=${CMAKE_ASM_COMPILER}")
    if(CMAKE_ASM_COMPILER)
      set(${PARAM_OUT_AS} ${CMAKE_ASM_COMPILER} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_ld)
    hunter_status_debug("  LD=${CMAKE_LINKER}")
    if(CMAKE_LINKER)
      set(${PARAM_OUT_LD} ${CMAKE_LINKER} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_nm)
    hunter_status_debug("  NM=${CMAKE_NM}")
    if(CMAKE_NM)
      set(${PARAM_OUT_NM} ${CMAKE_NM} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_objcopy)
    hunter_status_debug("  OBJCOPY=${CMAKE_OBJCOPY}")
    if(CMAKE_OBJCOPY)
      set(${PARAM_OUT_OBJCOPY} ${CMAKE_OBJCOPY} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_objdump)
    hunter_status_debug("  OBJDUMP=${CMAKE_OBJDUMP}")
    if(CMAKE_OBJDUMP)
      set(${PARAM_OUT_OBJDUMP} ${CMAKE_OBJDUMP} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_ranlib)
    hunter_status_debug("  RANLIB=${CMAKE_RANLIB}")
    if(CMAKE_RANLIB)
      set(${PARAM_OUT_RANLIB} ${CMAKE_RANLIB} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_strip)
    hunter_status_debug("  STRIP=${CMAKE_STRIP}")
    if(CMAKE_STRIP)
      set(${PARAM_OUT_STRIP} ${CMAKE_STRIP} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_cpp)
    hunter_status_debug("  CPP=${CMAKE_C_PREPROCESSOR}")
    if(CMAKE_C_PREPROCESSOR)
      set(${PARAM_OUT_CPP} ${CMAKE_C_PREPROCESSOR} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_cc)
    hunter_status_debug("  CC=${CMAKE_C_COMPILER}")
    if(CMAKE_C_COMPILER)
      set(${PARAM_OUT_CC} ${CMAKE_C_COMPILER} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_cxx)
    hunter_status_debug("  CXX=${CMAKE_CXX_COMPILER}")
    if(CMAKE_CXX_COMPILER)
      set(${PARAM_OUT_CXX} ${CMAKE_CXX_COMPILER} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_autoreconf)
    find_program(AUTORECONF autoreconf)
    hunter_status_debug("  AUTORECONF=${AUTORECONF}")
    if (AUTORECONF)
      set(${PARAM_OUT_AUTORECONF} ${AUTORECONF} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_aclocal)
    find_program(ACLOCAL aclocal)
    hunter_status_debug("  ACLOCAL=${ACLOCAL}")
    if (ACLOCAL)
      set(${PARAM_OUT_ACLOCAL} ${ACLOCAL} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_automake)
    find_program(AUTOMAKE automake)
    hunter_status_debug("  AUTOMAKE=${AUTOMAKE}")
    if (AUTOMAKE)
      set(${PARAM_OUT_AUTOMAKE} ${AUTOMAKE} PARENT_SCOPE)
    endif()
  endif()
  if(has_out_libtoolize)
    find_program(LIBTOOLIZE libtoolize)
    hunter_status_debug("  LIBTOOLIZE=${LIBTOOLIZE}")
    if (LIBTOOLIZE)
      set(${PARAM_OUT_LIBTOOLIZE} ${LIBTOOLIZE} PARENT_SCOPE)
    endif()
  endif()

  if(has_out_autoupdate)
    find_program(AUTOUPDATE autoupdate)
    hunter_status_debug("  AUTOUPDATE=${AUTOUPDATE}")
    if (AUTOUPDATE)
      set(${PARAM_OUT_AUTOUPDATE} ${AUTOUPDATE} PARENT_SCOPE)
    endif()
  endif()

endfunction()

