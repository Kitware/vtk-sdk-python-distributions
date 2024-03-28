cmake_minimum_required(VERSION 3.21...4.0)

project(${SKBUILD_PROJECT_NAME} VERSION ${SKBUILD_PROJECT_VERSION})

find_package(Python COMPONENTS Interpreter Development.Module)

set(expected_version "9.5.0")
find_package(VTK ${expected_version} REQUIRED)
