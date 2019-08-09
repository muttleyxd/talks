#!/usr/bin/env bash
RED='\033[0;31m'
NC='\033[0m'

rm -f lib.cpp

mkdir -p build
pushd build
rm -r ../build/*
cmake .. $@
make -j4
echo -e "$RED"
ls ../*.cpp
echo -e "lib.cpp isn't there, so build failed"
echo -e "lets create lib.cpp, so CMake can see it"
echo -e "press ENTER to continue"
read
cp ../lib.cpp{.template,}
ls ../*.cpp
echo -e "$NC"
make -j4
echo -e "$RED build still fails, globs get refreshed when you invoke CMake"
echo -e "ex. 'cmake ..' or make 'rebuild_cache'"
echo -e "press ENTER to continue"
read
echo -e "make rebuild_cache $NC"
make rebuild_cache
make -j4
popd
