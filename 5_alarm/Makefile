# /*
# Author: Claire Huo
# */

T = alarm4pi.o bcm_gpio.o gpio_polling_orig.o log_msgs.o proc_helper.o public_ip.o pushover.o util.o

default: all

FLAGS = -Weverything -pedantic -O0 -fvisibility=hidden -flto
CFIFLAGS = -fsanitize=cfi

all: ff cfi_ff

%.o: %.c %.h
	clang $(FLAGS) -c $^

ff: alarm4pi.o bcm_gpio.o gpio_polling_orig.o log_msgs.o proc_helper.o public_ip.o pushover.o util.o
	clang $(FLAGS) -lresolv -pthread $(T) -o ff

cfi_ff: alarm4pi.o bcm_gpio.o gpio_polling_orig.o log_msgs.o proc_helper.o public_ip.o pushover.o util.o
	clang $(FLAGS) $(CFIFLAGS) -lresolv -pthread $(T) -o cfi_ff

.PHONY:	clean
clean:
	rm -f *.o
	rm ff
	rm cfi_ff
	rm dump.txt
	rm dump_cfi.txt
