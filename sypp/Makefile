# /*
# Author: Claire Huo
# */
### aaaa
default: all
all: util lcd led syringe final

util:
	clang -flto -fsanitize=cfi -fvisibility=hidden -c util.c -o util.o

lcd:
	clang -flto -fsanitize=cfi -fvisibility=hidden -c LiquidCrystal.c -o LiquidCrystal.o

led:
	clang -flto -fsanitize=cfi -fvisibility=hidden -c led.c -o led.o

syringe:
	clang -flto -fsanitize=cfi -fvisibility=hidden -c syringePump_orig.c -o syringePump_orig.o

final: 
	clang -fsanitize=cfi -flto -fvisibility=hidden util.o LiquidCrystal.o led.o syringePump_orig.o -o ff
