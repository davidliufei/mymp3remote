.PHONY:all clean
export BUILD_ROOT = $(shell pwd)
export HEAD_PATH  = $(BUILD_ROOT)/inc
all:
	make -C lcd
	make -C media
	make -C usb
	make -C math
	make -C app
clean:
	rm -fr app/link_obj app/dep app/lib_obj mp3
	rm -fr lib/*.a
		

