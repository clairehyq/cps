# /*
# Author: Claire Huo
# */
default: all
all: util lcd led syringe final

util:
	clang -c util.c -o util.o

lcd:
	clang -c LiquidCrystal.c -o LiquidCrystal.o

led:
	clang -c led.c -o led.o

syringe:
	clang -c syringePump_orig.c -o syringePump_orig.o

final: 
	clang util.o LiquidCrystal.o led.o syringePump_orig.o -o ff