find_path(
    TCL_INCLUDE_DIR
    tcl.h
    PATHS
      "${TCL_ROOT}/include"
    NO_DEFAULT_PATH
)

find_library(
    TCL_LIBRARY
    tcl8.6
    PATHS
      "${TCL_ROOT}/lib"
    NO_DEFAULT_PATH
)

if(NOT TCL_LIBRARY)
  if (TCL_FIND_REQUIRED)
    message(FATAL_ERROR "TCL_LIBRARY not found!")
  endif()
else()
  set(interface_libraries m z)
  if(ANDROID)
  list(APPEND interface_libraries dl)
  elseif(APPLE)
  list(APPEND interface_libraries pthread)
  else()
  list(APPEND interface_libraries dl pthread)
  endif()

  if(NOT TARGET "tcl::tcl")
  add_library("tcl::tcl" UNKNOWN IMPORTED)
  set_target_properties(
    "tcl::tcl"
    PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${TCL_INCLUDE_DIR}"
    IMPORTED_LOCATION "${TCL_LIBRARY}"
    IMPORTED_LINK_INTERFACE_LIBRARIES "${interface_libraries}"
    )
    set(TCL_FOUND TRUE)
    endif()

endif()