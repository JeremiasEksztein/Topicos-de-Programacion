/** @ingroup ModuloAperturas
 * @{ */

#ifndef PARSEOAPERTURAS_H_INCLUDED
#define PARSEOAPERTURAS_H_INCLUDED

/** @file parseoAperturas.h
 * @brief Header con las funciones de parseo de aperturas */

#include <stdlib.h>
#include <stdio.h>
#include "errores.h"
#include "vector.h"
#include "iterador.h"
#include "cadenas.h"
#include "comunes.h"

/** @brief Funcion para parsear la lectura del archivo serie_ipc_aperturas.csv */
int parsearYCorregirIPCAperturas(char* buffer, void* reg);

/** @brief Funcion del tipo int (*Corrector)(void*), corrige los campos del vector de aperturas */
int corregirIPCAperturas(void* reg);

/** @brief Funcion que corrige el formato del campo fecha de AAAAMM a AAAA-MM-DD */
int corregirFormatoFechaAperturas(IPCAperturas* reg);

#endif /** PARSEOAPERTURAS_H_INCLUDED */

/** }@ */
