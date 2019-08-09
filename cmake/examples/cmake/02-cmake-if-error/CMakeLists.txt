cmake_minimum_required(VERSION 3.1)

project(if_error)

function(error_when_unset VARIABLE)
    if ("${${VARIABLE}}" STREQUAL "")
      message("${VARIABLE} needs to be set")
    endif()
endfunction()

if ("${ARCH}" STREQUAL "ARM")
    message("We're ARM")
else()
    message("We're not ARM")
endif()

if (${ARCH} STREQUAL "ARM")
    message("We're ARM")
else()
    message("We're not ARM")
endif()
