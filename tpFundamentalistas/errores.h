/** @ingroup ModuloComunes
 * @{ */

#ifndef ERRORES_H_INCLUDED
#define ERRORES_H_INCLUDED

/** @file errores.h
 * @brief Header con funcionalidades de errores */

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
        logError(err, __FILE__, __LINE__, __DATE__, __TIME__,(char*)__func__); \
    }   \
}while(0)

int logError(int cod, char* file, int line, char* date, char* time, char* func);

#endif /* ERRORES_H_INCLUDED */

/** }@ */
