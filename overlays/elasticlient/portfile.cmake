# Common Ambient Variables:
# CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
# CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
# CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
# CURRENT_INSTALLED_DIR     = ${VCPKG_ROOT_DIR}\installed\${TRIPLET}
# DOWNLOADS                 = ${VCPKG_ROOT_DIR}\downloads
# PORT                      = current port name (zlib, etc)
# TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
# VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
# VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
# VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
# VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
# VCPKG_TOOLCHAIN           = ON OFF
# TRIPLET_SYSTEM_ARCH       = arm x86 x64
# BUILD_ARCH                = "Win32" "x64" "ARM"
# MSBUILD_PLATFORM          = "Win32"/"x64"/${TRIPLET_SYSTEM_ARCH}
# DEBUG_CONFIG              = "Debug Static" "Debug Dll"
# RELEASE_CONFIG            = "Release Static"" "Release DLL"
# VCPKG_TARGET_IS_WINDOWS
# VCPKG_TARGET_IS_UWP
# VCPKG_TARGET_IS_LINUX
# VCPKG_TARGET_IS_OSX
# VCPKG_TARGET_IS_FREEBSD
# VCPKG_TARGET_IS_ANDROID
# VCPKG_TARGET_IS_MINGW
# VCPKG_TARGET_EXECUTABLE_SUFFIX
# VCPKG_TARGET_STATIC_LIBRARY_SUFFIX
# VCPKG_TARGET_SHARED_LIBRARY_SUFFIX
#
# See additional helpful variables in /docs/maintainers/vcpkg_common_definitions.md

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO seznam/elasticlient
    REF version-0.2
    SHA512 4cbdd227c3d549fb8458f4bda6eaa44e82ba6906fc5bf3c8b6986322d2447062b874ee43290ec54c3a57bf778c4c2dd04e87726457aafca7ca7674cb7e66c264
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"

    OPTIONS -DBUILD_ELASTICLIENT_TESTS=0 -DBUILD_ELASTICLIENT_EXAMPLE=0 -DUSE_SYSTEM_JSONCPP=1 -DUSE_SYSTEM_CPR=1

    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/elasticlient" RENAME copyright)
