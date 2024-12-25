vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/jarvisto
    REF v0.3.7
    SHA512 "21ada28d7eba74359a65818782dcc7825bc9c2af6c32451f62166b4c6129a3e2dd21b69a506dbdfcd376fe97cda9484d903ff17227f05b79e42a4a2c9489869a"
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