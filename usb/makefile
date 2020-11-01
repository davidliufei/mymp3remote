.PHONY:all clean

SRCS = $(wildcard *.c)   #scan all source files
OBJS = $(SRCS:.c=.o)     #replace all source files from .c to .o
DEPS = $(SRCS:.c=.d)
BIN  = 
all: $(BIN) $(OBJS) $(DEPS)

ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif 

$(BIN):$(OBJS)
	gcc -o $@  $^
%.o:%.c
	gcc -o $@ -c $(filter %.c, $^)
%.d:%.c
	gcc -MM $^ > $@
clean:
	rm -f $(BIN) $(OBJS) $(DEPS)

