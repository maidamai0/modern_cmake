
function(Doxygen)
    find_package(Doxygen REQUIRED dot OPTIONAL_COMPONENTS mscgen dia)

    # if (NOT DOXYGEN_FOUND)
    #     add_custom_target(doxygen COMMAND false
    #                             COMMENT "Doxygen not found")
    #     return()
    # endif()

    include(FetchContent)
    FetchContent_Declare(doxygen-awesome-css
    GIT_REPOSITORY
        https://github.com/jothepro/doxygen-awesome-css.git
    GIT_TAG
        v2.1.0
    )
    FetchContent_MakeAvailable(doxygen-awesome-css)

    set(DOXYGEN_GENERATE_HTML YES)
    set(DOXYGEN_HTML_OUTPUT ${PROJECT_BINARY_DIR}/doc)
    set(DOXYGEN_GENERATE_TREEVIEW     YES)
    set(DOXYGEN_HAVE_DOT              YES)
    set(DOXYGEN_DOT_IMAGE_FORMAT      svg)
    set(DOXYGEN_DOT_TRANSPARENT       YES)
    set(DOXYGEN_HTML_EXTRA_STYLESHEET ${doxygen-awesome-css_SOURCE_DIR}/doxygen-awesome.css)
    set(DOXYGEN_EXCLUDE_PATTERNS */build/*)

    doxygen_add_docs( doxygen
        ${PROJECT_SOURCE_DIR}
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        COMMENT "Generate HTML documentation"
    )
endfunction()