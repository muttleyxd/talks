cmake_minimum_required(VERSION 3.1)
project(cmake_access_modifiers)

include(functions.cmake)

function(setup_gtest)
    enable_testing()
    find_package(GTest)
    if (NOT GTEST_FOUND)
        download_gtest()
        add_library(GTest::GTest ALIAS libgtest)
        add_library(GTest::Main ALIAS libgtest_main)
    endif()
endfunction()

setup_gtest()

add_executable(tests tests.cpp)
target_link_libraries(tests PRIVATE GTest::GTest GTest::Main)
