set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
PrintVariable(CMAKE_CXX_STANDARD)

include(CheckIPOSupported)
check_ipo_supported(RESULT ipo_supported)
if(ipo_supported)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)
    message(STATUS "interprocedural optimization supported")
endif()

foreach(feature cxx_std_98
                cxx_std_11
                cxx_std_14
                cxx_std_17
                cxx_std_20
                cxx_std_23
                cxx_std_26
                cxx_template_template_parameters
                cxx_alias_templates
                cxx_constexpr
                cxx_variadic_templates
                cxx_aggregate_default_initializers
                cxx_return_type_deduction)
    list(FIND CMAKE_CXX_COMPILE_FEATURES ${feature} result)
    if(result EQUAL -1)
        message(WARNING "feature ${feature} not supported")
    else()
    message(STATUS "feature ${feature} is supported")
    endif()
endforeach()


# TODO (tonghao): clang_tidy, cppcheck...