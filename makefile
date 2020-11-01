.PHONY:clean

SRCS = $(wildcard *.c)   #ɨ������Դ�ļ�
OBJS = $(SRCS:.c=.o)     #������.c�滻Ϊ����.o
BIN  = mp3

$(BIN):$(OBJS)
	gcc -o $@ $^
%.o:%.c
	gcc -o $@ -c $^
clean:
	rm -f $(BIN) $(OBJS)

