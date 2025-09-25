#include "vector.h"

int meminte(void* dest, void* src, void* tmp, size_t n);

int meminte(void* dest, void* src, void* tmp, size_t n)
{
    memcpy(tmp, dest, n);
    memcpy(dest, src, n);
    memcpy(src, tmp, n);

    return EXITO;
}

int vectorCrear(Vector_t* vector, size_t tamElem)
{
    vector->data = malloc(tamElem * DEFAULT_CAP);

    if(!(vector->data)){
        return ERR_SIN_MEM;
    }

    vector->cantElem = 0;
    vector->tamElem = tamElem;
    vector->capacidad = DEFAULT_CAP;

    return EXITO;
}

int vectorDestruir(Vector_t* vector)
{
    free(vector->data);

    vector->cantElem = 0;
    vector->capacidad = 0;
    vector->tamElem = 0;

    return EXITO;
}

int vectorRedimensionar(Vector_t* vector, size_t nuevaCap)
{
    void* nuevaData = realloc(vector->data, nuevaCap * vector->tamElem);

    if(!(nuevaData)){
        return ERR_SIN_MEM;
    }

    vector->data = nuevaData;
    vector->capacidad = nuevaCap;

    return EXITO;
}

int vectorInsertar(Vector_t* vector, size_t pos, void* elem)
{
    if(pos < 1 || pos > vector->cantElem){
        return ERR_INPUT;
    }

    if(vector->cantElem == vector->capacidad){
        if(vectorRedimensionar(vector, FACTOR_INCR * vector->capacidad)){
            return ERR_SIN_MEM;
        }
    }

    void* i = vector->data + pos * vector->tamElem;

    memcpy(i + vector->tamElem, i, (vector->cantElem - pos) * vector->tamElem);
    memcpy(i, elem, vector->tamElem);

    vector->cantElem++;

    return EXITO;
}

int vectorEmpujar(Vector_t* vector, void* elem)
{
    if(vector->cantElem == vector->capacidad){
        if(vectorRedimensionar(vector, FACTOR_INCR * vector->capacidad)){
            return ERR_SIN_MEM;
        }
    }

    void* i = vector->data + (vector->cantElem) * vector->tamElem;

    memcpy(i, elem, vector->tamElem);

    vector->cantElem++;

    return EXITO;
}

int vectorEliminarElem(Vector_t* vector, void* elem, int (*Cmp)(void*, void*))
{
    if(Cmp == NULL){
        return ERR_INPUT;
    }

    size_t pos = vectorBuscar(vector, elem, Cmp);

    if(!pos){
        return ERR_INPUT;
    }

    vectorEliminarPos(vector, pos);

    return EXITO;
}

int vectorEliminarPos(Vector_t* vector, size_t pos)
{
    if(pos < 1 || pos > vector->cantElem){
        return ERR_INPUT;
    }

    void* i = vector->data + pos * vector->tamElem;

    memcpy(i, i + vector->tamElem, (vector->cantElem - pos) * vector->tamElem);

    vector->cantElem--;

    return EXITO;
}

int vectorOrdenar(Vector_t* vector, int (*Cmp)(void*, void*))
{
    void* tmp = malloc(vector->tamElem);

    if(!tmp){
        return ERR_SIN_MEM;
    }

    /*Rellenar con codigo*/
}

size_t vectorBuscar(Vector_t* vector, void* elem, int (*Cmp)(void*, void*))
{
    void* ori = vector->data;
    void* li = vector->data;
    void* ls = vector->data + (vector->cantElem - 1) * vector->tamElem;
    void* med = li + ((ls - li) / (2 * vector->tamElem));

    int cmp = 0;

    if(ls > li && (cmp = Cmp(med, elem)) != 0){
        if(cmp > 0){
            ls = med - vector->tamElem;
        }else{
            li = med + vector->tamElem;
        }

        med = li + ((ls - li) / (2 * vector->tamElem));
    }

    if(ls <= li){
        return -1;
    }

    return ((med - ori) / vector->tamElem);    
}

void mostrarVector(Vector_t* vector, void (*Mostrar)(void*))
{
    void* i = vector->data;
    void* ult = vector->data + (vector->cantElem - 1) * vector->tamElem;

    for(; i < ult; i += vector->tamElem){
        Mostrar(i);
    }
}