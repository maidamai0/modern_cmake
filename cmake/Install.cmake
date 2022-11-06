# install target
include(GNUInstallDirs)
install(TARGETS test_cxx_20 lib EXPORT ModernCMakeTargets)

# install export files
install(EXPORT ModernCMakeTargets
    NAMESPACE ModernCMake::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
)

# install config files
include(CMakePackageConfigHelpers)
set(LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/ModernCMakeConfig.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/ModernCMakeConfig.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
    PATH_VARS LIB_INSTALL_DIR
)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/ModernCMakeConfig.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
)

# install version files
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/ModernCMakeConfigVersion.cmake"
    COMPATIBILITY AnyNewerVersion
)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/ModernCMakeConfigVersion.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
)