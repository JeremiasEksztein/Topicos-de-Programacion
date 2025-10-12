#ifndef CADENAS_H
#define CADENAS_H

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <memory.h>
#include <ctype.h>

//Manipulacion de cadenas

char* stringCopy(char* dest, char* src);
char* stringNCopy(char* dest, char* src, size_t n);
char* stringDup(char* str);
char* stringNDup(char* str, size_t n);
char* stringCat(char* dest, char* src);
char* stringNCat(char* dest, char* src, size_t n);
char* stringToUpper(char* str);
char* stringToLower(char* str);
char* stringReverse(char* str);
char* stringRemove(char* str, int ch);
char* stringReplace(char* str, int ori, int new);
char* stringTrim(char* dest, char* str, int i, int j);

//Examinacion de cadenas

int stringCmp(char* dest, char* src);
int stringNCmp(char* dest, char* src, size_t n);
int stringCmpi(char* dest, char* src);
int stringNCmpi(char* dest, char* src, size_t n);
char* stringChar(char* dest, int ch);
char* stringRChar(char* dest, int ch);
int stringCSpan(char* dest, char* src);
int stringSpan(char* dest, char* src);
char* stringPbreak(char* dest, char* src);
char* stringSubstring(char* dest, char* src);
size_t stringLenght(char* str);

int memzero(void* ptr, size_t n);

char* scanString(char* str, size_t n);
void flushStdin(void);

#endif