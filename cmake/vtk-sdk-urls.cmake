# ----------------------------------------------------------------------------
# Set URLs for downloading the VTK SDK stored as a tar.xz archive on Kitware
# hosted server

# Python and ABI tags
set(python_tag "cp${Python_VERSION_MAJOR}${Python_VERSION_MINOR}")
set(abi_tag "${python_tag}")
# Platform tag
if(LINUX AND Python_SOABI MATCHES "x86_64")
  set(plaform_tag "manylinux_2_17_x86_64.manylinux2014_x86_64")
elseif(APPLE)
  set(plaform_tag "macosx_10_10_x86_64")
  if(Python_SOABI MATCHES "arm64")
    set(plaform_tag "macosx_11_0_arm64")
  endif()
elseif(WIN32)
  set(plaform_tag "win_amd64")
endif()
if(NOT DEFINED plaform_tag)
  message(
    FATAL_ERROR
      "Failed to set plaform_tag based of Python_SOABI [${Python_SOABI}]")
endif()

message(STATUS "- python_tag: ${python_tag}")
message(STATUS "- abi_tag: ${abi_tag}")
message(STATUS "- plaform_tag: ${plaform_tag}")

set(archive_name
    "vtk-wheel-sdk-${VTK_VERSION}-${python_tag}-${abi_tag}-${plaform_tag}.tar.xz"
)
set(VTK_SDK_BINARY_URL "https://vtk.org/files/wheel-sdks/${archive_name}")

message(STATUS "Setting VTK_SDK_BINARY_URL: ${VTK_SDK_BINARY_URL}")
