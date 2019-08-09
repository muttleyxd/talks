#!/usr/bin/env bash
mkdir -p build
pushd build
cmake ..
popd
rm -r build/*
