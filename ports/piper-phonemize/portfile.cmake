vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO rhasspy/piper-phonemize
    REF bfc2e7549957829b0227c66a305d11cc88167bda
    SHA512 cb26fda2b1a944cdac627fbf6646d1002c12a781b6595f31fc78773946900f0c35806cf6f78616746d42f7ba9850cc90cd1485ccaf24a5c4ed6086b2989c608d
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
