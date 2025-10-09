#ifndef PROCESO_INCLUDED
#define PROCESO_INCLUDED

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "../comunes/comunes.h"
#include "../vector/vector.h"
#include "../secuenciaPalabras/secuenciaPalabras.h"
#include "../cadenas/cadenas.h"

#define DIVISIONES_COD_LEN 20
#define DIVISIONES_DESC_LEN 30
#define DIVISIONES_CLASIF_LEN 30
#define DIVISIONES_REGION_LEN 9
#define DIVISIONES_PERIODO_LEN 15

#define APERTURAS_COD_LEN 20
#define APERTURAS_DESC_LEN 30
#define APERTURAS_CLASIF_LEN 30
#define APERTURAS_PERIODO_LEN 9 
#define APERTURAS_REGION_LEN 15

typedef struct{
    char cod[DIVISIONES_COD_LEN];
    char desc[DIVISIONES_DESC_LEN];
    char clasif[DIVISIONES_CLASIF_LEN];
    double indiceIPC;
    double varMensIPC;
    double varAnualIPC;
    char region[DIVISIONES_REGION_LEN];
    union{
        int codificado;
        char decodificado[DIVISIONES_PERIODO_LEN];
    }periodo;
}IPCDivisiones;

typedef struct{
    char fecha[];
    char desc[];
    char periodo[]; // ????
    double indiceIPC;
    char region[];
    char grupo[];
}IPCClasificado;

typedef struct{
    char cod[APERTURAS_COD_LEN];
    char desc[APERTURAS_DESC_LEN];
    char clasif[APERTURAS_CLASIF_LEN];
    union{
        int codificado;
        char decodificado[APERTURAS_PERIODO_LEN];
    }periodo;
    double indiceIPC;
    double varMensIPC;
    double varAnualIPC;
    char region[APERTURAS_REGION_LEN];
}IPCAperturas;

int corregirCampos(Vector_t* vec, int (*Correctora)(void*));

int corregirIPCDivisiones(void* reg);
int decodificarFechaDivisiones(void* reg);
int convertirFechaDivisiones(void* reg);
int normalizarDescripcionDivisiones(void* reg);
int corregirDecimalIPCDivisiones(void* reg); //No tengo idea si tiene que estar aca esto

int corregirIPCAperturas(void* reg);

int corregirFormatoFechaAperturas(void* reg);
int corregirDecimalIPCAperturas(void* reg); //Idem que arriba

int herramientaAjustarMontosIPCDivisiones(Vector_t* vec);

int clasificarBySDivisiones(Vector_t* vec); //Mapeo el vector divisiones a vector por grupos
                                            //Calculo el promedio del ipc en sus campos, y lo convierto en el de nacional
                                            //Guardo ambos pasos en disco

int herramientaCalcularAlquiler(Vector_t* vec);


#endif // PROCESO_INCLUDED