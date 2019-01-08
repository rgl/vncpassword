all: vncpassword.zip

vncpassword.exe: main.c d3des.h d3des.c
	gcc -Os -o $@ -m64 main.c
	strip $@

vncpassword.zip: vncpassword.exe
	zip -9 $@ $<
	sha256sum $@

clean:
	rm -f vncpassword.exe vncpassword.zip

.PHONY: all clean
