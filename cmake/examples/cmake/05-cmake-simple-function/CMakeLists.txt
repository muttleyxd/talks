cmake_minimum_required(VERSION 3.1)

project(simple_function)

function(name INPUT_PARAM1)
  message("${INPUT_PARAM1}")
  message("arg count: ${ARGC}")
  message("all args: ${ARGV}")
  message("optional args: ${ARGN}")
endfunction()

name(HELLO THERE)
