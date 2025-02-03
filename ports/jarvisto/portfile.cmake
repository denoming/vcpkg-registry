vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/jarvisto
    REF v0.3.8
    SHA512 "369ca9a020bcc8c36d67769fb7712071845a72fbef42497ccc74fdd7a64a00e015cdf4528b88e5483e85f081a50fb11180ce214a14680da4b904fba4a08fc419"
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