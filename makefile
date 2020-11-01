.PHONY:all clean
export BUILD_ROOT = $(shell pwd)
export HEAD_PATH  = $(BUILD_ROOT)/inc
all:
	make -C lcd
	make -C media
	make -C usb
	make -C app
clean:
	rm -fr app/link_obj app/dep mp3
		

