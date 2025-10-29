/** @ingroup ModuloComunes
 * @{ */

#ifndef COMUNES_H_INCLUDED
#define COMUNES_H_INCLUDED

/** @file comunes.h
 * @brief Header con definiciones usadas en el proceso del programa */

#include "errores.h"
#include "vector.h"
#include "iterador.h"

#define SET_TERMINAL_SIZE "\x1b[=14H" /*Seteamos la terminal a 640x200 Colores de 16bits*/
#define FLUSH_TERMINAL "\x1b[2J\x1b[H" /*Borramos toda la terminal, movemos el cursor a (0;0)*/

#define COLOR_RESET "\x1b[0m" /*Reseteamos el color"*/
#define COLOR_BOLD "\x1b[1m"
#define COLOR_DIM "\x1b[2m"
#define COLOR_RED "\x1b[1;31m"
#define COLOR_GREEN "\x1b[1;32m"
#define COLOR_YELLOW "\x1b[1;33m"
#define COLOR_CYAN "\x1b[1;36m"
#define COLOR_GRAY "\x1b[0;37m"

#define COLOR_BRED "\x1b[1m\x1b[1;31m"
#define COLOR_BCYAN "\x1b[1m\x1b[1;36m"
#define COLOR_BYELLOW "\x1b[1m\x1b[1;33m"
#define COLOR_BGRAY "\x1b[1m\x1b[1;37m"

/*
typedef short bool;

#define true 1
#define false 0
*/

int validarFechaForm(char* str);
void imprimirHeaderTabla(char* titulo, char** campos, int* paddings, int cc);

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
