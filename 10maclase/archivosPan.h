#ifndef ARCHIVO_H_INCLUDED
#define ARCHIVO_H_INCLUDED

#include <stdio.h>

#define TODO_OK 0
#define ERR_AP_ARCHIVO 1
#define ERR_SIN_MEM 2

typedef void (*BinATxt)(const void* reg, FILE* archTxt);
typedef int (*TxtABin)(char* linea, void* reg);

char* cambiarSufijo(char* nomArch, char* old, char* new);
int conversorBinATxt(const char* nomArchBin, const char* nomArchTxt, size_t tamReg, BinATxt binATxt);
int conversorTxtABin(const char* nomArchTxt, const char* nomArchBin, size_t tamReg, TxtABin txtABin);
int crearIndice(const char* nomArch, size_t tamReg, size_t tamIdx, int crearRegIdx(void* reg, unsigned n, void* idx),int (*Cmp)(void*, void*));

#endif // ARCHIVO_H_INCLUDED
