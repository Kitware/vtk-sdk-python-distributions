from __future__ import annotations

import os
import textwrap
import urllib.request

VTK_VERSION = "9.2.5"
ABI_TAGS = ["cp38-cp38", "cp39-cp39", "cp310-cp310", "cp311-cp311"]
PLATFORMS = {
    "macosx_x86_64": "macosx_10_10_x86_64",
    "macosx_arm64": "macosx_11_0_arm64",
    "linux_x86_64": "manylinux_2_17_x86_64.manylinux2014_x86_64",
    "win_x86_64": "win_amd64",
}


def download_file(url: str, filename: str):
    if not os.path.exists(filename) or os.stat(filename).st_size == 0:
        print(f"Requesting download {filename} from {url} ...")
        try:
            urllib.request.urlretrieve(url, filename)
            print("Download finished")
        except OSError as exc:
            msg = f"Failed to download {url} to {filename}: {exc}"
            raise ValueError(msg)


def generate_cmake_variables(urls_and_sha256s: dict, abi: str):
    template_inputs = {"abi": abi}

    # Get SHA256s and URLs
    for var_prefix, urls_and_sha256s_values in urls_and_sha256s.items():
        template_inputs[f"{var_prefix}_url"] = urls_and_sha256s_values[0]
        template_inputs[f"{var_prefix}_sha256"] = urls_and_sha256s_values[1]

    return textwrap.dedent("""
      if(${{PYTHON_ABI_TAG}} STREQUAL "{abi}")
        set(linux_x86_64_url    "{linux_x86_64_url}")
        set(linux_x86_64_sha256 "{linux_x86_64_sha256}")

        set(macosx_x86_64_url    "{macosx_x86_64_url}")
        set(macosx_x86_64_sha256 "{macosx_x86_64_sha256}")

        set(macosx_arm64_url    "{macosx_arm64_url}")
        set(macosx_arm64_sha256 "{macosx_arm64_sha256}")

        set(win_x86_64_url    "{win_x86_64_url}")
        set(win_x86_64_sha256 "{win_x86_64_sha256}")
      endif()
    """).format(**template_inputs)


def get_expected_shas() -> dict:
    filename = f"vtk-wheel-sdk-{VTK_VERSION}-SHA-256.txt"
    url = f"https://vtk.org/files/wheel-sdks/{filename}"
    download_file(url, filename)

    shas = {}
    with open(filename, "rb") as content:
        for line in content.readlines():
            sha256 = line.split()[0].strip().decode()
            file = line.split()[1].strip().decode()
            shas[file] = sha256

    return shas


def main():
    shas = get_expected_shas()
    cmake_code = ""
    for abi in ABI_TAGS:
        archives = {}
        for platform_name, platform_abi in PLATFORMS.items():
            filename = f"vtk-wheel-sdk-{VTK_VERSION}-{abi}-{platform_abi}.tar.xz"
            # check availability
            if filename not in shas:
                archives[platform_name] = ("NOTFOUND", "NOTFOUND")
                continue

            url = f"https://vtk.org/files/wheel-sdks/{filename}"
            archives[platform_name] = (url, shas[filename])

        cmake_code += generate_cmake_variables(archives, abi)

    with open(f"{__file__}/../cmake/vtk-sdk-urls.cmake", "wb") as file:
        file.write(cmake_code.encode())


if __name__ == "__main__":
    main()
