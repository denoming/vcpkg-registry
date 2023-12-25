vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/jarvisto
    REF v0.3.4
    SHA512 c61c448c7a786ceda3c6f31938157ea892d6bd00906395051a20938441879fc4ffb642f10e37dd08b8102737a72aca117d3c4e347cdfdb4fb414ee5094ba700b
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
