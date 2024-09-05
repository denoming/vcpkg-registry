include(FindPackageHandleStandardArgs)

if(NOT ONNX_INCLUDE_DIR)
    find_path(ONNX_INCLUDE_DIR onnxruntime_cxx_api.h)
endif()
if (NOT ONNX_LIBRARY)
    find_library(ONNX_LIBRARY NAMES onnxruntime)
endif()
if(ONNX_INCLUDE_DIR AND ONNX_LIBRARY)
    set(_TARGET Piper::Phonemize::Onnx)
    add_library(${_TARGET} SHARED IMPORTED)
    set_target_properties(${_TARGET}
        PROPERTIES IMPORTED_LOCATION ${ONNX_LIBRARY})
    target_include_directories(${_TARGET}
        INTERFACE ${ONNX_INCLUDE_DIR})
    unset(_TARGET)
endif()

if(NOT SNG_INCLUDE_DIR)
    find_path(SNG_INCLUDE_DIR speak_lib.h PATH_SUFFIXES espeak-ng)
endif()
if(NOT SNG_LIBRARY)
    find_library(SNG_LIBRARY NAMES espeak-ng)
endif()
if(SNG_INCLUDE_DIR AND SNG_LIBRARY)
    set(_TARGET Piper::Phonemize::SpeakNg)
    add_library(${_TARGET} SHARED IMPORTED)
    set_target_properties(${_TARGET}
        PROPERTIES IMPORTED_LOCATION ${SNG_LIBRARY})
    target_include_directories(${_TARGET}
        INTERFACE ${SNG_INCLUDE_DIR})
    unset(_TARGET)
endif()

if(NOT PP_INCLUDE_DIR)
    find_path(PP_INCLUDE_DIR phonemize.hpp PATH_SUFFIXES piper-phonemize)
endif()
if(NOT PP_LIBRARY)
    find_library(PP_LIBRARY NAMES piper_phonemize)
endif()
if(PP_INCLUDE_DIR AND PP_LIBRARY)
    set(_TARGET Piper::Phonemize)
    add_library(${_TARGET} SHARED IMPORTED)
    set_target_properties(${_TARGET}
            PROPERTIES IMPORTED_LOCATION ${PP_LIBRARY})
    target_include_directories(${_TARGET}
            INTERFACE ${PP_INCLUDE_DIR})
    if(PiperPhonemize_ONNX_FOUND AND PiperPhonemize_SNG_FOUND)
        target_link_libraries(${_TARGET}
            INTERFACE Piper::Phonemize::Onnx
                      Piper::Phonemize::SpeakNg)
    endif()
    unset(_TARGET)
endif()

mark_as_advanced(ONNX_INCLUDE_DIR ONNX_LIBRARY SNG_INCLUDE_DIR SNG_LIBRARY PP_INCLUDE_DIR PP_LIBRARY)
