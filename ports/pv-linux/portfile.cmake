vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/Picovoice/rhino/archive/refs/tags/v3.0.tar.gz"
    FILENAME "pv.v3.0.tar.gz"
    SHA512 b0793659c16dc3c38d83ca654c2ec5e23445234055f6191bdd9ceb8c0c868069091ec2605c8df0e6e64d77bb7abbed8cc7c4e660cee14cacebccdec4a942276f
)

vcpkg_extract_source_archive(SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

file(INSTALL "${SOURCE_PATH}/include/picovoice.h"
     DESTINATION "${CURRENT_PACKAGES_DIR}/include/${PORT}")
file(INSTALL "${SOURCE_PATH}/include/pv_rhino.h"
     DESTINATION "${CURRENT_PACKAGES_DIR}/include/${PORT}")

if (VCPKG_TARGET_IS_LINUX)
    file(INSTALL "${SOURCE_PATH}/lib/linux/x86_64/libpv_rhino.so"
         DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
    if (NOT VCPKG_BUILD_TYPE)
        file(INSTALL "${SOURCE_PATH}/lib/linux/x86_64/libpv_rhino.so"
             DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")        
    endif()
else()
    message(FATAL_ERROR "Target operation system is not supported")
    set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
endif()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/vcpkg-cmake-wrapper.cmake"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)