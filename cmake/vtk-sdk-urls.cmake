
if(${PYTHON_ABI_TAG} STREQUAL "cp38-cp38")
  set(linux_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.tar.xz")
  set(linux_x86_64_sha256 "f67ab5114eeccda490bd5a7ab8e6921e0b59d51489e7f47eb0ebc7f18e7cbd93")

  set(macosx_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp38-cp38-macosx_10_10_x86_64.tar.xz")
  set(macosx_x86_64_sha256 "a97438851a029fc3e9a630261a101001f5fc2edae45710f1cb0cde2dd2899334")

  set(macosx_arm64_url    "NOTFOUND")
  set(macosx_arm64_sha256 "NOTFOUND")

  set(win_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp38-cp38-win_amd64.tar.xz")
  set(win_x86_64_sha256 "306360396efa3cffb03ecda75c4df84a89ededf05d0adfda4894d80adf2542ec")
endif()

if(${PYTHON_ABI_TAG} STREQUAL "cp39-cp39")
  set(linux_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.tar.xz")
  set(linux_x86_64_sha256 "8199f0cff9a43831eadeba0e4d89421c947002c53c030c50edb50312bb0726cd")

  set(macosx_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp39-cp39-macosx_10_10_x86_64.tar.xz")
  set(macosx_x86_64_sha256 "6a63d28a726188194fa7858d33645f43ea9ef21e696b8da91cc0536cf4c9131a")

  set(macosx_arm64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp39-cp39-macosx_11_0_arm64.tar.xz")
  set(macosx_arm64_sha256 "3747b3448b1ae0f511a389f82398a1ec5a883189ed01ed35c870ef746096ec6d")

  set(win_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp39-cp39-win_amd64.tar.xz")
  set(win_x86_64_sha256 "befbbea3bfc8584c5dd3b2c04b5ce7273eeb4581a5586adf10cb35b859609026")
endif()

if(${PYTHON_ABI_TAG} STREQUAL "cp310-cp310")
  set(linux_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.tar.xz")
  set(linux_x86_64_sha256 "79f8a8c6caf9d98aef29426637ea9eb9228682072dfa5b69bb97dc3baa2e93d7")

  set(macosx_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp310-cp310-macosx_10_10_x86_64.tar.xz")
  set(macosx_x86_64_sha256 "a0d37d8f93521753cb3bed8da3548f9f6c1f45cee493070b5dcc3801f62b33e5")

  set(macosx_arm64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp310-cp310-macosx_11_0_arm64.tar.xz")
  set(macosx_arm64_sha256 "99120ac6448907865b1feb95be4111992d2d511954d2c381bd5299ec87c6f76c")

  set(win_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp310-cp310-win_amd64.tar.xz")
  set(win_x86_64_sha256 "b85c5d48e6c36082c590276dd34458e5238cea7ae37156b5b30a2ca3e133d2b9")
endif()

if(${PYTHON_ABI_TAG} STREQUAL "cp311-cp311")
  set(linux_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.tar.xz")
  set(linux_x86_64_sha256 "dcd452e018b3a5a7a0b5dfab8e38af2ddbd0e0e387b1a8488b4516354c4a30fb")

  set(macosx_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp311-cp311-macosx_10_10_x86_64.tar.xz")
  set(macosx_x86_64_sha256 "f0bf60a0c740b9c92bb0f35cadb1f0c38d23b3994bdf24295ac986761dc6e59c")

  set(macosx_arm64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp311-cp311-macosx_11_0_arm64.tar.xz")
  set(macosx_arm64_sha256 "d2948347e7c803d8e691b48d58dd057ddb2265baf603eb0d7036a71a538e037d")

  set(win_x86_64_url    "https://vtk.org/files/wheel-sdks/vtk-wheel-sdk-9.2.5-cp311-cp311-win_amd64.tar.xz")
  set(win_x86_64_sha256 "f70dca96484ba357fad52ce4d998b6480e5717e7e1d0f707f20c494c41d7a00e")
endif()
