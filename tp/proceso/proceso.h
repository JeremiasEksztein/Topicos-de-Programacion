#ifndef PROCESO_INCLUDED
#define PROCESO_INCLUDED

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "../comunes/comunes.h"
#include "../vector/vector.h"
#include "../vector/iterador.h"
#include "../secuenciaPalabras/secuenciaPalabras.h"
#include "../cadenas/cadenas.h"

#define DIVISIONES_COD_LEN 20
#define DIVISIONES_DESC_LEN 30
#define DIVISIONES_CLASIF_LEN 30
#define DIVISIONES_INDICES_LEN 15
#define DIVISIONES_REGION_LEN 9
#define DIVISIONES_PERIODO_LEN 25

#define APERTURAS_COD_LEN 20
#define APERTURAS_DESC_LEN 30
#define APERTURAS_CLASIF_LEN 30
#define APERTURAS_INDICES_LEN 15
#define APERTURAS_PERIODO_LEN 25
#define APERTURAS_REGION_LEN 15

#define CLASIFICADO_DESC_LEN 30
#define CLASIFICADO_CLASIF_LEN 30
#define CLASIFICADO_PERIODO_LEN 9
#define CLASIFICADO_IND_IPC_LEN 15
#define CLASIFICADO_REGION_LEN 15
#define CLASIFICADO_GRUPO_LEN 15

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
    char fecha[CLASIFICADO_PERIODO_LEN];
    char desc[CLASIFICADO_DESC_LEN];
    char periodo[CLASIFICADO_PERIODO_LEN]; // ¿¿ Repite el campo de fecha ??
    char indiceIPC[CLASIFICADO_IND_IPC_LEN];
    char region[CLASIFICADO_REGION_LEN];
    char grupo[CLASIFICADO_GRUPO_LEN];
}IPCClasificado;

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

void pasarATitulo(Palabra_t* pal);
void palabraAMinuscula(Palabra_t* pal);

int corregirIPCAperturas(void* reg);

int corregirFormatoFechaAperturas(void* reg);


int herramientaAjustarMontosIPCDivisiones(Vector_t* vec);

int clasificarBySIPCDivisiones(Vector_t* vec); //Mapeo el vector divisiones a vector por grupos
                                            //Calculo el promedio del ipc en sus campos, y lo convierto en el de nacional
                                            //Guardo ambos pasos en disco

int herramientaCalcularAlquilerIPCAperturas(Vector_t* vec);


#endif // PROCESO_INCLUDED