#!/usr/bin/env bash

UNBUFFER=""
HAS_UNBUFFER=`which unbuffer >/dev/null 2>&1; echo $?`
if [ "$HAS_UNBUFFER" -eq 0 ]; then
    UNBUFFER="unbuffer"
fi

make_package()
{
    mkdir -p build_$1
    pushd build_$1
    rm -r ../build_$1/*
    $UNBUFFER cmake .. -DCPACK_GENERATOR=$1
    $UNBUFFER make -j4
    $UNBUFFER make package
    popd
}

make_package STGZ | tee output.log
make_package DEB | tee -a output.log
make_package NSIS | tee -a output.log
grep generated output.log
rm output.log
