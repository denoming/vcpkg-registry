vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/voxer
    REF v0.2.1
    SHA512 f83bba2406db4d43bcb4c340c9f9d18e71554a644315b4c984ce77c667744b98102b6d4831d3e0ce154086e6453ba5819417eb8f50f992fe0b919304dbba275f
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DVOXER_ENABLE_TESTS=OFF
            -DVOXER_ENABLE_FORMATTED=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/voxer)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
