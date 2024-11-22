vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/jarvisto
    REF v0.3.5
    SHA512 c99414f0afdf97cd837bba5c66e25def7cc0742d6639b2846659056a99e085e36bccb608747852784c0e5559cf6e7d0d8558b5d5b7ab71b8a138f8036a32f624
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS -DENABLE_TESTS=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/jarvisto)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
