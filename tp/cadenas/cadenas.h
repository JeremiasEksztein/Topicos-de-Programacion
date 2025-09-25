#ifndef CADENAS_H
#define CADENAS_H

#include <stdlib.h>
#include <stddef.h>
#include <memory.h>

//Probada
int stringCmp(char* dest, char* src);
//Probada
int stringNCmp(char* dest, char* src, size_t n);
//Falta hacer
int stringCmpi(char* dest, char* src);

//Probada
char* stringCpy(char* dest, char* src);
//Probada
char* stringNCpy(char* dest, char* src, size_t n);

char* stringDup(char* str);
char* stringNDup(char* str, size_t n);

//Probada. Por alguna razon printf primero llama a stringCat y luego imprime
char* stringCat(char* dest, char* src);
//Falta hacer
char* stringNCat(char* dest, char* src, size_t n);

//Probada
char* stringChar(char* dest, int ch);
//Probada
char* stringRChar(char* dest, int ch);
//Probada
int stringCSpan(char* dest, char* src);
//Probada
int stringSpan(char* dest, char* src);

//Probada
char* stringPbreak(char* dest, char* src);
//Probada
char* stringSubstring(char* dest, char* src);

//Probada
size_t stringLenght(char* str);

#endif