cmake_minimum_required(VERSION 3.21...4.0)

project(${SKBUILD_PROJECT_NAME} VERSION ${SKBUILD_PROJECT_VERSION})

find_package(Python COMPONENTS Interpreter Development.Module)

set(expected_version "9.5.0")
find_package(VTK ${expected_version})

set(skipped_components
    # Not VTK modules, from
    # https://gitlab.kitware.com/vtk/vtk/-/blob/master/CMake/vtkInstallCMakePackage.cmake#L19
    WrapHierarchy
    vtkbuild
    vtkplatform
    vtkpython
    pvtkpython
    WrapPython
    WrapPythonInit
    vtkjava
    ParseJava
    WrapJava
    vtkWebAssemblyTestLinkOptions
    # Public dependency to OpenXR loader
    RenderingOpenXR
    RenderingOpenXRRemoting)
foreach(comp IN LISTS VTK_AVAILABLE_COMPONENTS)
  if("${skipped_components}" MATCHES "${comp}")
    continue()
  endif()
  if(NOT VTK_${comp}_FOUND)
    message(SEND_ERROR "Expected VTK component \"${comp}\" could not be found!")
  endif()
endforeach()
