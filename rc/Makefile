# /*
# Author: Claire Huo
# */
default: all
all : pi_pcm ff clean

pi_pcm:
	clang -c pi_pcm.c -o pi_pcm.o

ff:
	clang pi_pcm.o -lm -ljansson -o ff

.PHONY:	clean
clean:
	rm -f *.o

