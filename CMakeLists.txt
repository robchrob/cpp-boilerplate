cmake_minimum_required (VERSION 3.6.3)
set(PROJ_NAME Playground)
project (${PROJ_NAME} VERSION 0.1 LANGUAGES CXX)
include(cmake/clang-cpp-tools.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${Playground_SOURCE_DIR}/bin)
file(GLOB SOURCES ${Playground_SOURCE_DIR}/src/*.[hc]pp)

add_executable(app ${SOURCES})
add_dependencies(app clang-tidy)
target_compile_options(app PRIVATE -ggdb -g3)
target_compile_options(app PRIVATE -std=c++14 -pedantic -Wall -Wextra)

set(SPDLOG_DIR ${Playground_SOURCE_DIR}/lib/spdlog/include)
include_directories(${SPDLOG_DIR})

add_subdirectory(test)
