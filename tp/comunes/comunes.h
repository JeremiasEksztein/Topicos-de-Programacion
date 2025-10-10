#ifndef COMUNES_INCLUDED
#define COMUNES_INCLUDED

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

#define TRY(stmt) do{           \
                if(stmt != EXITO){ \
                    logError((stmt), __FILE__, __LINE__, __func__);               \
                               \
                }while(0);      \
                                \

int logError(int cod);

void* malloc_s(size_t n); 
void* calloc_s(size_t n, size_t tam);
void* realloc_s(void* ptr, size_t n);
int free_s(void* ptr);

#endif