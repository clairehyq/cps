#!/bin/bash
set -v
objdump -D ff > dump.txt
cp ../check.cpp ./
g++ -std=c++11 -O0 check.cpp -o check
./check dump.txt
