cmake_minimum_required(VERSION 3.10)

include("../common.cmake")

project(download-doctest)

set(SOURCES foo_test_main.cpp
            foo_test.cpp
            foo.cpp)
set(HEADERS foo.hpp)

# DOCUMENTATION_START {
hunter_add_package(doctest)

find_package(doctest CONFIG REQUIRED)

add_executable(doctest_test ${SOURCES} ${HEADERS})
target_link_libraries(doctest_test PUBLIC doctest::doctest)
# DOCUMENTATION_END }

enable_testing(true)
add_test(NAME doctest_test COMMAND doctest_test)
