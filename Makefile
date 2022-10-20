DEP_DIR=.dep
CC=gcc
OBJS=main.o banner.o

all: final

final: $(OBJS)
	@echo "LD	$@"
	@$(CC) -o $@ $^

%.o:%.c $(DEP_DIR)/%.d | $(DEP_DIR)
	@echo "CC 	$@"
	@$(CC) -I. -MP -MMD -MF $(DEP_DIR)/$*.d -c -o $@ $<

$(DEP_DIR):
	mkdir $(DEP_DIR)

DEPFILES=$(patsubst %.o, $(DEP_DIR)/%.d, $(OBJS))
$(DEPFILES): ;

#initially, the dep files dont exist so make will complain that 
# there is no such file or directory... just used -include instead.
-include $(DEPFILES)

.PHONY: clean
clean:
	rm final
	rm *.o
	rm -rf .deps


