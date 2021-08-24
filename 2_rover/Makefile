# /*
# Author: Claire Huo
# */
default: all

FLAGS = -Weverything -pedantic -std=c99 -O0 -fvisibility=hidden -flto
CFIFLAGS = -fsanitize=cfi

all: tcp rovertcp ff cfi_ff 

tcp: 
	clang $(FLAGS) -c tcp.c -o tcp.o

rovertcp:
	clang $(FLAGS) -c rovertcp.c -o rovertcp.o

ff:
	clang $(FLAGS) tcp.o rovertcp.o -lwiringPi -pthread -o ff

cfi_ff: 
	clang $(FLAGS) $(CFIFLAGS) tcp.o rovertcp.o -lwiringPi -pthread -o cfi_ff

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
	rm *.o
	rm ff
	rm cfi_ff
