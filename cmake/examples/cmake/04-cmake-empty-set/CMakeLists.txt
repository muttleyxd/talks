cmake_minimum_required(VERSION 3.1)

project(empty_set)

add_library(test SHARED test.cpp)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE test)

set("" XD)
