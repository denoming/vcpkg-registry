vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/voxer
    REF v0.2.0
    SHA512 141502a3f838e3f7715a982c38ef39dec8b02cbde2b5a54e0694b1dafc8159d8eedf6abf4fd562623daf0c415a718c69e3eaa2ccae1db37cad00c2452e81c131
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
