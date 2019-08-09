#!/usr/bin/env bash
HAS_VCPKG=`which vcpkg >/dev/null 2>&1; echo $?`
if [ "$HAS_VCPKG" -ne 0 ]; then
    echo "vcpkg needs to be installed"
    exit 1
fi

vcpkg install gtest

mkdir -p build
pushd build
rm -r ../build/*
cmake .. $@ -DCMAKE_TOOLCHAIN_FILE=/usr/share/vcpkg/scripts/buildsystems/vcpkg.cmake
make -j4
popd
