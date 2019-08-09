cmake_minimum_required(VERSION 3.1)
project(avoid_file_glob)

file(GLOB SOURCES src/*.cpp src/*.hpp)
add_executable(main ${SOURCES})

include(style-format.cmake)
