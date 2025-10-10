#include "comunes.h"

int main(){
    return 0;
}

int logError(int cod, char* file, int line, char* func)
{
    char mensaje[50];
    switch(cod){
        //Defino la descripcion del error aca.
    }

    printf("Error codigo: %d; En archivo: %s:%d; en funcion %s\n%s\n", cod, file, line, func, mensaje);

    return 0;
}

void* malloc_s(size_t n)
{
    void* tmp = malloc(n);

    if(!tmp){
        return NULL;
    }

    return tmp;
}

void* calloc_s(size_t n, size_t tam)
{  
    void* tmp = calloc(n, tam);

    if(!tmp){
        return NULL;
    }

    return tmp;
}

void* realloc_s(void* ptr, size_t n)
{
    if(!ptr){
        return NULL;
    }

    void* tmp = realloc(ptr, n);

    if(!tmp){
        return NULL;
    }

    return tmp;
}

int free_s(void* ptr)
{
    if(!ptr){
        return -1;
    }

    free(ptr);
    ptr = NULL;

    return 0;
}