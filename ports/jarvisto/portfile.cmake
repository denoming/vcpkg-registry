vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO karz0n/jarvisto
    REF v0.3.1
    SHA512 6574baf5214ee17442c3573c76d59723b3c53861458de46445b3d64a9950a8228ecee0805c22a17818f461e75961b4c57c1e12da99d108520fb34052bbb52589
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS -DENABLE_TESTS=OFF
            -DENABLE_DLT=ON
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/jarvisto)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
