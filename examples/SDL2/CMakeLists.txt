cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(SDL2-test)

hunter_add_package(SDL2)
find_package(SDL2 CONFIG REQUIRED)

if(ANDROID)
  add_library(main SHARED main.cpp)
else()
  add_executable(main main.cpp)
endif()

# Fix MinGW / MSYS build
if(MINGW OR MSYS)
target_link_libraries(main
    mingw32
)
endif()

target_link_libraries(main
    SDL2::SDL2main
    SDL2::SDL2)
