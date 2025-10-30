/** @ingroup vector
 *  @{
 */

/** @file vector.c
 * @brief Implementacion de vector.h */

#include "vector.h"

int vectorCrear(Vector_t* vector, size_t tamElem)
{
    if(!vector){
        return ERR_PUNTERO_NULO;
    }

    vector->data = malloc(tamElem * DEFAULT_CAP);

    if(!(vector->data)){
        return ERR_SIN_MEM;
    }

    vector->cantElem = 0;
    vector->tamElem = tamElem;
    vector->capacidad = DEFAULT_CAP;

    return EXITO;
}

int vectorCrearConCapacidad(Vector_t* vector, size_t tamElem, size_t capacidad)
{
    if(!vector){
        return ERR_PUNTERO_NULO;
    }

    if(capacidad < 0 || capacidad > MAX_CAPACIDAD){
        return ERR_USUARIO;
    }

    vector->data = malloc(tamElem * capacidad);

    if(!(vector->data)){
        return ERR_SIN_MEM;
    }

    vector->cantElem = 0;
    vector->capacidad = capacidad;
    vector->tamElem = tamElem;

    return EXITO;
}

int vectorDestruir(Vector_t* vector)
{
    if(!vector){
        return ERR_USUARIO;
    }

    if(!(vector->data)){
        return ERR_PUNTERO_NULO; /* free(NULL) */
    }

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

    /*printf("Realocacion exitosa de %ll a %ll bytes\n", vector->capacidad * vector->tamElem, nuevaCap * vector->tamElem); */

    vector->data = nuevaData;
    vector->capacidad = nuevaCap;

    return EXITO;
}

int vectorLeerDeTexto(Vector_t* vector, const char* nomArch, int (ParsearTexto)(FILE*, void*))
{
    FILE* arch = fopen(nomArch, "rt");

    if(!arch){
        return ERR_ARCH;
    }

    void* tmp = malloc(vector->tamElem);
    int err = EXITO;

    if(!tmp){
        fclose(arch);
        return ERR_SIN_MEM;
    }

    ParsearTexto(arch, tmp);
    vectorEmpujar(vector, tmp);

    while(!feof(arch)){
        if((err = ParsearTexto(arch, tmp)) != EXITO){
            free(tmp);
            fclose(arch);
            return err;
        }
        vectorEmpujar(vector, tmp);
    }

    fclose(arch);
    free(tmp);

    return EXITO;
}

int vectorEscribirATexto(Vector_t* vector, const char* nomArch, int (ParsearTexto)(FILE*, void*))
{
    FILE* arch = fopen(nomArch, "wt");

    if(!arch){
        return ERR_ARCH;
    }

    char* i = (char*)vector->data;
    char* ult = (char*)vector->data + vector->cantElem * vector->tamElem;

    for(; i < ult; i += vector->tamElem){
        ParsearTexto(arch, i);
    }

    fclose(arch);

    return EXITO;
}

int vectorLeerDeBinario(Vector_t* vector, const char* nomArch)
{
    FILE* arch = fopen(nomArch, "rb");

    if(!arch){
        return ERR_ARCH;
    }

    fseek(arch, 0, SEEK_END);

    size_t tamArch = ftell(arch) / vector->tamElem;

    fseek(arch, 0, SEEK_SET);

    if(tamArch >= vector->capacidad){
        if(vectorRedimensionar(vector, tamArch * FACTOR_INCR)){
            return ERR_SIN_MEM;
        }
    }

    if(!fread(vector->data, tamArch * vector->tamElem, tamArch, arch)){
        return ERR_ARCH;
    }

    vector->cantElem = tamArch;
    fclose(arch);

    return EXITO;
}

int vectorEscribirABinario(Vector_t* vector, const char* nomArch)
{
    FILE* arch = fopen(nomArch, "wb");

    if(!arch){
        return ERR_ARCH;
    }

    fwrite(vector->data, vector->tamElem, vector->cantElem, arch);

    fclose(arch);

    return EXITO;
}

void* vectorObtener(Vector_t* vector, size_t pos)
{
    if(pos < 0 || pos > vector->cantElem){
        return NULL;
    }

    return ((char*)vector->data + vector->tamElem * pos);
}

int vectorInsertar(Vector_t* vector, size_t pos, void* elem)
{
    if(pos < 0 || pos > vector->cantElem){
        return ERR_USUARIO;
    }

    if(vector->cantElem == vector->capacidad){
        if(vectorRedimensionar(vector, FACTOR_INCR * vector->capacidad)){
            return ERR_SIN_MEM;
        }
    }

    char* i = (char*)vector->data + pos * vector->tamElem;

    memcpy(i + vector->tamElem, i, (vector->cantElem - pos) * vector->tamElem);
    memcpy(i, elem, vector->tamElem);

    vector->cantElem++;

    return EXITO;
}

int vectorEmpujar(Vector_t* vector, void* elem)
{
    if(vector->cantElem == vector->capacidad){
        if(vectorRedimensionar(vector, FACTOR_INCR * vector->capacidad) != EXITO){
            return ERR_SIN_MEM;
        }
    }

    char* i = (char*)vector->data + (vector->cantElem) * vector->tamElem;

    memcpy(i, elem, vector->tamElem);

    vector->cantElem++;

    return EXITO;
}

int vectorInsertarOrd(Vector_t* vector, void* elem, int (*Cmp)(void*, void*))
{
    if(vector->cantElem == vector->capacidad){
        if(vectorRedimensionar(vector, FACTOR_INCR * vector->capacidad)){
            return ERR_SIN_MEM;
        }
    }

    char* i = vector->data;
    char* j = (char*)vector->data + (vector->cantElem - 1) * vector->tamElem;

    while(Cmp(elem, i) > 0 && i <= j){
        i +=  vector->tamElem;
    }

    if(Cmp(elem, i) == 0 && i > j){
        return ERR_USUARIO;
    }

    memmove(i + vector->tamElem, i, j - i + vector->tamElem);

    memmove(i, elem, vector->tamElem);
    vector->cantElem++;

    return EXITO;
}

int vectorEliminarElem(Vector_t* vector, void* elem, int (*Cmp)(void*, void*))
{
    if(Cmp == NULL){
        return ERR_USUARIO;
    }

    size_t pos = vectorBuscar(vector, elem, Cmp);

    if(!pos){
        return ERR_USUARIO;
    }

    vectorEliminarPos(vector, pos);

    return EXITO;
}

int vectorOrdEliminarElem(Vector_t* vector, void* elem, int (*Cmp)(void*, void*))
{
    if(Cmp == NULL){
        return ERR_USUARIO;
    }

    size_t pos = vectorBuscar(vector, elem, Cmp);

    if(pos == -1){
        return ERR_USUARIO;
    }

    vectorEliminarPos(vector, --pos);

    return EXITO;
}

int vectorEliminarPos(Vector_t* vector, size_t pos)
{
    if(pos < 0 || pos > vector->cantElem){
        return ERR_USUARIO;
    }

    char* i = (char*)vector->data + pos * vector->tamElem;

    memcpy(i, i + vector->tamElem, (vector->cantElem - pos) * vector->tamElem);

    vector->cantElem--;

    return EXITO;
}

int vectorOrdenar(Vector_t* vector, int (*Cmp)(void*, void*))
{
    char* i = (char*)vector->data + vector->tamElem;
    char* j = vector->data;
    char* ult = (char*)vector->data + (vector->cantElem - 1) * vector->tamElem;
    char* tmp = malloc(vector->tamElem);

    if(!tmp){
        return ERR_SIN_MEM;
    }

    for(; i <= ult; i += vector->tamElem){
        j = i - vector->tamElem;
        memcpy(tmp, i, vector->tamElem);

        while(Cmp(j, tmp) > 0 && j >= (char*)vector->data){
            memmove(j + vector->tamElem, j, vector->tamElem);
            j -= vector->tamElem;
        }

        memmove(j + vector->tamElem, tmp, vector->tamElem);
    }

    return EXITO;
}

size_t vectorBuscar(Vector_t* vector, void* elem, int (*Cmp)(void*, void*))
{
    char* ori = vector->data;
    char* li = vector->data;
    char* ls = (char*)vector->data + (vector->cantElem - 1) * vector->tamElem;
    char* med = li + ((ls - li) / (2 * vector->tamElem)) * vector->tamElem;

    int cmp = 0;

    while(li <= ls && (cmp = Cmp(med, elem)) != 0){
        if(cmp > 0){
            ls = med - vector->tamElem;
        }else{
            li = med + vector->tamElem;
        }

        med = li + ((ls - li) / (2 * vector->tamElem)) * vector->tamElem;
    }

    if(li > ls){
        return -1;
    }

    /*printf("%zu\n", ((med - ori) / vector->tamElem)); */

    return ((med - ori) / vector->tamElem);
}

size_t vectorCantElem(Vector_t* vector)
{
    if(!vector){
        return -1;
    }
    
    return vector->cantElem;
}

size_t vectorTamElem(Vector_t* vector)
{
    return vector->tamElem;
}

size_t vectorCapacidad(Vector_t* vector)
{
    return vector->capacidad;
}

int vectorVacio(Vector_t* vector)
{
    return vector->cantElem == 0 ? 1 : 0;
}

void mostrarVector(Vector_t* vector, void (*Mostrar)(void*))
{
    char* i = vector->data;
    char* ult = (char*)vector->data + vector->cantElem * vector->tamElem;

    for(; i < ult; i += vector->tamElem){
        Mostrar(i);
    }
}

/** }@ */
