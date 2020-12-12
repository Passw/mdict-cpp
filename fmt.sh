#!/bin/sh
set -e
cd $(dirname "$0")
clang-format -style=Google -i *.cc *.h


cd ~
mkdir -p ~/dictlab-mdict-cpp-build
cd ~/dictlab-mdict-cpp-build
cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ~/dictlab-mdict-cpp
cp -rf compile_commands.json ~/dictlab-mdict-cpp
clear && ninja mydict -v
ls -al bin/
./bin/mydict
