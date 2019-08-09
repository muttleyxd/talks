cmake_minimum_required(VERSION 3.1)
project(cmake_access_modifiers)

add_library(lib1 STATIC lib.cpp)
target_include_directories(lib1 PRIVATE external/lib/include)

add_library(lib2 STATIC lib.cpp)
target_include_directories(lib2 INTERFACE external/lib/include)

add_library(lib3 STATIC lib.cpp)
target_include_directories(lib3 PUBLIC external/lib/include)

add_executable(main1 main.cpp)
target_link_libraries(main1 PRIVATE lib1)

add_executable(main2 main.cpp)
target_link_libraries(main2 PRIVATE lib2)

add_executable(main3 main.cpp)
target_link_libraries(main3 PRIVATE lib3)
