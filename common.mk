.PHONY:all clean
SRCS = $(wildcard *.c)   #scan all source files
OBJS = $(SRCS:.c=.o)     #replace all source files from .c to .o
DEPS = $(SRCS:.c=.d)
all: $(BIN) $(OBJS) $(DEPS)
ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif 
$(BIN):$(OBJS)
	gcc -o $@  $^  ../lcd/lcd.o  ../usb/usb.o  ../media/media.o
%.o:%.c
	gcc -o $@ -c $(filter %.c, $^)
%.d:%.c
	gcc -MM $^ > $@
clean:
	rm -f $(BIN) $(OBJS) $(DEPS)
