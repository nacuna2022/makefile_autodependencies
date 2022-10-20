CC=gcc
OBJS=main.o banner.o

all: final

final: $(OBJS)
	$(CC) -o $@ $^

%.o:%.c
	$(CC) -I. -c -o $@ $<

.PHONY: clean
clean:
	rm final
	rm *.o
