cmake_minimum_required(VERSION 3.21...4.0)

# Version diagnostics:
#
# * setuptools_scm (overridden) provides a clean nearest tag as project version
#   via: git describe --tags --abbrev=0 --match "v[0-9]*"
# * Normalize the tag and compare to VTK_VERSION.
#
#   * strip leading 'v'
#   * keep only MAJOR.MINOR.PATCH (ignore .<sdk-subrev> and prerelease like rc1)
set(VTK_VERSION "9.5.0") # major.minor.patch

set(_raw_tag "${SKBUILD_PROJECT_VERSION}")
# Examples:
#
# * v9.5.0       -> 9.5.0
# * v9.5.0.1     -> 9.5.0
# * v9.5.0rc1    -> 9.5.0
# * V9.5.0-rc2   -> 9.5.0
# * v9.5.0+meta  -> 9.5.0
string(REGEX REPLACE "^[v]" "" _norm_tag "${_raw_tag}")
string(REGEX REPLACE "^[v]?([0-9]+(\\.[0-9]+){2}).*" "\\1" _norm_tag
                     "${_raw_tag}")

message(STATUS "SKBUILD_PROJECT_VERSION (raw): ${SKBUILD_PROJECT_VERSION}")
message(STATUS "SKBUILD_PROJECT_VERSION (norm): ${_norm_tag}")
message(STATUS "                   VTK_VERSION: ${VTK_VERSION}")
if(NOT VTK_VERSION VERSION_EQUAL ${_norm_tag})
  message(
    WARNING
      "Hardcoded VTK version \"${VTK_VERSION}\" disagrees with tag-derived version \"${_raw_tag}\" (normalized: \"${_norm_tag}\"). "
      "This check is performed to ensure that the version is the intended one, especially when a specific tag is checked out."
      "Please ensure that git tags are up to date and that VTK_VERSION has the expected value."
  )
endif()

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
