#ifndef HERRAMIENTAS_H_INCLUDED
#define HERRAMIENTAS_H_INCLUDED

#include "parseo.h"
#include "algoritmos.h"
#include "vector.h"

#define ARCH_BIENES "./archivos/pruebaBienes.csv"
#define ARCH_SERVICIOS "./archivos/pruebaServicios.csv"
#define ARCH_NACIONAL "./archivos/pruebaNacional.csv"
#define ARCH_ALQUILERES_CSV "./archivos/pruebaAlquileres.csv"
#define ARCH_ALQUILERES_DAT "./archivos/pruebaAlquileres.dat"

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

typedef struct{
    char periodo[APERTURAS_PERIODO_LEN];
    char monto[APERTURAS_INDICES_LEN];
    union{ //Algo medio feo, pero sirve para aprovechar el espacio, uso  tmp.region si queres usar region, tmp.acumulado si queres usar acumulado. La escritura sobre uno sobreescribe el otro.
        char region[APERTURAS_REGION_LEN];
        char acumulado[APERTURAS_INDICES_LEN];
    };
}RespuestaAlquileres;

typedef struct{
    char periodo[APERTURAS_PERIODO_LEN];
    char indiceIPC[APERTURAS_INDICES_LEN];
    char acumuladoIPC[APERTURAS_INDICES_LEN];
    char montoAjustado[APERTURAS_INDICES_LEN];
}IPCAlquileres;

int herramientaAjustarMontosIPCDivisiones(Vector_t* vec);
RespuestaMontos preguntarAjustarMonto(void);
int filtrarIPCDivisiones(void* dato, void* contexto);

int clasificarBySIPCDivisiones(Vector_t* vec);
int filtrarBienes(void* dato, void* contexto);
int filtrarServicios(void* dato, void* contexto);
int filtrarBienesDebug(void* dato, void* contexto);
int filtrarServiciosDebug(void* dato, void* contexto);
void* obtenerPeriodo(void* elem);
void* obtenerCod(void* elem);
int compararPeriodo(void* lhs, void* rhs);
int compararCodBienes(void* lhs, void* rhs);
int compararCodServicios(void* lhs, void* rhs);
void* reducirBySProm(void* dato, void* acumulado);
void* unirBienesYServicios(void* lhs, void* rhs, void* elem);
int parsearIPCPromedio(FILE* arch, void* reg);

int herramientaCalcularAlquilerIPCAperturas(Vector_t* vec);
RespuestaAlquileres preguntarAlquileres(void);
int filtrarAlquileres(void* dato, void* contexto);
//IPCAlquileres* calcularIPCAlquileres(Vector_t* vec, RespuestaAlquileres* req);
void* mapearAlquileres(void* dato, void* contexto, void* elem);
void mostrarAlquileres(void* reg);

#endif // HERRAMIENTAS_H_INCLUDED
