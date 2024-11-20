vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/voxer
    REF v0.2.3
    SHA512 faacfb75942abcc10cc407ee21be879b281492bd9b88a72e0d9ee3746ee80ac4fac3a6a789c69fd41e0d1336c49bf52cf6f819bfeb1af28e593771450044c4b6
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DVOXER_ENABLE_TESTS=OFF
            -DVOXER_ENABLE_CLI=OFF
            -DVOXER_ENABLE_FORMATTED=ON
            -DVOXER_VOICES_DOWNLOAD=OFF
)

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/voxer)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
