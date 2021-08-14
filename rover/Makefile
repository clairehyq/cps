# /*
# Author: Claire Huo
# */
default: all
all: tcp rovertcp final clean

tcp: 
	clang -c tcp.c -o tcp.o

rovertcp:
	clang -c rovertcp.c -o rovertcp.o

final: rovertcp.c tcp.c
	clang tcp.o rovertcp.o -lwiringPi -pthread -o ff

# objdump -D ff > dump.txt

# 1. SEPERATE ASSEMBLY:

# tcp: 
# 	clang -O0 -S tcp.c

# rovertcp:
# 	#clang -D_GNU_SOURCE --target=aarch64 -S -emit-llvm light-controller.c -o light-controller.bc
# 	clang -S rovertcp.c 

# test-combo: tcp rovertcp 
# 	llvm-link tcp.s rovertcp.s -o test_combo.s

# 2. BITCODE:

# tcp: 
# 	clang tcp.c -S -emit-llvm -o tcp.bc

# rovertcp:
# 	clang -S -emit-llvm  rovertcp.c -o rovertcp.bc

# test-combo: tcp rovertcp
# 	llvm-link tcp.bc rovertcp.bc -o test_combo.bc

# 3. EXECUTABLE:

.PHONY:	clean
clean:
	rm -f *.o
