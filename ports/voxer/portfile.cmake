vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/voxer
    REF v0.2.4
    SHA512 f42bec097a725399dbd9c312531424f617d65a58fef3365d62cce2f81a2410bb5cc3a46ec260fe2211e2e99144b27c2bdab3537d16c734d50a12244f6118714c
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

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/FindOnnxRuntime.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
