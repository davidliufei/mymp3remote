.PHONY:all clean

all:
	make -C lcd
	make -C media
	make -C usb
	make -C app
clean:
	rm -fr mp3
	rm -fr app/link_obj/*.o app/player.o app/player.d
	rm -fr usb/usb.o  usb/usb.d
	rm -fr lcd/lcd.o  lcd/lcd.d
	rm -fr media/media.o  media/media.d
	rm -fr app/link_obj
		

