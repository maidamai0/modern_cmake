# Find git
find_package(Git MODULE REQUIRED)
PrintVariable(GIT_EXECUTABLE)
PrintVariable(GIT_VERSION_STRING)

# get latest commit
execute_process(COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h
    OUTPUT_VARIABLE SHA
)
message(STATUS "Commit hash is ${SHA}")

# TODO (tonghao): get latest tag and parse to version string

# auto update submodule
execute_process(
    COMMAND ${GIT_EXECUTABLE} submodule update --init -- deps/dep1
    COMMAND ${GIT_EXECUTABLE} submodule update --init -- deps/dep2
    COMMAND ${GIT_EXECUTABLE} submodule update --init -- deps/dep3
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)