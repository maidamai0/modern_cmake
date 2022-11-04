message(STATUS "Checking system information")

PrintVariable(CMAKE_SYSTEM_NAME)
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message(STATUS "On Linux")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    message(STATUS "On MacOS")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message(STATUS "On Windows")
elseif(CMAKE_SYSTEM_NAME STREQUAL "AIX")
    message(STATUS "On AIX")
else()
    message(STATUS "Unsupported system")
endif()

PrintVariable(CMAKE_SYSTEM_VERSION)         # => 10.0.19044
PrintVariable(CMAKE_HOST_SYSTEM)            # => Windows-10.0.19044
PrintVariable(CMAKE_HOST_SYSTEM_NAME)       # => Windows
PrintVariable(CMAKE_HOST_SYSTEM_PROCESSOR)  # => AMD64

if(WIN32 OR CMAKE_HOST_WIN32)
    message(STATUS "32/64-bit versions of Windows/MSYS")
elseif(UNIX)
    message(STATUS "Linux, macOS, and Cygwin")
endif()

# check https://cmake.org/cmake/help/latest/command/cmake_host_system_information.html#query-host-system-specific-information for more keys
foreach(key NUMBER_OF_LOGICAL_CORES
            NUMBER_OF_PHYSICAL_CORES
            HOSTNAME
            FQDN
            TOTAL_VIRTUAL_MEMORY
            AVAILABLE_PHYSICAL_MEMORY
            IS_64BIT
            HAS_SSE
            PROCESSOR_NAME
            PROCESSOR_DESCRIPTION
            OS_PLATFORM
            DISTRIB_INFO)
    cmake_host_system_information(RESULT value QUERY ${key})
    message(STATUS "${key}: ${value}")
endforeach()

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    message(STATUS "Target is 64 bits")
else()
    message(STATUS "Target is 32 bits")
endif()

PrintVariable( CMAKE_CXX_BYTE_ORDER)