vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO karz0n/jarvisto
    REF v0.2.1
    SHA512 5b97b624e7162f5c078f80fe3e0d54ad86930f72bb568c2c63c81a38aa94e933eee63c487f5cdced0e505abfe063778361fa20b4dc7d03c4fb40a0bdd282dab2
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
