#ifndef SECUENCIA_PALABRAS_H_INCLUDED
#define SECUENCIA_PALABRAS_H_INCLUDED

/// @file secuenciaPalabras.h
/// @brief Header con las principales funcionalidades del TDA SecuenciaPalabras y Palabra

#include <stdio.h>
#include <ctype.h>
#include <wchar.h>
#include <wctype.h>
#include <stdbool.h>
#include "comunes.h"

#define DEFAULT_PAL_TAM 50

/**
 *  @struct SecuenciaPalabras_t
 *  @brief Struct del TDA SecuenciaPalabras
 */
typedef struct{
    char* cadena;
    bool finDeCadena;
}SecuenciaPalabras_t;

/**
 *  @struct Palabra_t
 *  @brief Struct del TDA Palabra
 */
typedef struct{
    char cadena[DEFAULT_PAL_TAM];
}Palabra_t;

int secuenciaPalabrasCrear(SecuenciaPalabras_t* sec, char* cadena);
bool secuenciaPalabrasLeer(SecuenciaPalabras_t* sec, Palabra_t* pal);
int secuenciaPalabrasEscribir(SecuenciaPalabras_t* sec, Palabra_t* pal);
int secuenciaPalabrasEscribirCaract(SecuenciaPalabras_t* sec, int ch);
int secuenciaPalabrasCerrar(SecuenciaPalabras_t* sec);
bool secuenciaPalabrasEsFin(SecuenciaPalabras_t* sec);

int esLetra(int ch);

int palabraModificar(Palabra_t* pal, void (*Modificar)(char*));
void palabraMostrar(Palabra_t* pal);

#endif // SECUENCIA_PALABRAS_H_INCLUDED
