# Find git
find_package(Git MODULE REQUIRED)
PrintVariable(GIT_EXECUTABLE)
PrintVariable(GIT_VERSION_STRING)

# get latest commit
execute_process(COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h
    OUTPUT_VARIABLE SHA
)
message(STATUS "Commit hash is ${SHA}")

# get version
execute_process(
  COMMAND           git describe --tags --abbrev=0
  WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
  RESULT_VARIABLE   git_result
  OUTPUT_VARIABLE   git_tag
  ERROR_VARIABLE    git_error
  OUTPUT_STRIP_TRAILING_WHITESPACE
  ERROR_STRIP_TRAILING_WHITESPACE
)

if(NOT git_result EQUAL 0)
  message(FATAL_ERROR "git describe --tags --abbrev=0: ${git_error}")
endif()

if(git_tag MATCHES "^v(0|[1-9][0-9]*)[.](0|[1-9][0-9]*)[.](0|[1-9][0-9]*)[.](0|[1-9][0-9]*)$")
  set(version_major "${CMAKE_MATCH_1}")
  set(version_minor "${CMAKE_MATCH_2}")
  set(version_patch "${CMAKE_MATCH_3}")
  set(version_teak  "${CMAKE_MATCH_3}")
else()
  message(FATAL_ERROR "Git tag isn't valid semantic version: [${git_tag}]")
endif()
set(version ${version_major}.${version_minor}.${version_patch}.${version_teak})

# auto update submodule
execute_process(
    COMMAND ${GIT_EXECUTABLE} submodule update --init -- deps/dep1
    COMMAND ${GIT_EXECUTABLE} submodule update --init -- deps/dep2
    COMMAND ${GIT_EXECUTABLE} submodule update --init -- deps/dep3
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)