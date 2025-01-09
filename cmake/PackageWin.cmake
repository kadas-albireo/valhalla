set(CPACK_GENERATOR)
set(CPACK_PACKAGE_HOMEPAGE_URL
    "https://github.com/valhalla/valhalla"
)

message("Will create .msi installer")

# This is for WiX so that it does not complain about unsupported WiX License
# file extension.
configure_file(
"${CMAKE_SOURCE_DIR}/COPYING" "${CMAKE_BINARY_DIR}/LICENSE.txt" COPYONLY
)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_BINARY_DIR}/LICENSE.txt")

list(APPEND CPACK_GENERATOR "WIX")
set(CPACK_OUTPUT_CONFIG_FILE "${CMAKE_BINARY_DIR}/BundleConfig.cmake")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "Valhalla")
set(CPACK_PACKAGE_DIRECTORY "${CMAKE_BINARY_DIR}")
add_custom_target(
  bundle
  COMMAND ${CMAKE_CPACK_COMMAND} "--config"
          "${CMAKE_BINARY_DIR}/BundleConfig.cmake"
  COMMENT "Running CPACK. Please wait..."
)
list(APPEND CPACK_GENERATOR "ZIP")