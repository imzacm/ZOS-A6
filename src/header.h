#ifndef __SYSTEM_H
#define __SYSTEM_H

typedef int bool;
#define true 1
#define false 0

extern unsigned char *memcpy(unsigned char *dest, const unsigned char *src, int count);
extern unsigned char *memset(unsigned char *dest, unsigned char val, int count);
extern unsigned short *memsetw(unsigned short *dest, unsigned short val, int count);
extern int strlen(const char *str);
extern unsigned char inportb (unsigned short _port);
extern void outportb (unsigned short _port, unsigned char _data);

extern void print(char* text);
extern void printchar(unsigned char c);
extern void clearScreen();
extern void setcolour(unsigned char forecolor, unsigned char backcolor);
extern void initVideo();

#endif
