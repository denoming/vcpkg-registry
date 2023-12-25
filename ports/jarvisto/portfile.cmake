vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO karz0n/jarvisto
    REF v0.3.3
    SHA512 e63f6cbdd4bf1d592e00e24d683b02baf0f23abbba3d568ea5d57ee6c10f96b6815b453c35d6e7436024350b29e17b5b3a0c2cd2a82aa00dd07b1f2c8116b0dc
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
