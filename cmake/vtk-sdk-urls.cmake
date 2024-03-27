# ----------------------------------------------------------------------------
# Set URLs for downloading the VTK SDK stored as a tar.xz archive on Kitware
# hosted server

message(STATUS "Setting VTK_SDK_BINARY_URL")

# Python and ABI tags
set(python_tag "cp${Python_VERSION_MAJOR}${Python_VERSION_MINOR}")
set(abi_tag "${python_tag}")
message(STATUS "  python_tag: ${python_tag}")
message(STATUS "  abi_tag: ${abi_tag}")

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
message(STATUS "  plaform_tag: ${plaform_tag}")

set(VTK_SDK_BINARY_URL
    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-${VTK_VERSION}-${python_tag}-${abi_tag}-${plaform_tag}.tar.xz"
)
message(STATUS "Setting VTK_SDK_BINARY_URL: ${VTK_SDK_BINARY_URL}")

# ----------------------------------------------------------------------------
# Set expected checksum

message(STATUS "Setting VTK_SDK_EXPECTED_SHA256")

set(sha256_9.2.5-cp38-cp38-macosx_10_10_x86_64
    "a97438851a029fc3e9a630261a101001f5fc2edae45710f1cb0cde2dd2899334")
set(sha256_9.2.5-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64
    "f67ab5114eeccda490bd5a7ab8e6921e0b59d51489e7f47eb0ebc7f18e7cbd93")
set(sha256_9.2.5-cp38-cp38-win_amd64
    "306360396efa3cffb03ecda75c4df84a89ededf05d0adfda4894d80adf2542ec")

set(sha256_9.2.5-cp39-cp39-macosx_10_10_x86_64
    "6a63d28a726188194fa7858d33645f43ea9ef21e696b8da91cc0536cf4c9131a")
set(sha256_9.2.5-cp39-cp39-macosx_11_0_arm64
    "3747b3448b1ae0f511a389f82398a1ec5a883189ed01ed35c870ef746096ec6d")
set(sha256_9.2.5-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64
    "8199f0cff9a43831eadeba0e4d89421c947002c53c030c50edb50312bb0726cd")
set(sha256_9.2.5-cp39-cp39-win_amd64
    "befbbea3bfc8584c5dd3b2c04b5ce7273eeb4581a5586adf10cb35b859609026")

set(sha256_9.2.5-cp310-cp310-macosx_10_10_x86_64
    "a0d37d8f93521753cb3bed8da3548f9f6c1f45cee493070b5dcc3801f62b33e5")
set(sha256_9.2.5-cp310-cp310-macosx_11_0_arm64
    "99120ac6448907865b1feb95be4111992d2d511954d2c381bd5299ec87c6f76c")
set(sha256_9.2.5-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64
    "79f8a8c6caf9d98aef29426637ea9eb9228682072dfa5b69bb97dc3baa2e93d7")
set(sha256_9.2.5-cp310-cp310-win_amd64
    "b85c5d48e6c36082c590276dd34458e5238cea7ae37156b5b30a2ca3e133d2b9")

set(sha256_9.2.5-cp311-cp311-macosx_10_10_x86_64
    "f0bf60a0c740b9c92bb0f35cadb1f0c38d23b3994bdf24295ac986761dc6e59c")
set(sha256_9.2.5-cp311-cp311-macosx_11_0_arm64
    "d2948347e7c803d8e691b48d58dd057ddb2265baf603eb0d7036a71a538e037d")
set(sha256_9.2.5-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64
    "dcd452e018b3a5a7a0b5dfab8e38af2ddbd0e0e387b1a8488b4516354c4a30fb")
set(sha256_9.2.5-cp311-cp311-win_amd64
    "f70dca96484ba357fad52ce4d998b6480e5717e7e1d0f707f20c494c41d7a00e")

if(NOT DEFINED sha256_${VTK_VERSION}-${python_tag}-${abi_tag}-${plaform_tag})
  message(
    FATAL_ERROR
      "Variable sha256_${VTK_VERSION}-${python_tag}-${abi_tag}-${plaform_tag} is not defined"
  )
endif()

set(VTK_SDK_EXPECTED_SHA256
    ${sha256_${VTK_VERSION}-${python_tag}-${abi_tag}-${plaform_tag}})
message(STATUS "Setting VTK_SDK_EXPECTED_SHA256: ${VTK_SDK_EXPECTED_SHA256}")
