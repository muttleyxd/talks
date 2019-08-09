cmake_minimum_required(VERSION 3.1)
project(ctest_example)

string(APPEND CMAKE_CXX_FLAGS " -fprofile-arcs -ftest-coverage")

include(CTest)
add_executable(test1 test1.cpp)
add_executable(test2 test2.cpp)

add_test(test1 test1)
add_test(test2 test2)

add_subdirectory(subdirtests)
