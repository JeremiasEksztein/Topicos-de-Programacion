/** @ingroup iterador
 * @{ */

/** @file iterador.c
 * @brief Implementacion del iterador sobre Vector_t */

#include "iterador.h"

void iteradorCrear(Iterador_t* iterador, Vector_t* vector)
{
    iterador->vec = vector;
    iterador->ini = vector->data;
    iterador->cursor = iterador->ini;
    iterador->fin = (char*)vector->data + (vector->cantElem - 1) * vector->tamElem;
}

void iteradorDestruir(Iterador_t* iterador)
{
    iterador->vec = NULL;
    iterador->ini = NULL;
    iterador->fin = NULL;
    iterador->cursor = NULL;
}

void iteradorActualizar(Iterador_t* iterador)
{
    iterador->ini = iterador->vec->data;
    iterador->cursor = iterador->ini;
    iterador->fin = (char*)iterador->vec->data + (iterador->vec->cantElem - 1) * iterador->vec->tamElem;
}

void* iteradorSiguiente(Iterador_t* iterador)
{
    if(iterador->cursor > iterador->fin){
        return NULL;
    }

    void* tmp = iterador->cursor;
    iterador->cursor = (char*)iterador->cursor + iterador->vec->tamElem;

    return tmp;
}

int iteradorReiniciar(Iterador_t* iterador)
{
    iterador->cursor = iterador->ini;
    return EXITO;
}

int iteradorMoverCursor(Iterador_t* iterador, size_t cant, int offset)
{
    if(cant > iterador->vec->cantElem){
        return -1;
    }

    if(cant < 0 && offset == ITER_FIN);

    void* origen = NULL;

    switch(offset){
        case ITER_INI:
            origen = iterador->ini;
            break;
        case ITER_ACT:
            origen = iterador->cursor;
            break;
        case ITER_FIN:
            origen = iterador->fin;
            break;
        default:
            return -1;
    }

    iterador->cursor = (char*)origen + cant * iterador->vec->tamElem;

    return EXITO;
}

size_t iteradorPosCursor(Iterador_t* iterador)
{
    return (((char*)iterador->cursor - (char*)iterador->ini) / iterador->vec->tamElem);
}

int iteradorEsFin(Iterador_t* iterador)
{
    return (iterador->cursor == iterador->fin) ? 1 : 0;
}

/** }@ */
