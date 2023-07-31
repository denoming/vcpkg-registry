vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO karz0n/jarvisto
    REF v0.2.1
    SHA512 5187f34cfae6e45ca191d8d7808c0abe27fd67a090fc4596c95e318e799cf0532362e8ac185fc7e3e26b122ef9c2590b44d05f082c137aa6cbddc535238415d1
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
