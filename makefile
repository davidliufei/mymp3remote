.PHONY:clean

OBJS = player.o lcd.o usb.o
BIN  = mp3

$(BIN):$(OBJS)
	gcc -o $@ $^
%.o:%.c
	gcc -o $@ -c $^
clean:
	rm -f $(BIN) $(OBJS)

