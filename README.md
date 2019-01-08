# About

Encrypts (DES) a password like [TigerVNC](https://tigervnc.org/).

# Usage

Install MSYS2, then build as:

```bash
pacman --noconfirm -Sy mingw-w64-x86_64-gcc make
make
```

Then use it like:

```bash
./vncpassword.exe $(python3 -c 'print(b"vagrant\0".hex())') # 3c89f4466dc2a67a
```

## Source Code

Most of the included source code came from:

* https://github.com/TigerVNC/tigervnc/blob/8c6c584377feba0e3b99eecb3ef33b28cee318cb/common/rfb/d3des.h
* https://github.com/TigerVNC/tigervnc/blob/8c6c584377feba0e3b99eecb3ef33b28cee318cb/common/rfb/d3des.c
* https://github.com/TigerVNC/tigervnc/blob/8c6c584377feba0e3b99eecb3ef33b28cee318cb/common/rfb/Password.h
* https://github.com/TigerVNC/tigervnc/blob/8c6c584377feba0e3b99eecb3ef33b28cee318cb/common/rfb/Password.cxx
