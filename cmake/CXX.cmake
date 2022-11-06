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

try_compile( compile_result SOURCES  ${CMAKE_SOURCE_DIR}/test_cxx_20.cpp
    OUTPUT_VARIABLE output_result
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF
)
message(STATUS "try compile test_cxx_20.cpp... ")
message(STATUS "${output_result}")
message(STATUS "compile test_cxx_20.cpp: ${compile_result}")

try_run(run_result compile_result ${CMAKE_BINARY_DIR}/bin
    SOURCES  ${CMAKE_SOURCE_DIR}/test_cxx_20.cpp
    OUTPUT_VARIABLE output_result
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF
)
message(STATUS "run test_cxx_20.cpp: ${output_result}")
message(STATUS "run test_cxx_20.cpp, compile: ${compile_result}")
message(STATUS "run test_cxx_20.cpp, run: ${run_result}")

# windows specific
if(MSVC)
  # add_compile_options(/fsanitize=address)
  set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
  add_compile_definitions(_UNICODE UNICODE _WINDOWS WIN32 WIN32_LEAN_AND_MEAN _SILENCE_CLANG_COROUTINE_MESSAGE)
  add_compile_options(/Zc:__cplusplus) # see https://docs.microsoft.com/en-us/cpp/build/reference/zc-cplusplus?view=msvc-160 for detail
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)