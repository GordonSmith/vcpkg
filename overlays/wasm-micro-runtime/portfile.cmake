vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bytecodealliance/wasm-micro-runtime
  REF WAMR-${VERSION}
  SHA512 0da9ba63a09fc45d60cfe98c9562f2db458a0de4947b697c58ecb45ad4d40718a7fa60bf55b824b1a9c65526c89764f10b5fa161fb0f6b0eb38b3f281cf28692
  HEAD_REF main
)

# file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
# file(COPY ${CMAKE_CURRENT_LIST_DIR}/main.cpp DESTINATION ${SOURCE_PATH})

# file(COPY "${ANALYZER_PATH}/." DESTINATION "${SOURCE_PATH}/analyzers" PATTERN "*.*")
# file(COPY "${PARSE_EN_US_PATH}/." DESTINATION "${SOURCE_PATH}/analyzers/parse-en-us" PATTERN "*.*")

if (WIN32)
  set (BUILD_PLATFORM "windows")
elseif (APPLE)
  set (BUILD_PLATFORM "darwin")
elseif (UNIX)
  set (BUILD_PLATFORM "linux")
else ()
  message(SEND_ERROR "Unsupported build target platform!")
endif ()


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/product-mini/platforms/${BUILD_PLATFORM}"
    OPTIONS
    -DWAMR_BUILD_LIBC_WASI=OFF
    -DWAMR_BUILD_LIBC_UVWASI=OFF
)
vcpkg_cmake_install()
# vcpkg_cmake_config_fixup(PACKAGE_NAME "nlp-engine" CONFIG_PATH "share/cmake/nlp-engine")

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
