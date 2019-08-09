cmake_minimum_required(VERSION 3.1)

project(vcpkg-test)

find_package(GTest MODULE REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE GTest::GTest GTest::Main)
