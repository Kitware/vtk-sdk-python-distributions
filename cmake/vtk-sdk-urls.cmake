# ----------------------------------------------------------------------------
# Set URLs for downloading the VTK SDK stored as a tar.xz archive on Kitware
# hosted server

message(STATUS "SKBUILD_SOABI: ${SKBUILD_SOABI}")
message(STATUS "Python_SOABI: ${Python_SOABI}")
message(STATUS "CMAKE_SYSTEM_PROCESSOR: ${CMAKE_SYSTEM_PROCESSOR}")

message(STATUS "Setting VTK_SDK_BINARY_URL")

# Python and ABI tags
set(python_tag "cp${Python_VERSION_MAJOR}${Python_VERSION_MINOR}")
set(abi_tag "${python_tag}")
message(STATUS "  python_tag: ${python_tag}")
message(STATUS "  abi_tag: ${abi_tag}")

# Platform tag
if(LINUX)
  if(Python_SOABI MATCHES "x86_64")
    set(platform_tag "manylinux2014_x86_64.manylinux_2_17_x86_64")
  elseif(Python_SOABI MATCHES "aarch64")
    set(platform_tag "manylinux_2_28_aarch64")
  endif()
elseif(APPLE)
  if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
    set(platform_tag "macosx_10_10_x86_64")
  elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm64")
    set(platform_tag "macosx_11_0_arm64")
  endif()
elseif(WIN32)
  set(platform_tag "win_amd64")
endif()
if(NOT DEFINED platform_tag)
  message(
    FATAL_ERROR
      "Failed to set platform_tag based of Python_SOABI [${Python_SOABI}]")
endif()
message(STATUS "  platform_tag: ${platform_tag}")

set(archive_name
    "vtk-wheel-sdk-${VTK_VERSION}-${python_tag}-${abi_tag}-${platform_tag}.tar.xz"
)
set(VTK_SDK_BINARY_URL "https://vtk.org/files/wheel-sdks/${archive_name}")
message(STATUS "Setting VTK_SDK_BINARY_URL: ${VTK_SDK_BINARY_URL}")

# ----------------------------------------------------------------------------
# Set expected checksum

message(STATUS "Setting VTK_SDK_EXPECTED_SHA256")

set(sha256_9.5.0-cp38-cp38-macosx_10_10_x86_64
    "aa9785854382bf050e8149ab1b0bce4b6aa4c8988c466d9995ba1ff9f46f92e4")
set(sha256_9.5.0-cp38-cp38-manylinux2014_x86_64.manylinux_2_17_x86_64
    "8c77a54b6b9b782d4df12635dc08f9bb952e50d62d218da6848df5ef30608f85")
set(sha256_9.5.0-cp38-cp38-manylinux_2_28_aarch64
    "1fb7a5d5c57e282f2248dfb00b602e4354b6a4c4f71ecc577baf72abd3cedbd3")
set(sha256_9.5.0-cp38-cp38-win_amd64
    "3427a5ae0940a250f1254a664e70b16b33256f09738c397c9023c7868962d319")

set(sha256_9.5.0-cp39-cp39-macosx_10_10_x86_64
    "b11f9a6269370eeac12832614b14f8fc9a8ad07f2eec4773c6e4fd3c9feae613")
set(sha256_9.5.0-cp39-cp39-macosx_11_0_arm64
    "16f365d6327a03c46c8c0670ac327e7ab9cf09e7e2c54aaba7802fc87256acd2")
set(sha256_9.5.0-cp39-cp39-manylinux2014_x86_64.manylinux_2_17_x86_64
    "c53a78818e5be5097f140ced0958de27b5b00aec4019071643c6757b382ec346")
set(sha256_9.5.0-cp39-cp39-manylinux_2_28_aarch64
    "81383e4ddcba3f36f19faaf08c169a75ba72c87cde25eb714619b77aeb899560")
set(sha256_9.5.0-cp39-cp39-win_amd64
    "29d42bf55b8e0a56c570914bdc19fa893f388b44c7a75adbac6f00c6b728f1e4")

set(sha256_9.5.0-cp310-cp310-macosx_10_10_x86_64
    "2bea290714bc7bcc2ff4410d347bb5bef1e2dc7fe1e17259dedb26565324a68d")
set(sha256_9.5.0-cp310-cp310-macosx_11_0_arm64
    "499cc8a3fe2e650ba0b3bf280b41ae537ff44a2ce2f1641759a9ebdd03f51ca9")
set(sha256_9.5.0-cp310-cp310-manylinux2014_x86_64.manylinux_2_17_x86_64
    "1eadf905db2a52c712aa5102f3b39b99d948771227f0892fb3e1696d0506893d")
set(sha256_9.5.0-cp310-cp310-manylinux_2_28_aarch64
    "bc3eb9f34415d5cadc30d5b1f25f7779327e48c871aff768e54943ef28cd25e8")
set(sha256_9.5.0-cp310-cp310-win_amd64
    "cccc2dc62a52faf92e6bfc1530bdc2be4a72a859021f284a729971e570a6cee1")

set(sha256_9.5.0-cp311-cp311-macosx_10_10_x86_64
    "8509be39dcdcfa20f6fcfceeb41ebc4d90d0039e4439d8ba30f3e79ea39eaa53")
set(sha256_9.5.0-cp311-cp311-macosx_11_0_arm64
    "97f727d87ec88b75b52d76d46ecf2d6340ec5985caa60df3bcf0019046d32b52")
set(sha256_9.5.0-cp311-cp311-manylinux2014_x86_64.manylinux_2_17_x86_64
    "7e21c4463376c16ddbbd9403a751b19553707152a0377cb07548a66838352710")
set(sha256_9.5.0-cp311-cp311-manylinux_2_28_aarch64
    "30f9a53d8d85af0b5c3a489525af32145f446f052d586d832ba162731d992a76")
set(sha256_9.5.0-cp311-cp311-win_amd64
    "dbe5e7a40c13060964dfa002225d808b9a735c52cc014ae3592bf5eec85cdb66")

set(sha256_9.5.0-cp312-cp312-macosx_10_10_x86_64
    "8751917491635db56a3e877e167dcea5f4465cc8ac9c3e0143d781aaf34a6e8a")
set(sha256_9.5.0-cp312-cp312-macosx_11_0_arm64
    "5d1075389d0a865143c76e3510a4ed17f8e0ae3e420da23e58a129ef260f6ab8")
set(sha256_9.5.0-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64
    "a0c629cae58e52fd19401adc8c88ce52e047ade1c200a9faff4fc732a3ab22bd")
set(sha256_9.5.0-cp312-cp312-manylinux_2_28_aarch64
    "67f620ba3a8ca3c5b2d16a548c46283b41e1e042012691b6dcc0066d8a9aa757")
set(sha256_9.5.0-cp312-cp312-win_amd64
    "1ccd922f8e68c06cca116f345a9de21858d9e882706f86eddee1caf93b43a923")

set(sha256_9.5.0-cp313-cp313-macosx_10_10_x86_64
    "566f1050cbf88b72e66a18a2e1f34265045f62dd134ee867e320cc4907f8951f")
set(sha256_9.5.0-cp313-cp313-macosx_11_0_arm64
    "73419c913f077e721c3ccdf2b638be49356cd30d5bdf7f5dcfafb2064e936008")
set(sha256_9.5.0-cp313-cp313-manylinux2014_x86_64.manylinux_2_17_x86_64
    "59ad0e395d7e57eb8b850f990ee7bdcb5074c25fa11a2d6da1c46b695a715659")
set(sha256_9.5.0-cp313-cp313-manylinux_2_28_aarch64
    "b221f3c3526ac7c437be3966d3abe80b0e68d141a176d67fe4a69741530038c3")
set(sha256_9.5.0-cp313-cp313-win_amd64
    "0adaf743d9d1882afe512ad3d8182ae43ec37ffc38dd42a6752ab1ad8073b288")

if(NOT DEFINED sha256_${VTK_VERSION}-${python_tag}-${abi_tag}-${platform_tag})
  message(
    FATAL_ERROR
      "Variable sha256_${VTK_VERSION}-${python_tag}-${abi_tag}-${platform_tag} is not defined"
  )
endif()

set(VTK_SDK_EXPECTED_SHA256
    ${sha256_${VTK_VERSION}-${python_tag}-${abi_tag}-${platform_tag}})
message(STATUS "Setting VTK_SDK_EXPECTED_SHA256: ${VTK_SDK_EXPECTED_SHA256}")
