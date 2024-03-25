# VTK SDK is currently stored as a tar.xz archive on a Kitware hosted server
set(python_cp "cp${Python_VERSION_MAJOR}${Python_VERSION_MINOR}")

# enable any linux to download the right tar.xz
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
  set(VTK_SDK_BINARY_URL
      "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-${VTK_VERSION}-${python_cp}-${python_cp}-manylinux_2_17_x86_64.manylinux2014_x86_64.tar.xz"
  )
else()
  set(VTK_SDK_BINARY_URL
      "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-${VTK_VERSION}-${python_cp}-${Python_SOABI}.tar.xz"
  )
endif()
