#ifndef COMUNES_INCLUDED
#define COMUNES_INCLUDED

#include <stddef.h>

void* malloc_s(size_t n); 
void* calloc_s(void* ptr, size_t n);
void* realloc_s(void* ptr, size_t n);
int free_s(void* ptr);

#endif