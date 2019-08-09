cmake_minimum_required(VERSION 2.8.12)

project(cmake_clutter)

include(subprojects/CMakeLists.txt)

add_executable(main main.cpp)
target_link_libraries(main project1 project2 project3 project4 project5)
