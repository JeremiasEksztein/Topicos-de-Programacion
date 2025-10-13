#ifndef CADENAS_H
#define CADENAS_H

///@file cadenas.h
///@brief Biblioteca para la manipulacion y examen de cadenas de caracteres

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <memory.h>
#include <ctype.h>
#include <string.h>

///@brief Manipulacion de cadenas

/** 
 *  @fn char* stringCopy(char* dest, char* src)
 *  @brief Realiza la copia de una cadena en otra
 *  @param dest Cadenas de destino de la operacion
 *  @param src Cadena de fuente de la operacion
 */
char* stringCopy(char* dest, char* src);

/**
*   @fn char* stringNCopy(char* dest, char* src, size_t n)
*   @brief Realiza la copia de hasta n caracteres, inclusive, de una cadena a otra
*   @param dest Cadenas de destino de la operacion
*   @param src Cadena de fuente de la operacion
*   @param n Cantidad de caracteres a copiar
 */
char* stringNCopy(char* dest, char* src, size_t n);

/**
 *  @fn char* stringDup(char* dest, char* src, size_t n)
 *  @brief Duplica la cadena str, usando memoria del heap
 *  @param str Cadena a duplicar
 *  @details Es la responsabilidad del usuario administrar la memoria alocada
 */
char* stringDup(char* str);

/** 
 *  @fn char* stringNDup(char* str, size_t n)
 *  @brief Duplica la cadena str hasta n caracteres, inclusive, usando memoria del heap
 *  @param str Cadena a duplicar
 *  @param n Cantidad de caracteres, inclusive, a duplicar
 *  @details Es la responsabilidad del usuario administrar la memoria alocada
 */
char* stringNDup(char* str, size_t n);

/**
 *  @fn char* stringCat(char* dest, char* src)
 *  @brief Concatena la cadena src al final de la cadena dest
 *  @param dest Cadena de destino de la concatenacion
 *  @param src Cadena a concatenar
 */
char* stringCat(char* dest, char* src);

/**
 *  @fn char* stringNCat(char* dest, char* src, size_t n)
 *  @brief Concatena la cadena src hasta n caracteres, inclusive, al final de la cadena dest
 *  @param dest
 *  @param src
 *  @param n
 */ 
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
int stringLenght(const char* str);

int memzero(void* ptr, size_t n);

char* scanString(char* str, size_t n);
void flushStdin(void);

#endif