include(FindPackageHandleStandardArgs)

find_path(PICOVOICE_INCLUDE_DIR picovoice.h
    PATH_SUFFIXES picovoice
    REQUIRED
)
find_library(PICOVOICE_LIBRARY pv_rhino
    REQUIRED
)

find_package_handle_standard_args(picovoice
    REQUIRED_VARS PICOVOICE_INCLUDE_DIR
                  PICOVOICE_LIBRARY 
)

mark_as_advanced(
    PICOVOICE_INCLUDE_DIR
    PICOVOICE_LIBRARY)

add_library(picovoice::picovoice UNKNOWN IMPORTED)
set_target_properties(picovoice::picovoice PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES ${PICOVOICE_INCLUDE_DIR}
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${PICOVOICE_LIBRARY}")
