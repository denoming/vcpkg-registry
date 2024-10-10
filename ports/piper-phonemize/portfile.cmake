vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO denoming/piper-phonemize
    REF 20a370d6ac6b3edc5cab4f538abfbdcd5cfa6c20
    SHA512 3f12f68f61c89c33eb717adf7af7937cbf7370f613e9336dee09edd8cc67b7b02a8f58aabf3ab19bbcd5dbf55d799fe514e94b760ddb08b659370633f5d1685a
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")

file(INSTALL "${CURRENT_PORT_DIR}/FindPiperPhonemize.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${CURRENT_PORT_DIR}/vcpkg-cmake-wrapper.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${CURRENT_PORT_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
