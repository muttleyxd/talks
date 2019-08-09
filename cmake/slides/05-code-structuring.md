class: title-slide

# Code structuring

---

# _Code structuring_

--

- CMake is a _programming language_

--

- We have macros, functions and variables

--

    _and we can shoot our feet with it_

--

- If we remember some principles (_everything is a string_, _no return values_, _scopes_) then we can be successful with them

--

- _functions.cmake_ is a good place to place our verbose functions

---

# _Code structuring_

--

## What is a function?

--

```cmake
function(name INPUT_PARAM1)
  message("INPUT_PARAM1: ${INPUT_PARAM1}")
  message("arg count: ${ARGC}")
  message("all args: ${ARGV}")
  message("optional args: ${ARGN}")
endfunction()
```

--

## We can call it

```cmake
name(HELLO THERE)
```

--

```
INPUT_PARAM1: HELLO
arg count: 2
all args: HELLO; THERE
optional args: THERE
```

---

# Code structuring - _function versus macro_

--

- Function has it's own scope, so if you want to return from function you'll need to use output variable with PARENT_SCOPE option

```cmake
function(give_me_somevalue OUTPUT_VAR)
  set("${OUTPUT_VAR}" "somevalue" PARENT_SCOPE)
endfunction()
```

--

- Macro is almost the same as function, but it doesn’t have it’s own scope – all variables you use will get populated to caller. This may be undesired and cause clutter in variables.

```cmake
macro(give_me_somevalue OUTPUT_VAR)
  set("${OUTPUT_VAR}" "somevalue")
endmacro()
```

--

---

# _Code structuring_

--

## Do not be afraid to create helper functions

--

```cmake
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  if("${CMAKE_CXX_COMPILER_VERSION}" VERSION_GREATER "5.0")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-gnu-zero-variadic-macro-arguments")
  endif()
endif()
```

--

```cmake
add_flags_to_compiler(COMPILER_ID Clang
                      VERSION_GREATER 5.0
                      FLAGS "-Wno-gnu-zero-variadic-macro-arguments")
```

---

# _Code structuring_

## Parsing arguments

--

```cmake
function create_test(NAME SOURCES INCLUDES LINK_LIBS FLAGS)
```

--

```cmake
create_test(testing_file_under_test
            "tests/test.cpp ${SOURCE_DIR}/src/file_under_test.cpp"
            "${SOURCE_DIR}/include"
            "restbed pthread"
            "-fprofile-arcs -ftest-coverage")
```

--

## We can do better!

---

# Code structuring - _Parsing arguments_

--

## cmake_parse_arguments

```cmake
function create_test() #declaration doesn’t give us much info
  set(options "EXCLUDE_FROM_BUILD")
  set(oneValArgs "NAME")
  set(multiValArgs SOURCES INCLUDES LINK_LIBS FLAGS)
  cmake_parse_arguments(CT "${options}" "${oneValArgs}" "${multiValArgs}" ${ARGN})
  # we can access them under ${CT_NAME} ${CT_FLAGS}
endfunction()

create_test(NAME      testing_file_under_test
            SOURCES   tests/test.cpp
                      ${SOURCE_DIR}/src/file_under_test.cpp
            INCLUDES  ${SOURCE_DIR}/include
            LINK_LIBS restbed pthread
            FLAGS     "-fprofile-arcs -ftest-coverage")
```

---
