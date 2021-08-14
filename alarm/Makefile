# /*
# Author: Claire Huo
# */

T = alarm4pi.o bcm_gpio.o gpio_polling_orig.o log_msgs.o proc_helper.o public_ip.o pushover.o util.o

default: all
all: ff clean

%.o: %.c %.h
	clang -c $^

ff: alarm4pi.o bcm_gpio.o gpio_polling_orig.o log_msgs.o proc_helper.o public_ip.o pushover.o util.o
	clang -lresolv -pthread $(T) -o ff

.PHONY:	clean
clean:
	rm -f *.o
