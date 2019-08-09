class: title-slide

# Things to know before you get into it

---

# Things to know

--

## What can we create?

--

Targets

--

```cmake
add_executable(main main.cpp)
add_library(one SHARED somelib.cpp) #.so or .dll
add_library(two STATIC someotherlib.cpp) #.a or .lib
add_library(three OBJECT object.cpp) #.o
add_library(externallib IMPORTED)
add_custom_command(...)
add_custom_target(...)
```

---

# Things to know

--

## There are no return values from functions

--

```cmake
function(give_me_five)
  return (5) # ERROR
endfunction()
```

--

## Only way to return are output parameters

--

```cmake
function(give_me_five OUTPUT_VARIABLE)
  set(${OUTPUT_VARIABLE} 5 PARENT_SCOPE)
endfunction()
```

---

# Things to know

--

## Everything is a string!

--

```cmake
set(CMAKE_CXX_STANDARD 17)
```

--

```cmake
if ("23" LESS 24) # both treated as a string, LESS knows how to compare integers
```

--

```
set(somelist "")
list(APPEND somelist ";")
list(APPEND somelist ";")
list(APPEND somelist ";")
list(APPEND somelist ";")
list(APPEND somelist ";")
list(APPEND somelist ";")
message("somelist: ${somelist}") # Prints: ;;;;;;;;;;;;
list(LENGTH somelist somelist_LENGTH)
message("len: ${somelist_LENGTH}") # Prints: 12
```

---

# Things to know - _Everything is a string!_

.info[
.center[
We need to validate arguments heavily,

or we will end up with cryptic errors
]
]

---

# Things to know

--

## Validating arguments: what if we don't

--

```cmake
if (${ARCH} STREQUAL "ARM") # ARCH is unset
```

--

## this will expand to:

```cmake
if ( STREQUAL "ARM")
```

--

## so let's run CMake

--

```
$ cmake ..
<typical output of CMake>
CMake Error at CMakeLists.txt:17 (if):
  if given arguments:
    "STREQUAL" "ARM"
  Unknown arguments specified
```

---

# Things to know - validating arguments

--

## We should always check for empty or invalid arguments

--

## Remember this function?

```cmake
function(give_me_five OUTPUT_VARIABLE)
  set(${OUTPUT_VARIABLE} 5 PARENT_SCOPE)
endfunction()
```

--

## We can write it better!

--

```cmake
function(give_me_five OUTPUT_VARIABLE)
  if (NOT "${OUTPUT_VARIABLE}" STREQUAL "")
    set(${OUTPUT_VARIABLE} 5 PARENT_SCOPE)
  endif()
endfunction()
```

---

# Things to know - validating arguments

--

## What will happen?

--

```cmake
set("" XD)
```

---
