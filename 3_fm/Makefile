# /*
# Author: Claire Huo
# */
default: all
all : pi_pcm ff cfi_ff

pi_pcm:
	clang -c pi_pcm.c -o pi_pcm.o

ff:
	clang $(FLAGS) pi_pcm.o -lm -ljansson -o ff

cfi_ff: 
	clang $(FLAGS) $(CFIFLAGS) pi_pcm.o -lm -ljansson -o cfi_ff

.PHONY:	clean
clean:
	rm -f *.o
	rm ff
	rm cfi_ff

