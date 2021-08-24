# /*
# Author: Claire Huo
# */
#!/bin/bash
set -v
objdump -D cfi_ff > dump_cfi.txt
cp ../check.cpp ./
g++ -std=c++11 -O0 check.cpp -o check
./check dump_cfi.txt
