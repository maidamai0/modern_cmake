# format
function(Format target directory)
    find_program(CLANG-FORMAT_PATH clang-format REQUIRED)
    set(SOURCES h hpp hh c cc cxx cpp)
    list(TRANSFORM SOURCES PREPEND "${directory}/*.")
    file(GLOB_RECURSE SOURCE_FILES FOLLOW_SYMLINKS LIST_DIRECTORIES false ${SOURCES})

    add_custom_command(
        TARGET ${target}
        PRE_BUILD
        COMMAND ${CLANG-FORMAT_PATH} -i --style=llvm ${SOURCE_FILES}
        COMMENT "format on target: ${target}"
    )
endfunction(Format)

# add clang-tidy
# https://www.kitware.com//static-checks-with-cmake-cdash-iwyu-clang-tidy-lwyu-cpplint-and-cppcheck/
function(AddClangTidy target)
    find_program(CLANG-TIDY_PATH clang-tidy REQUIRED)
    set_target_properties(${target}
        PROPERTIES CXX_CLANG_TIDY
        "${CLANG-TIDY_PATH};-checks=*;--warnings-as-errors=*"
    )
endfunction()