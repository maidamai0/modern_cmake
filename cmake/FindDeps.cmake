function(add_imported_library library headers)
    add_library(DEPS::DEPS UNKNOWN IMPORTED)
    set_target_properties(DEPS::DEPS PROPERTIES
        IMPORTED_LOCATION ${library}
        INTERFACE_INCLUDE_DIRECTORIES ${headers}
    )
    set(DEPS_FOUND 1 CACHE INTERNAL "DEPS found" FORCE)
    set(DEPS_LIBRARIES ${library}
    CACHE STRING "Path to DEPS library" FORCE)
    set(DEPS_INCLUDES ${headers}
    CACHE STRING "Path to DEPS headers" FORCE)
    mark_as_advanced(FORCE DEPS_LIBRARIES)
    mark_as_advanced(FORCE DEPS_INCLUDES)
endfunction()

if (DEPS_LIBRARIES AND DEPS_INCLUDES)
    add_imported_library(${DEPS_LIBRARIES} ${DEPS_INCLUDES})
    return()
endif()

file(TO_CMAKE_PATH "$ENV{DEPS_DIR}" _DEPS_DIR)
find_library(DEPS_LIBRARY_PATH NAMES libdeps deps
    PATHS
    ${_DEPS_DIR}/lib/${CMAKE_LIBRARY_ARCHITECTURE}
)

find_path(DEPS_HEADER_PATH NAMES deps/deps
    PATHS
    ${_DEPS_DIR}/include
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    DEPS DEFAULT_MSG DEPS_LIBRARY_PATH DEPS_HEADER_PATH
)
if (DEPS_FOUND)
    add_imported_library(
        "${DEPS_LIBRARY_PATH};${POSTGRES_LIBRARIES}"
        "${DEPS_HEADER_PATH};${POSTGRES_INCLUDE_DIRECTORIES}"
    )
endif()