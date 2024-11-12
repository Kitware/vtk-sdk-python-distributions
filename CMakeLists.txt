cmake_minimum_required(VERSION 3.21...4.0)

set(VTK_VERSION "9.5.0") # major.minor.patch

project(
  vtk-sdk
  VERSION ${VTK_VERSION}
  DESCRIPTION "VTK SDK python distributions"
  HOMEPAGE_URL "https://github.com/Kitware/vtk-sdk-python-distributions"
  LANGUAGES NONE)

find_package(
  Python
  COMPONENTS Interpreter Development.Module
  REQUIRED)

# ----------------------------------------------------------------------------
# Download and extract vtk-wheel-sdk archive

include(cmake/vtk-sdk-urls.cmake)

set(download_dir ${PROJECT_BINARY_DIR})
set(extract_dir ${PROJECT_BINARY_DIR}/vtk-wheel-sdk)

include(FetchContent)
FetchContent_Populate(
  vtkwheelsdk
  URL ${VTK_SDK_BINARY_URL}
  URL_HASH SHA256=${VTK_SDK_EXPECTED_SHA256}
  DOWNLOAD_DIR ${download_dir}
  SOURCE_DIR ${extract_dir})

# ----------------------------------------------------------------------------
# Install content of the vtk-wheel-sdk archive

set(VTK_SDK_INSTALL_DIR "content")

# Append "/" after ${extract_dir} to ensure folder content is copied to the
# destination, instead of the folder itself.
install(
  DIRECTORY ${extract_dir}/
  DESTINATION vtk_sdk/${VTK_SDK_INSTALL_DIR}
  PATTERN "bin/*" EXCLUDE)

install(
  DIRECTORY ${extract_dir}/bin/
  DESTINATION vtk_sdk/${VTK_SDK_INSTALL_DIR}/bin
  PATTERN
    "*"
    PERMISSIONS
      OWNER_READ
      OWNER_WRITE
      OWNER_EXECUTE
      GROUP_READ
      GROUP_EXECUTE
      WORLD_READ
      WORLD_EXECUTE)

# ----------------------------------------------------------------------------
# Configure and install "cmake.prefix" entry point files

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/vtk-config.cmake.in
               ${CMAKE_CURRENT_BINARY_DIR}/vtk_sdk/cmake/vtk-config.cmake @ONLY)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/vtk-config-version.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/vtk_sdk/cmake/vtk-config-version.cmake @ONLY)

install(
  FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/vtk_sdk/cmake/__init__.py
        ${CMAKE_CURRENT_BINARY_DIR}/vtk_sdk/cmake/vtk-config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/vtk_sdk/cmake/vtk-config-version.cmake
  DESTINATION vtk_sdk/cmake)
