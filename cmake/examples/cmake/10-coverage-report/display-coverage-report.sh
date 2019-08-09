#!/usr/bin/env bash
HAS_GCOVR=`which gcovr >/dev/null 2>&1; echo $?`
if [ "$HAS_GCOVR" -ne 0 ]; then
    echo "gcovr needs to be installed"
    exit 1
fi

mkdir -p build
pushd build
rm -r ../build/*
cmake .. -DRUN_COVERAGE=ON
make -j4
./main
make coverage_report
xdg-open coverage/coverage.html
popd
