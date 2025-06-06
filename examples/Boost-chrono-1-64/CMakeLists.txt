cmake_minimum_required(VERSION 3.10)

set(Boost_DEBUG ON CACHE BOOLEAN "")
set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(Boost-chrono-1_64_0)

hunter_add_package(Boost COMPONENTS system chrono)
find_package(Boost CONFIG REQUIRED system chrono)

add_executable(foo foo.cpp)
target_link_libraries(
    foo
    PUBLIC
    Boost::chrono
    Boost::system # Should be last
        # Boost 1.66.0, Linux, Clang with -stdlib=libstdc++:
        # * https://travis-ci.org/ingenue/hunter/jobs/318140468#L2651
)
