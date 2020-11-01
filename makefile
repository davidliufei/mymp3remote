.PHONY:clean

SRCS = $(wildcard *.c)   #扫描所有源文件
OBJS = $(SRCS:.c=.o)     #把所有.c替换为所有.o
BIN  = mp3

$(BIN):$(OBJS)
	gcc -o $@ $^
%.o:%.c
	gcc -o $@ -c $^
clean:
	rm -f $(BIN) $(OBJS)

