/** @ingroup ModuloComunes
 * @{ */

#ifndef COMUNES_H_INCLUDED
#define COMUNES_H_INCLUDED

/** @file comunes.h
 * @brief Header con definiciones usadas en el proceso del programa */

#include "errores.h"
#include "vector.h"
#include "iterador.h"

/** @brief Funcion del tipo Corrector */
typedef int (*Corrector)(void*);

/** @brief Funcion generica para corregir los campos de ambos vectores */
int corregirCampos(Vector_t* vec, int (*Corrector)(void*));

#define ARCH_DIVISIONES "./archivos/pruebaDivisiones.csv"
#define ARCH_BIENES "./archivos/pruebaBienes.csv"
#define ARCH_SERVICIOS "./archivos/pruebaServicios.csv"
#define ARCH_NACIONAL "./archivos/pruebaNacional.csv"

#define DIVISIONES_COD_LEN 15
#define DIVISIONES_DESC_LEN 61
#define DIVISIONES_CLASIF_LEN 40
#define DIVISIONES_INDICES_LEN 18
#define DIVISIONES_REGION_LEN 15
#define DIVISIONES_PERIODO_LEN 30

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
    double monto;
    char region[DIVISIONES_REGION_LEN];
    char periodoIni[DIVISIONES_PERIODO_LEN];
    char periodoFin[DIVISIONES_PERIODO_LEN];
}RespuestaMontos;

typedef struct{
    char fecha[DIVISIONES_PERIODO_LEN];
    char region[DIVISIONES_REGION_LEN];
    char indiceBienes[DIVISIONES_INDICES_LEN];
    char indiceServicios[DIVISIONES_INDICES_LEN];
}IPCPromedio;

int parsearEscrDivisiones(FILE* arch, void* reg);

int parsearEscrPromedio(FILE* arch, void* reg);

#define ARCH_APERTURAS "./archivos/pruebaAperturas.csv"
#define ARCH_ALQUILERES_CSV "./archivos/pruebaAlquileres.csv"
#define ARCH_ALQUILERES_DAT "./archivos/pruebaAlquileres.dat"

#define APERTURAS_COD_LEN 15
#define APERTURAS_DESC_LEN 61
#define APERTURAS_CLASIF_LEN 40
#define APERTURAS_INDICES_LEN 18
#define APERTURAS_PERIODO_LEN 30
#define APERTURAS_REGION_LEN 15


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

typedef struct{
    char periodo[APERTURAS_PERIODO_LEN];
    char monto[APERTURAS_INDICES_LEN];
    char region[APERTURAS_REGION_LEN];
    char acumulado[APERTURAS_INDICES_LEN];
}RespuestaAlquileres;

typedef struct{
    char periodo[APERTURAS_PERIODO_LEN];
    char indiceIPC[APERTURAS_INDICES_LEN];
    char acumuladoIPC[APERTURAS_INDICES_LEN];
    char montoAjustado[APERTURAS_INDICES_LEN];
}IPCAlquileres;

int parsearEscrAperturas(FILE* arch, void* reg);

int parsearEscrAlquileres(FILE* arch, void* reg);

#endif /* COMUNES_H_INCLUDED */

/** }@ */
