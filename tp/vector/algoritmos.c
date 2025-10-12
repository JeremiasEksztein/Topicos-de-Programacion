#include "algoritmos.h"

int transformarVector(Vector_t* vector, int (*Transformar)(void* dato, void* contexto), void* contexto)
{
    if(!vector || !Transformar || !contexto){
        return ERR_USUARIO;
    }

    void* i = vector->data;
    void* ult = vector->data + (vector->cantElem - 1) * vector->tamElem;

    for(; i < ult; i += vector->tamElem){
        Transformar(i, (!contexto ? NULL : contexto));
    }

    return EXITO;
}

Vector_t* copiarVector(Vector_t* vector)
{
    Vector_t* tmp = malloc(sizeof(Vector_t));

    if(!tmp){
        return NULL;
    }

    vectorCrear(tmp, vector->tamElem);

    void* i = vector->data;

    memmove(tmp->data, i, vector->cantElem * vector->tamElem);

    return tmp;
}

Vector_t* mapearVector(Vector_t* vector, void* (*Mapear)(void* dato, void* elem), size_t n)
{
    Vector_t* tmp = malloc(sizeof(Vector_t));

    if(!tmp){
        return NULL;
    }

    vectorCrear(tmp, n);

    void* elem = malloc(n);

    if(!elem){
        return NULL;
    }

    void* i = vector->data;
    void* ult = vector->data + (vector->cantElem - 1) * vector->tamElem;

    for(; i < ult; i += vector->tamElem){
        Mapear(i, elem);
        vectorEmpujar(tmp, elem);
    }

    return tmp;
}

Vector_t* filtrarVector(Vector_t* vector, int (*Filtrar)(void* dato, void* contexto), void* contexto)
{
    Vector_t* tmp = malloc(sizeof(Vector_t));

    if(!tmp){
        return NULL;
    }

    vectorCrear(tmp, vector->tamElem);

    void* i = vector->data;
    void* ult = vector->data + (vector->cantElem - 1) * vector->tamElem;

    for(; i < ult; i += vector->tamElem){
        if(Filtrar(i, contexto)){
            vectorEmpujar(tmp, i);
        }
    }

    return tmp;
}

void* reducirVector(Vector_t* vector, void* (*Reducir)(void* dato, void* acumulado))
{
    void* acumulador;
    void* i = vector->data;
    void* ult = vector->data + (vector->cantElem - 1) * vector->tamElem;

    for(; i < ult; i += vector->tamElem){
        acumulador = Reducir(i, acumulador);
    }

    return acumulador;
}
