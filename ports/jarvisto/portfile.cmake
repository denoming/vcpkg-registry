vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO karz0n/jarvisto
    REF v0.3.1
    SHA512 bad1f8756e8d606b737d1969f0e1b476299b61e63c094c4b05e51787bac15264b4f567e6c755d6d6152ba80f839324ed2e678a419f423a962fafc7149816a8c8
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
