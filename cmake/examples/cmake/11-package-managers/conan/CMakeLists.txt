cmake_minimum_required(VERSION 3.1)
project(cmake_package_managers)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS TRUE)

add_executable(tests tests.cpp)
target_link_libraries(tests PRIVATE CONAN_PKG::doctest)
