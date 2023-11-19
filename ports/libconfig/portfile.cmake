vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO hyperrealm/libconfig
    REF v1.7.3
    SHA512 3749bf9eb29bab0f6b14f4fc759f0c419ed27a843842aaabed1ec1fbe0faa8c93322ff875ca1291d69cb28a39ece86d512aec42c2140d566c38c56dc616734f4
    HEAD_REF master
)

vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
    AUTOCONFIG
)

vcpkg_install_make()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/cmake"
                    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake"
                    "${CURRENT_PACKAGES_DIR}/debug/share"
                    "${CURRENT_PACKAGES_DIR}/debug/include")

foreach(FILE "${CURRENT_PACKAGES_DIR}/include/libconfig.h++" "${CURRENT_PACKAGES_DIR}/include/libconfig.h")
  file(READ ${FILE} _contents)
  string(REPLACE "defined(LIBCONFIGXX_EXPORTS)" "0" _contents "${_contents}")
  string(REPLACE "defined(LIBCONFIG_EXPORTS)" "0" _contents "${_contents}")

  if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    string(REPLACE "defined(LIBCONFIGXX_STATIC)" "0" _contents "${_contents}")
    string(REPLACE "defined(LIBCONFIG_STATIC)" "0" _contents "${_contents}")
  else()
    string(REPLACE "defined(LIBCONFIGXX_STATIC)" "1" _contents "${_contents}")
    string(REPLACE "defined(LIBCONFIG_STATIC)" "1" _contents "${_contents}")
  endif()
  file(WRITE ${FILE} "${_contents}")
endforeach()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
