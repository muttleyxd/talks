#!/usr/bin/env bash
mkdir -p build
pushd build
rm -r ../build/*
cmake ..
make
ctest --output-on-failure
popd
