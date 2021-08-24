# /*
# Author: Claire Huo
# */
default: all

FLAGS = -Weverything -pedantic -std=c99 -O0 -fvisibility=hidden -flto
CFIFLAGS = -fsanitize=cfi

all: light ff cfi_ff

light:
	clang -c light-controller.c -o light.o

ff:
	clang $(FLAGS) -ltelldus-core light.o -o ff

cfi_ff: 
	clang $(FLAGS) $(CFIFLAGS) -ltelldus-core light.o -o cfi_ff

.PHONY:	clean
clean:
	rm -f *.o
	rm ff
	rm cfi_ff
	rm dump.txt
	rm dump_cfi.txt

