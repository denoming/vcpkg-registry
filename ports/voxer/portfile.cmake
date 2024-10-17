vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/voxer
    REF v0.2.2
    SHA512 fa105a9bc5d61d9c756012424aeecb3c07d68a6d2c43a71f24cdd83e9d978a55b7862a86fd2ac58388c280b2a5362472221f842e80f80a1863c7b8fdeeffb26b
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
