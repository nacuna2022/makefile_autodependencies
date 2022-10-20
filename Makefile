CC=gcc
OBJS=main.o banner.o

all: final

final: $(OBJS)
	$(CC) -o $@ $^

%.o:%.c
	$(CC) -I. -c -o $@ $<

%.d:%.c
	$(CC) -I. -MM -MF $@ $<

include $(OBJS:.o=.d)

.PHONY: clean
clean:
	rm final
	rm *.o
	rm *.d


