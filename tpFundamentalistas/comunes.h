#ifndef COMUNES_H_INCLUDED
#define COMUNES_H_INCLUDED

/// @file comunes.h
/// @brief Header con definiciones de codigos de error y macros para su manejo

#include <stddef.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "cadenas.h"

#define LOG_FILE_NOM "errorlog.txt"

#define EXITO 0
#define ERR_PUNTERO_NULO 1
#define ERR_SIN_MEM 2
#define ERR_ARCH 3
#define ERR_BUFFER_CORTO 4
#define ERR_REGISTRO 5
#define ERR_USUARIO 6
#define ERR_ARGS 7

#define LOG(stmt) do{   \
    int err = (stmt);   \
    if(err != EXITO){   \
        logError(err, __FILE__, __LINE__,(char*)__func__); \
    }   \
}while(0)

int logError(int cod, char* file, int line, char* func);

void* malloc_s(size_t n);
void* calloc_s(size_t n, size_t tam);
void* realloc_s(void* ptr, size_t n);
int free_s(void* ptr);

#endif // COMUNES_H_INCLUDED
