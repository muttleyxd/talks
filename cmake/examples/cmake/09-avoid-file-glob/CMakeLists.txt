cmake_minimum_required(VERSION 3.1)
project(avoid_file_glob)

file(GLOB SOURCES *.cpp)

add_executable(main ${SOURCES})
