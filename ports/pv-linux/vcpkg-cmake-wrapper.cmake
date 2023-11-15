include(FindPackageHandleStandardArgs)

find_path(PV_INCLUDE_DIR picovoice.h
    PATH_SUFFIXES picovoice
    REQUIRED)
find_library(PV_LIBRARY pv_rhino
    PATH_SUFFIXES pv-linux
    REQUIRED)

find_package_handle_standard_args(picovoice
    REQUIRED_VARS PV_INCLUDE_DIR
                  PV_LIBRARY)

set(PV_TARGET picovoice::picovoice)
add_library(${PV_TARGET} SHARED IMPORTED)
set_target_properties(${PV_TARGET} PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES ${PV_INCLUDE_DIR}
    IMPORTED_LINK_INTERFACE_LANGUAGES "C"
    IMPORTED_LOCATION "${PV_LIBRARY}")

set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_AR "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_ar.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_DE "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_de.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_ES "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_es.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_FA "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_fa.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_FR "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_fr.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_HI "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_hi.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_IT "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_it.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_JA "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_ja.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_KO "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_ko.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_NL "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_nl.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_PL "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_pl.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_PT "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_pt.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_SV "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_sv.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_VN "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_vn.pv")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_LANGUAGE_MODEL_ZN "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/common/rhino_params_zn.pv")

set_property(TARGET ${PV_TARGET}
    PROPERTY PV_CONTEXT_ALARM "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/contexts/alarm_linux.rhn")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_CONTEXT_CLOCK "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/contexts/clock_linux.rhn")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_CONTEXT_COFFEE_MAKER "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/contexts/coffee_maker_linux.rhn")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_CONTEXT_SMART_LIGHTING "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/contexts/smart_lighting_linux.rhn")
set_property(TARGET ${PV_TARGET}
    PROPERTY PV_CONTEXT_VIDEO_PLAYER "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/share/pv-linux/contexts/video_player_linux.rhn")

mark_as_advanced(
    PV_TARGET
    PV_INCLUDE_DIR
    PV_LIBRARY)
