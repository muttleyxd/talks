class: title-slide

# Integration with external tooling

---

# _Integration with external tooling_

## Why? Convenience

--

- gcovr for coverage reports
- clang-format/astyle for automatic style checking
- clang-tidy

---

# Integration with external tooling - _gcovr_

--

## Needs _gcovr_ to be installed in host system

--

.small[
```cmake
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
```
]

--

```
cmake .. -DRUN_COVERAGE=ON
make
./main
make coverage_report
xdg-open coverage/coverage.html
```

---

# Integration with external tooling - _clang-format_

## Analogously we can do the same to clang-format, though it’s better to use an external Bash/Powershell script for this – amount of CMake code can quickly get unmanagable.

```cmake
add_custom_target(style-check
  ALL
  COMMAND format.sh check ${CMAKE_SOURCE_DIR}/src)
add_custom_target(style-format
  COMMAND format.sh format ${CMAKE_SOURCE_DIR}/src)
```

---

# Integration with external tooling - _clang-tidy_

## It’s a little better with clang-tidy, yet _CMake-Fu_ strikes us again

--

## CMake will _silently ignore_ this if anything is incorrect

--

## _CMake >= 3.6_, otherwise do as with clang-format

--

## Needs to be done _before_ defining any target:

```cmake
set(CMAKE_CXX_CLANG_TIDY "clang-tidy;-checks=*")
```

---
