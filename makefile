.PHONY:all clean install uninstall
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
install:
	cp mp3  /usr/bin
	cp lib/libmath.so  /usr/lib
	cp lib/ext_lib/librmvb.so /usr/lib
uninstall:
	rm /usr/bin/mp3
	rm -fr /usr/lib/libmath.so
	rm -fr /usr/lib/librmvb.so
		

