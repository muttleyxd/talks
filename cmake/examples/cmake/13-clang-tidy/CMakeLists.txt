cmake_minimum_required(VERSION 3.1)
project(avoid_file_glob)

set(CMAKE_CXX_CLANG_TIDY "clang-tidy;-checks=*")

file(GLOB SOURCES src/*.cpp src/*.hpp)
add_executable(main ${SOURCES})
