cmake_minimum_required(VERSION 3.1)

project(coverage-report)

option(RUN_COVERAGE "Run tests with Coverage" OFF)
if (RUN_COVERAGE)
  string(APPEND CMAKE_CXX_FLAGS " -fprofile-arcs -ftest-coverage")
  find_program(GCOVR gcovr)
  if (NOT GCOVR)
    message(FATAL_ERROR "gcovr is not installed")
  endif()

  add_custom_target(coverage_report
                    COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_BINARY_DIR}/coverage"
                    COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_BINARY_DIR}/coverage"
                    COMMAND ${GCOVR} -r \"${CMAKE_SOURCE_DIR}\" --html -o \"${CMAKE_BINARY_DIR}/coverage/coverage.html\" --html-details)
endif()

add_executable(main main.cpp)
