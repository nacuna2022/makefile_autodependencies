CC=gcc
OBJS=main.o banner.o

all: final

final: $(OBJS)
	$(CC) -o $@ $^

%.o:%.c %.d
	$(CC) -I. -MP -MMD -c -o $@ $<

#implicit rule for .d files
%.d: ;

include $(OBJS:.o=.d)

.PHONY: clean
clean:
	rm final
	rm *.o
	rm *.d


