#include <stdio.h>
#include <string.h>
#include "d3des.h"
#include "d3des.c"

static unsigned char d3desObfuscationKey[] = {23,82,107,6,35,78,88,7};

// ./vncpassword $(python3 -c 'print(b"vagrant\0".hex())') # 3c89f4466dc2a67a
int main(int argc, char **argv) {
    if (argc != 2) {
        return 1;
    }

    char *plainTextHex = argv[1];
    if (16 != strlen(plainTextHex)) {
        return 2;
    }

    unsigned char plainText[8];
    for (int i = 0; i < 8; ++i) {
        sscanf(plainTextHex, "%2hhx", &plainText[i]);
        plainTextHex += 2;
    }

    unsigned char cipherText[8];
    deskey(d3desObfuscationKey, EN0);
    des(plainText, cipherText);
    for (int i = 0; i < 8; ++i) {
        printf("%02x", cipherText[i]);
    }
    printf("\n");
    return 0;
}
