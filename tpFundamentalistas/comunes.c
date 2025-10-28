/** @ingroup ModuloComunes 
 * @{ */

/** @file comunes.c
 * @brief Implementacion de comunes.h */

#include "comunes.h"

int corregirCampos(Vector_t* vec, int (*Corrector)(void*))
{
    Iterador_t iter;

    iteradorCrear(&iter, vec);

    void* tmp = NULL;

    while((tmp = iteradorSiguiente(&iter))){
        LOG(Corrector(tmp));
    }

    iteradorDestruir(&iter);

    return EXITO;
}

int parsearEscrDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    return EXITO;
}

int parsearEscrPromedio(FILE* arch, void* reg)
{
    IPCPromedio* i = reg;

    fprintf(arch, "%s | %s | %s | %s\n", i->fecha, i->region, i->indiceBienes, i->indiceServicios);

    return EXITO;
}

int parsearEscrAperturas(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->periodo, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region);
    return EXITO;
}

int parsearEscrAlquileres(FILE* arch, void* reg)
{
    IPCAlquileres* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s\n", tmp->periodo, tmp->indiceIPC, tmp->acumuladoIPC, tmp->montoAjustado);

    return 0;
}

/** }@ */
