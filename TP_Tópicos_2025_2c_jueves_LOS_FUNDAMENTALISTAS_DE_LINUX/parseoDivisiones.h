/** @ingroup ModuloDivisiones
 * @{ */

#ifndef PARSEODIVISIONES_H_INCLUDED
#define PARSEODIVISIONES_H_INCLUDED

/** @file parseoDivisiones.h
 * @brief Header con las funciones de parseo de divisiones */

#include <stdlib.h>
#include <stdio.h>
#include "errores.h"
#include "vector.h"
#include "iterador.h"
#include "secuenciaPalabras.h"
#include "cadenas.h"
#include "comunes.h"

/** @brief Funcion para parsear la lectura del archivo serie_ipc_divisiones.csv */
int parsearYCorregirIPCDivisiones(FILE* arch, void* reg);

/** @brief Funcion del tipo int (*Corrector)(void*), corrige los campos del vector de divisiones */
int corregirIPCDivisiones(void* reg);

/** @brief Funcion que decodifica el campo fecha segun lo pedido por el ej. 1 */
int decodificarFechaDivisiones(IPCDivisiones* reg, int* decod);

/** @brief Funcion que convierte el campo fecha de AAAAMM a Mes - AAAA segun lo pedido por el ej. 2 */
int convertirFechaDivisiones(IPCDivisiones* reg);

/** @brief Funcion que normaliza el campo de descripciones segun lo pedido por el ej. 3 */
int normalizarDescripcionDivisiones(IPCDivisiones* reg);

#endif /* PARSEODIVISIONES_H_INCLUDED */

/** }@ */
