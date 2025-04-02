vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/jarvisto
    REF v0.3.10
    SHA512 35a4a63c4333420c7f92728e72640d3ebd9db0ba96f9c872658f5e68ec509d5c006ed9abdfb5e79876098f5b1b75c934e1ac70d79f3e064cb7d0e85e681f1caa
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS -DENABLE_NETWORK_COMPONENT=ON
            -DENABLE_TESTS=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/jarvisto)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")