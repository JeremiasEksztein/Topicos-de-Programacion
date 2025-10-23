#ifndef PARSEO_H_INCLUDED
#define PARSEO_H_INCLUDED

/// @file parseo.h
/// @brief Header con los structs de registros y las funciones para el parseo inicial de los archivos

#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "comunes.h"
#include "vector.h"
#include "iterador.h"
#include "secuenciaPalabras.h"
#include "cadenas.h"
//#include "formulario.h"

#define ARCH_DIVISIONES "./archivos/pruebaDivisiones.csv"
#define ARCH_APERTURAS "./archivos/pruebaAperturas.csv"

#define DIVISIONES_COD_LEN 15
#define DIVISIONES_DESC_LEN 61
#define DIVISIONES_CLASIF_LEN 40
#define DIVISIONES_INDICES_LEN 18
#define DIVISIONES_REGION_LEN 15
#define DIVISIONES_PERIODO_LEN 30

#define APERTURAS_COD_LEN 15
#define APERTURAS_DESC_LEN 61
#define APERTURAS_CLASIF_LEN 40
#define APERTURAS_INDICES_LEN 18
#define APERTURAS_PERIODO_LEN 30
#define APERTURAS_REGION_LEN 15

typedef struct{
    char cod[DIVISIONES_COD_LEN];
    char desc[DIVISIONES_DESC_LEN];
    char clasif[DIVISIONES_CLASIF_LEN];
    char indiceIPC[DIVISIONES_INDICES_LEN];
    char varMensIPC[DIVISIONES_INDICES_LEN];
    char varAnualIPC[DIVISIONES_INDICES_LEN];
    char region[DIVISIONES_REGION_LEN];
    char periodo[DIVISIONES_PERIODO_LEN];
}IPCDivisiones;

typedef struct{
    char cod[APERTURAS_COD_LEN];
    char desc[APERTURAS_DESC_LEN];
    char clasif[APERTURAS_CLASIF_LEN];
    char periodo[APERTURAS_PERIODO_LEN];
    char indiceIPC[APERTURAS_INDICES_LEN];
    char varMensIPC[APERTURAS_INDICES_LEN];
    char varAnualIPC[APERTURAS_INDICES_LEN];
    char region[APERTURAS_REGION_LEN];
}IPCAperturas;

int parsearIPCDivisiones(FILE* arch, void* reg);
int parsearIPCAperturas(FILE* arch, void* reg);

int corregirCampos(Vector_t* vec, int (*Corrector)(void*));

int corregirIPCDivisiones(void* reg);
int decodificarFechaDivisiones(IPCDivisiones* reg, int* decod);
int convertirFechaDivisiones(IPCDivisiones* reg);
int normalizarDescripcionDivisiones(IPCDivisiones* reg);
void palabraATitulo(char* pal);
void palabraAMinuscula(char* pal);

int corregirIPCAperturas(void* reg);
int corregirFormatoFechaAperturas(IPCAperturas* reg);

int parsearParaDivisiones(FILE* arch, void* reg);
int parsearParaAperturas(FILE* arch, void* reg);
int parsearParaAlquileres(FILE* arch, void* reg);
int parsearParaEscritura(FILE* arch, void* reg);

#endif // PARSEO_H_INCLUDED
