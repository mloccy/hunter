# Copyright (c) 2015, Ruslan Baratov, David Hirvonen
# All rights reserved.

cmake_minimum_required(VERSION 3.10)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(qt-camera)

hunter_add_package(Qt COMPONENTS qtmultimedia) # Qt5MultimediaWidgets

find_package(Qt5MultimediaWidgets REQUIRED) # Qt5::MultimediaWidgets
find_package(Qt5PrintSupport REQUIRED) # Qt5::PrintSupport

if(APPLE)
  # Travis error:
  # * https://travis-ci.org/ingenue/hunter/jobs/354713684
  # * You can't use this version of (null) with this version of macOS. You have macOS 10.12.6. Qt requires macOS 10.13.0 or later.
  if(NOT TARGET Qt5::MultimediaWidgets)
    message(FATAL_ERROR "No Qt5::Widgets target")
  endif()
  return()
endif()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(
    SOURCES
    camera.cpp
    camera.h
    camera.ui
    imagesettings.cpp
    imagesettings.h
    imagesettings.ui
    main.cpp
    videosettings.cpp
    videosettings.h
    videosettings.ui
)

if(ANDROID)
  # Doesn't work in fact, working example is here:
  # * https://github.com/forexample/android-cmake/tree/master/08-declarative-camera
  add_library(qt-camera SHARED ${SOURCES})
  set_target_properties(qt-camera PROPERTIES VERSION 1.0)

  hunter_add_package(QtAndroidCMake)
  list(APPEND CMAKE_MODULE_PATH "${QTANDROIDCMAKE_ROOT}")
  include(AddQtAndroidApk)

  add_qt_android_apk(
      TARGET qt-camera-apk
      BASE_TARGET qt-camera
      LAUNCH_TARGET qt-camera-launch
      PACKAGE_NAME camera.qt # must be no '-' (API 16 error)
      MANIFEST "${CMAKE_CURRENT_LIST_DIR}/AndroidManifest.xml.in"
  )

  hunter_add_package(Android-SDK)
  message("Path to `android`: ${ANDROID-SDK_ROOT}/android-sdk/tools/android")
  message("Path to `emulator`: ${ANDROID-SDK_ROOT}/android-sdk/tools/emulator")
  message("Path to `adb`: ${ANDROID-SDK_ROOT}/android-sdk/platform-tools/adb")

else()
  add_executable(qt-camera ${SOURCES})
endif()

if(IOS)
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::OpenGL)
elseif(APPLE)
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::AVFMediaPlayerServicePlugin Qt5::AVFServicePlugin Qt5::OpenGL)
elseif(ANDROID)
  set(plugins "")
elseif(UNIX) # Linux
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::OpenGL)
elseif(WIN32)
  find_package(Qt5OpenGL REQUIRED)
  set(plugins Qt5::DSServicePlugin Qt5::OpenGL)
  if(MINGW)
    list(APPEND plugins strmiids)

    # defined: '_imp__glDepthRange'
    list(APPEND plugins opengl32)

    # defined `hb_ot_tags_from_script'
    # should be set before Qt5::Gui
    list(APPEND plugins "${QT_ROOT}/lib/libqtharfbuzzng.a")

    # defined: 'pcre16_exec'
    list(APPEND plugins "${QT_ROOT}/lib/libqtpcre.a")

    # defined: '_WSAAsyncSelect'
    list(APPEND plugins ws2_32)
  endif()
else()
  message(FATAL_ERROR "Not supported")
endif()

target_link_libraries(
  qt-camera
  PUBLIC
  Qt5::MultimediaWidgets
  Qt5::PrintSupport
  ${plugins}
)

string(COMPARE EQUAL "${CMAKE_SYSTEM_NAME}" "Linux" is_linux)

if(is_linux)
  configure_file(
      qt.conf
      ${CMAKE_CURRENT_BINARY_DIR}/qt.conf
      @ONLY
  )

  configure_file(
      env.sh
      ${CMAKE_CURRENT_BINARY_DIR}/env.sh
      @ONLY
  )

  enable_testing()
  add_test(NAME qt-camera COMMAND qt-camera)
  set_tests_properties(
      qt-camera
      PROPERTIES
      ENVIRONMENT
      "QT_DEBUG_PLUGINS=1;LD_LIBRARY_PATH=${QT_ROOT}/lib;GST_PLUGIN_SCANNER=1;GST_PLUGIN_PATH=${QT_ROOT}/lib/gstreamer-1.0"
  )
endif()
