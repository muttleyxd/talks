cmake_minimum_required(VERSION 3.1)

project(visit_struct)

set(CMAKE_CXX_STANDARD 17)

add_executable(visit_struct_basic basic.cpp)
add_executable(visit_struct_cout cout.cpp)
add_executable(visit_struct_to_json to_json.cpp)
