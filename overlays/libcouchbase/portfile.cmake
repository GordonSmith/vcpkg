set(VERSION 3.3.2)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO couchbase/libcouchbase
  REF 3.3.2
  SHA512 e7a4e3ff2bdb2ecc0711c3b3edc5f938c1bb40cfd4a1f9b7638e9bdbbda65583587a710f0e3f3407b52c46e3fea291835258113f68527769fccc03c51ddf8cb2
  HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DLCB_NO_TESTS=ON
        -DLCB_NO_TOOLS=ON        
)
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
   
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/libcouchbase" RENAME copyright)
