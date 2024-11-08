CC=gcc
CFLAGS=-Wall -O2

.PHONY: all

all: libvgmio.a

libvgmio.a: commands.o error.o header.o interpreter.o vgm_logger.o
	ar cr $@ $^

%.o: %.c
	$(CC) -MMD -c $< -o $@ $(CFLAGS)

clean:
	rm -f *.o *.a
