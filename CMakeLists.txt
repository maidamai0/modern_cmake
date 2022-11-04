cmake_minimum_required(VERSION 3.25)

get_filename_component(PROJECT_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

project(${PROJECT_NAME}
    VERSION 1.0.0.0
    DESCRIPTION "Modern CMake tricks"
    HOMEPAGE_URL "http://tonghao.yuan.com"
    LANGUAGES CXX
)

message(STATUS "Configuring project ${CMAKE_PROJECT_NAME}: ${CMAKE_PROJECT_VERSION}")
message(STATUS "Version Major.Minor.Pathch.Tweak: "
    "${CMAKE_PROJECT_VERSION_MAJOR}."
    "${CMAKE_PROJECT_VERSION_MINOR}."
    "${CMAKE_PROJECT_VERSION_PATCH}."
    "${CMAKE_PROJECT_VERSION_TWEAK}"
)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
include(Print)
include(CXX)
include(SystemInfo)