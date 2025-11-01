/** @ingroup ModuloAperturas
 * @{ */

#ifndef HERRAMIENTASAPERTURAS_H_INCLUDED
#define HERRAMIENTASAPERTURAS_H_INCLUDED

/** @file herramientasAperturas.h
 * @brief Header con las herramientas de aperturas */

#include "comunes.h"
#include "algoritmos.h"
#include "vector.h"
#include "errores.h"
#include "formulario.h"

int herramientaCalcularAlquilerIPCAperturas(Vector_t* vec);

RespuestaAlquileres preguntarAlquileres(void);

int verificarFechaAper(char* ans);

char* convertirFechaResAper(char* ans);

int filtrarAlquileres(void* dato, void* contexto);

void* mapearAlquileres(void* dato, void* contexto, void* elem);

void mostrarAlquileres(void* reg);

#endif /* HERRAMIENTASAPERTURAS_H_INCLUDED */

/** }@ */
