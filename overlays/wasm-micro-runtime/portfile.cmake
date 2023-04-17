vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bytecodealliance/wasm-micro-runtime
  REF WAMR-${VERSION}
  SHA512 0da9ba63a09fc45d60cfe98c9562f2db458a0de4947b697c58ecb45ad4d40718a7fa60bf55b824b1a9c65526c89764f10b5fa161fb0f6b0eb38b3f281cf28692
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  DISABLE_PARALLEL_CONFIGURE
  OPTIONS
)
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
