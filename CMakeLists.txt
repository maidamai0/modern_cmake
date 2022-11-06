cmake_minimum_required(VERSION 3.25)

get_filename_component(PROJECT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

project(${PROJECT_NAME}
    VERSION 1.0.0.0
    DESCRIPTION "Modern CMake tricks"
    HOMEPAGE_URL "https://github.com/maidamai0/modern_cmake"
    LANGUAGES CXX
)

if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds are not allowed")
endif()

message(STATUS "Configuring project ${CMAKE_PROJECT_NAME}: ${CMAKE_PROJECT_VERSION}")
message(STATUS "Version Major.Minor.Pathch.Tweak: "
    "${CMAKE_PROJECT_VERSION_MAJOR}."
    "${CMAKE_PROJECT_VERSION_MINOR}."
    "${CMAKE_PROJECT_VERSION_PATCH}."
    "${CMAKE_PROJECT_VERSION_TWEAK}"
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)


include(Print)
include(CXX)
include(SystemInfo)
include(GeneratorExpression)
include(Git)
include(FindDeps)
include(Analysis)
include(Doc)
include(Pack)
Doxygen()

add_executable(test_cxx_20 test_cxx_20.cpp)
add_subdirectory(lib)

Format(test_cxx_20 ${CMAKE_CURRENT_LIST_DIR})
include(Install)
