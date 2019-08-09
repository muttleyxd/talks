#!/usr/bin/env bash
mkdir -p build
pushd build
rm -r ../build/*
cmake ..
make -j4
popd
