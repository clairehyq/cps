# /*
# Author: Claire Huo
# */
FLAGS = -Weverything -pedantic -std=c99 -O0 -fvisibility=hidden -flto
CFIFLAGS = -fsanitize=cfi

default: all

all: util lcd led syringe cfi_ff ff

util:
	clang $(FLAGS) -c util.c -o util.o

lcd:
	clang $(FLAGS) -c LiquidCrystal.c -o LiquidCrystal.o

led:
	clang $(FLAGS) -c led.c -o led.o

syringe:
	clang $(FLAGS) -c syringePump_orig.c -o syringePump_orig.o

ff:
	clang $(FLAGS) util.o LiquidCrystal.o led.o syringePump_orig.o -o ff

cfi_ff: 
	clang $(FLAGS) $(CFIFLAGS) util.o LiquidCrystal.o led.o syringePump_orig.o -o cfi_ff

clean:
	rm *.o
	rm ff
	rm cfi_ff