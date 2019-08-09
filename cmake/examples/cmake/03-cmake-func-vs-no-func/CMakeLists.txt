cmake_minimum_required(VERSION 3.1)

project(function_vs_no_function)

function(add_flags_to_compiler)
    set(oneValueArgs COMPILER_ID FLAGS)
    cmake_parse_arguments(ADD_FLAGS "" "${oneValueArgs}" "" ${ARGN})
    if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "${ADD_FLAGS_COMPILER_ID}")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${ADD_FLAGS_FLAGS}" PARENT_SCOPE)
    endif()
endfunction()

add_flags_to_compiler(COMPILER_ID Clang VERSION_GREATER 5.0 FLAGS "-Wno-gnu-zero-variadic-macro-arguments")

if ("${CMAKE_CXX_COMPILERID}" STREQUAL "Clang")
    if("${CMAKE_CXX_COMPILER_VERSION}" VERSION_GREATER "5.0")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-gnu-zero-variadic-macro-arguments")
    endif()
endif()
