/** @ingroup ModuloDivisiones
 * @{ */

#ifndef HERRAMIENTASDIVISIONES_H_INCLUDED
#define HERRAMIENTASDIVISIONES_H_INCLUDED

/** @file herramientasDivisiones.h
 * @brief Header con las funciones de herramientas para divisiones */

#include "comunes.h"
#include "errores.h"
#include "algoritmos.h"
#include "vector.h"
#include "formulario.h"

int herramientaAjustarMontosIPCDivisiones(Vector_t* vec);

RespuestaMontos preguntarAjustarMonto(void);

int filtrarIPCDivisiones(void* dato, void* contexto);

int clasificarBySIPCDivisiones(Vector_t* vec);

int filtrarBienes(void* dato, void* contexto);

int filtrarServicios(void* dato, void* contexto);

void* obtenerPeriodo(void* elem);

int compararPeriodo(void* lhs, void* rhs);

void* reducirBySProm(void* dato, void* acumulado);

void* unirBienesYServicios(void* lhs, void* rhs, void* elem);

#endif /* HERRAMIENTASDIVISIONES_H_INCLUDED */

/** }@ */
