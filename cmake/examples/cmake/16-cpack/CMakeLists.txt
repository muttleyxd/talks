cmake_minimum_required(VERSION 3.1)
project(cpack-example)

add_library(lib STATIC src/lib.cpp src/lib.hpp)
add_executable(main src/main.cpp)
target_link_libraries(main PRIVATE lib)

install(TARGETS main DESTINATION bin)

include(CPackConfig.cmake)
include(CPack)
