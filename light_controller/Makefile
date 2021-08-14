# /*
# Author: Claire Huo
# */
default: all
all: light ff clean

light:
	clang -c light-controller.c -o light.o

ff: 
	clang -ltelldus-core light.o -o ff

.PHONY:	clean
clean:
	rm -f *.o

