include(FindPackageHandleStandardArgs)

if(PiperPhonemize_FOUND)
    set(iperPhonemize_FIND_QUIETLY TRUE)
endif()

find_path(ONNX_INCLUDE_DIR onnxruntime_cxx_api.h)
find_library(ONNX_LIBRARY NAMES onnxruntime)

find_path(SNG_INCLUDE_DIR speak_lib.h PATH_SUFFIXES espeak-ng)
find_library(SNG_LIBRARY NAMES espeak-ng)

find_path(PP_INCLUDE_DIR phonemize.hpp PATH_SUFFIXES piper-phonemize)
find_library(PP_LIBRARY NAMES piper_phonemize)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PiperPhonemize
    NAME_MISMATCHED
    REQUIRED_VARS ONNX_INCLUDE_DIR ONNX_LIBRARY SNG_INCLUDE_DIR SNG_LIBRARY PP_INCLUDE_DIR PP_LIBRARY)

if(PiperPhonemize_FOUND)
    set(PiperPhonemize_LIB ${ONNX_LIBRARY} ${SNG_LIBRARY} ${PP_LIBRARY})
    set(PiperPhonemize_ONNX_LIB ${ONNX_LIBRARY} ${SNG_LIBRARY} ${PP_LIBRARY})
    set(PiperPhonemize_SNG_LIB ${ONNX_LIBRARY} ${SNG_LIBRARY} ${PP_LIBRARY})
    set(PiperPhonemize_INCLUDE_DIRS ${ONNX_INCLUDE_DIR} ${SNG_INCLUDE_DIR} ${PP_INCLUDE_DIR})
else()
    set(PiperPhonemize_LIB)
    set(PiperPhonemize_ONNX_LIB)
    set(PiperPhonemize_SNG_LIB)
    set(PiperPhonemize_INCLUDE_DIRS)
endif()

mark_as_advanced(
    ONNX_INCLUDE_DIR
    ONNX_LIBRARY
    SNG_INCLUDE_DIR
    SNG_LIBRARY
    PP_INCLUDE_DIR
    PP_LIBRARY
)
