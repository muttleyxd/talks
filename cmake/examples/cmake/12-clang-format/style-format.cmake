find_program(CLANG_FORMAT_FOUND clang-format)

if (CLANG_FORMAT_FOUND)
    add_custom_target(style-check
                      ALL
                      COMMAND ${CMAKE_SOURCE_DIR}/format.sh check ${CMAKE_SOURCE_DIR}/src)
    add_custom_target(style-format
                      COMMAND ${CMAKE_SOURCE_DIR}/format.sh format ${CMAKE_SOURCE_DIR}/src)
endif()
