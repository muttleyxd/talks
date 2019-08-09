cmake_minimum_required(VERSION 3.3)

project(cmake-talk)

include(external/remark.cmake)

# engine definition
add_subdirectory(external/remark.js)

add_subdirectory(slides)
