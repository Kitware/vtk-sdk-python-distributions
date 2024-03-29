message(STATUS "Setting VTK_SDK_BINARY_URL")

# Python and ABI tags
set(python_abi_name "cp${Python_VERSION_MAJOR}${Python_VERSION_MINOR}")
set(PYTHON_ABI_TAG "${python_abi_name}-${python_abi_name}")
include(${CMAKE_CURRENT_LIST_DIR}/vtk-sdk-urls.cmake)

# Platform tag
if(LINUX)
  if(Python_SOABI MATCHES "x86_64")
    set(plaform_name "linux_x86_64")
  elseif(Python_SOABI MATCHES "arm64")
    set(plaform_name "linux_arm64")
  else()
    message(FATAL_ERROR "Unsupported SOABI [${Python_SOABI}]")
  endif()
elseif(APPLE)
  set(plaform_name "macosx_x86_64")
  if(Python_SOABI MATCHES "arm64")
    set(plaform_name "macosx_arm64")
  endif()
elseif(WIN32)
  set(plaform_name "win_x86_64")
  if(Python_SOABI MATCHES "arm64")
    set(plaform_name "win_arm64")
  endif()
else()
  message(
    FATAL_ERROR
      "Failed to set plaform_tag based of Python_SOABI [${Python_SOABI}]")
endif()

# URL and SHA256
set(VTK_SDK_BINARY_URL ${${plaform_name}_url})
message(STATUS "Setting VTK_SDK_BINARY_URL: ${VTK_SDK_BINARY_URL}")

set(VTK_SDK_EXPECTED_SHA256 ${${plaform_name}_sha256})
message(STATUS "Setting VTK_SDK_EXPECTED_SHA256: ${VTK_SDK_EXPECTED_SHA256}")

if(NOT DEFINED VTK_SDK_BINARY_URL OR NOT DEFINED VTK_SDK_EXPECTED_SHA256)
  message(FATAL_ERROR "Unsupported platform ${plaform_name}")
endif()

if(${VTK_SDK_BINARY_URL} STREQUAL "NOTFOUND" OR ${VTK_SDK_EXPECTED_SHA256} STREQUAL "NOTFOUND")
  message(FATAL_ERROR "Unsupported platform ${plaform_name}")
endif()

set(download_dir ${PROJECT_BINARY_DIR})
set(extract_dir ${PROJECT_BINARY_DIR}/vtk-wheel-sdk)

include(FetchContent)
FetchContent_Populate(
  vtkwheelsdk
  URL ${VTK_SDK_BINARY_URL}
  URL_HASH SHA256=${VTK_SDK_EXPECTED_SHA256}
  DOWNLOAD_DIR ${download_dir}
  SOURCE_DIR ${extract_dir})
