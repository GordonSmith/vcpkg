vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO antlr/antlr3
    HEAD_REF dev
    REF "${VERSION}"
    SHA512 c565e1ade7a62bb127df707015afded9a9cea54cbf5488730a327671c57e8718f93f76c4fa28edd856810cb9c7ccbcb27b53a7c8f7e3efc8169e64cfcc535a4c
    # PATCHES
        # set-export-macro-define-as-private.patch
        # add-include-chrono.patch # https://github.com/antlr/antlr4/pull/4738
)

set(C_RUNTIME_PATH "${SOURCE_PATH}/runtime/C")
set(CPP_RUNTIME_PATH "${SOURCE_PATH}/runtime/Cpp")

vcpkg_configure_make(
    SOURCE_PATH "${C_RUNTIME_PATH}"
    AUTOCONFIG
)
vcpkg_install_make()


# set(RUNTIME_PATH "${SOURCE_PATH}/runtime/Cpp")

# message(INFO "Configure at '${RUNTIME_PATH}'")

# string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" BUILD_STATIC)
# string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" BUILD_SHARED)

# vcpkg_cmake_configure(
#     SOURCE_PATH "${RUNTIME_PATH}"
#     OPTIONS
#         -DANTLR_BUILD_STATIC=${BUILD_STATIC}
#         -DANTLR_BUILD_SHARED=${BUILD_SHARED}
#         -DANTLR3_INSTALL=ON
#         -DANTLR_BUILD_CPP_TESTS=OFF
# )

# vcpkg_cmake_install()
# vcpkg_cmake_config_fixup(PACKAGE_NAME antlr3-generator CONFIG_PATH lib/cmake/antlr3-generator DO_NOT_DELETE_PARENT_CONFIG_PATH)
# vcpkg_cmake_config_fixup(PACKAGE_NAME antlr3-runtime CONFIG_PATH lib/cmake/antlr3-runtime)

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

# vcpkg_copy_pdbs()

# vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
