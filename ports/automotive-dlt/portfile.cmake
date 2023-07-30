vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO COVESA/dlt-daemon
    REF v2.18.9
    SHA512 a4c70eccc60cd191c8c69705d12a9e9cd59eda5d832c08993490c76c5c06ac9ac8168837580bb94333d81d3eb9635c6bf14f72232425e583e4a996c630c72d4a
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    OPTIONS -DWITH_DLT_EXAMPLES=OFF
            -DWITH_DLT_TESTS=OFF
)

vcpkg_install_cmake()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/automotive-dlt)
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
