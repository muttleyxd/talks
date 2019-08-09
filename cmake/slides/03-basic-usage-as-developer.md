class: title-slide

# Basic usage as developer

---

# Basic usage as developer - minimal template for starting

--

_CMakeLists.txt_

```cmake
cmake_minimum_required(VERSION 3.1)
project(my_project)

add_executable(main main.cpp)
```

---

# Basic usage as developer - setting flags

--

```cmake
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic")
```

--

## or

```cmake
target_compile_options(main PRIVATE "-pedantic")
```

--

.info[
Second approach is more modern, but we'll get to it later
]

---

# Basic usage as developer - include directories

--

```cmake
include_directories("dir/some_nice_library/include")
```

--

## or

```cmake
target_include_directories(main PRIVATE "dir/some_nice_library/include")
```

--

## or

```cmake
target_include_directories(main SYSTEM PRIVATE "dir/some_nice_library/include")
```

--
.info[
What PRIVATE does? We’ll get to it later ;)
]

---

# Basic usage as developer - linking libraries

--

```cmake
link_directories("dir/spooky_scary_lib/lib")
target_link_libraries(main PRIVATE spooky_scary_lib)
```

--

## or

```cmake
target_link_directories(main PRIVATE "dir/spooky_scary_lib/lib")
target_link_libraries(main PRIVATE spooky_scary_lib)
```

---

# Basic usage as developer - summing up

--

```cmake
cmake_minimum_required(VERSION 3.1)
project(my_project)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic")

add_executable(main main.cpp)
target_include_directories(main PRIVATE "dir/some_nice_library/include")
target_link_directories(main PRIVATE "dir/spooky_scary_lib/lib")
target_link_libraries(main PRIVATE spooky_scary_lib)
```

--

.info[
This simple example allows us to get ourselves a very basic, but extendable buildsystem
]

---
