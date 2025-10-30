/** @defgroup iterador
 * @ingroup ModuloVector
 * @{ */

#ifndef ITERADOR_H_INCLUDED
#define ITERADOR_H_INCLUDED

/** @file iterador.h
 * @brief Header con las funcionalidades del iterador asociado al TDA Vector */

#include "vector.h"

#define ITER_INI 1
#define ITER_ACT 2
#define ITER_FIN 3

/** @brief Struct del TDA iterador para el vector */
typedef struct{
    Vector_t* vec;
    void* ini;
    void* cursor;
    void* fin;
}Iterador_t;

void iteradorCrear(Iterador_t* iterador, Vector_t* vector);
void iteradorDestruir(Iterador_t* iterador);
void* iteradorSiguiente(Iterador_t* iterador);
void iteradorActualizar(Iterador_t* iterador);
int iteradorReiniciar(Iterador_t* iterador);
int iteradorMoverCursor(Iterador_t* iterador, size_t cant, int offset);
size_t iteradorPosCursor(Iterador_t* iterador);
int iteradorEsFin(Iterador_t* iterador);

#endif /* ITERADOR_H_INCLUDED */

/** }@ */
