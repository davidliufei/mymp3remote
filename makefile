.PHONY:clean

SRCS = $(wildcard *.c)   #scan all source files
OBJS = $(SRCS:.c=.o)     #replace all source files from .c to .o
BIN  = mp3

$(BIN):$(OBJS)
	gcc -o $@ $^
usb.o:usb.c usb.h   # add header file dependence 
	gcc -o $@ -c $(filter %.c, $^)
%.o:%.c
	gcc -o $@ -c $^
clean:
	rm -f $(BIN) $(OBJS)

