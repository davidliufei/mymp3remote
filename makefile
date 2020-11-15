.PHONY:all clean install uninstall

include config.mk
all:
	@for dir in $(BUILD_DIR); \
	do \
	       make -C $$dir; \
	done 
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
		

