cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-copy")

include(HunterGate.cmake)

HunterGate(
    URL "https://github.com/cpp-pm/hunter/archive/v0.23.222.tar.gz"
    SHA1 "0b88baaa2a9a35b8ce632c57ade66be8dd918afd"
)

project(hunter-test)

include(hunter_cmake_args)
hunter_add_package(GTest)
hunter_config(GTest VERSION ${HUNTER_GTest_VERSION}
              CMAKE_ARGS "CMAKE_CXX_FLAGS=-Wno-deprecated-copy"
              ) #does not work, https://github.com/ruslo/hunter/issues/821
find_package(GTest CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE GTest::gtest GTest::main)
