list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")

include(FindPackageHandleStandardArgs)
include(FindPiperPhonemize)

if(PiperPhonemize_FOUND)
    set(_TARGET Piper::Phonemize)
    if (NOT TARGET ${_TARGET})
        add_library(${_TARGET} SHARED IMPORTED)
        set_target_properties(${_TARGET}
            PROPERTIES IMPORTED_LOCATION ${PiperPhonemize_LIB})
        target_link_libraries(${_TARGET}
            INTERFACE ${PiperPhonemize_ONNX_LIB} ${PiperPhonemize_SNG_LIB})
        target_include_directories(${_TARGET}
            INTERFACE ${PiperPhonemize_INCLUDE_DIR})
    endif()
    unset(_TARGET)
endif()
