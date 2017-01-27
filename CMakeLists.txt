cmake_minimum_required (VERSION 3.6.3)
set(PROJECT_NAME Boilerplate)
set(PROJECT_VERSION 0.1)
set(APP_NAME boiler)

set(PROJECT_SOURCE_DIR ${PROJECT_NAME}_SOURCE_DIR)

project (${PROJECT_NAME} VERSION ${PROJECT_VERSION} LANGUAGES CXX)
include(cmake/clang-cpp-tools.cmake)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
file(GLOB SOURCES ${PROJECT_SOURCE_DIR}/src/*.[hc]pp)

add_executable(${APP_NAME} ${SOURCES})
add_dependencies(${APP_NAME} clang-format)
add_dependencies(${APP_NAME} clang-tidy)
target_compile_options(${APP_NAME} PRIVATE -ggdb -g3)
target_compile_options(${APP_NAME} PRIVATE -std=c++1z -pedantic -Wall -Wextra)

set(SPDLOG_DIR ${PROJECT_SOURCE_DIR}/lib/spdlog/include)
include_directories(${SPDLOG_DIR})

add_subdirectory(test)
