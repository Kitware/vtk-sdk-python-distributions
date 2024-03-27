# vtk-sdk

[![Actions Status][actions-badge]][actions-link]

<!--
[![Documentation Status][rtd-badge]][rtd-link]
-->

<!--
[![PyPI version][pypi-version]][pypi-link]
[![PyPI platforms][pypi-platforms]][pypi-link]
-->

[![Discourse Forum][discourse-forum-badge]][discourse-forum-link]

<!-- SPHINX-START -->

## Overview

The Visualization Toolkit (VTK) is a robust and open-source software system that
provides advanced features in 3D computer graphics, image processing, modeling,
volume rendering, and scientific visualization. It offers threaded and
distributed-memory parallel processing for scalability and better performance.

This project is intended to distribute the content of the existing VTK wheel
SDKs as first-class `vtk-sdk` wheels.

Each `vtk-sdk` Python wheel is equipped with a scikit-build-core `cmake.prefix`
[entrypoint][scikit-build-core-entrypoint], housing the official VTK SDK sourced
from the corresponding [archive][wheel-sdks-link].

[wheel-sdks-link]: https://vtk.org/files/wheel-sdks/
[scikit-build-core-entrypoint]:
  https://scikit-build-core.readthedocs.io/en/latest/cmakelists.html#finding-other-packages

## License

VTK is distributed under the OSI-approved BSD 3-clause License. See
Copyright.txt for details.

<!-- prettier-ignore-start -->
[actions-badge]:            https://github.com/Kitware/vtk-sdk-python-distributions/workflows/CI/badge.svg
[actions-link]:             https://github.com/Kitware/vtk-sdk-python-distributions/actions
[discourse-forum-badge]:    https://img.shields.io/discourse/https/discourse.vtk.org/status.svg
[discourse-forum-link]:     https://discourse.vtk.org/

<!--
[pypi-link]:                https://pypi.org/project/vtk-sdk/
[pypi-platforms]:           https://img.shields.io/pypi/pyversions/vtk-sdk
[pypi-version]:             https://img.shields.io/pypi/v/vtk-sdk
[rtd-badge]:                https://readthedocs.org/projects/vtk-sdk/badge/?version=latest
[rtd-link]:                 https://vtk-sdk.readthedocs.io/en/latest/?badge=latest
-->

<!-- prettier-ignore-end -->
