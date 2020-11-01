.PHONY:all clean

all:
	make -C lcd
	make -C media
	make -C usb
	make -C app
clean:
	rm -fr app/player.o app/player.d app/mp3
	rm -fr usb/usb.o  usb/usb.d
	rm -fr lcd/lcd.o  lcd/lcd.d
	rm -fr media/media.o  media/media.d
		

