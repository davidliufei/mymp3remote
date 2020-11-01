.PHONY:all clean
export BUILD_ROOT = $(shell pwd)
all:
	make -C lcd
	make -C media
	make -C usb
	make -C app
clean:
	rm -fr app/link_obj app/dep mp3
		

