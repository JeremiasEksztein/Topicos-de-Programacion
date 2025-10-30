/** @ingroup ModuloSecuenciaPalabras
 * @{ */

#ifndef SECUENCIA_PALABRAS_H_INCLUDED
#define SECUENCIA_PALABRAS_H_INCLUDED

/** @file secuenciaPalabras.h
 * @brief Header con las principales funcionalidades del TDA SecuenciaPalabras y Palabra */

#include <stdio.h>
#include <ctype.h>
#include <wchar.h>
#include <wctype.h>
#include "errores.h"

#define DEFAULT_PAL_TAM 50 /** @brief Tamaño de palabra normal */

/** @brief Struct del TDA SecuenciaPalabras */
typedef struct{
    char* cadena;
    int finDeCadena;
}SecuenciaPalabras_t;

/** @brief Struct del TDA Palabra */
typedef struct{
    char cadena[DEFAULT_PAL_TAM];
}Palabra_t;

/** @brief Funcion inicializadora del TDA secuenciaPalabras */
int secuenciaPalabrasCrear(SecuenciaPalabras_t* sec, char* cadena);

/** @brief */
int secuenciaPalabrasLeer(SecuenciaPalabras_t* sec, Palabra_t* pal);
int secuenciaPalabrasEscribir(SecuenciaPalabras_t* sec, Palabra_t* pal);
int secuenciaPalabrasEscribirCaract(SecuenciaPalabras_t* sec, int ch);
int secuenciaPalabrasCerrar(SecuenciaPalabras_t* sec);
int secuenciaPalabrasEsFin(SecuenciaPalabras_t* sec);

int esLetra(int ch);

int palabraModificar(Palabra_t* pal, void (*Modificar)(char*));
void palabraMostrar(Palabra_t* pal);
void palabraATitulo(char* pal);
void palabraAMinuscula(char* pal);

#endif /* SECUENCIA_PALABRAS_H_INCLUDED */

/** }@ */
