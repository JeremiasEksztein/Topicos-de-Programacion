#ifndef MANEJODEARCHIVOS_H_INCLUDED
#define MANEJODEARCHIVOS_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>

#define EXITO 0
#define ERR_MEM 1
#define ERR_ARCH 6
#define ERR_READ 7

typedef int (*BinATxt)(const void*, FILE*);
typedef int (*TxtABin)(char*, void*);

int conversorBinATxt(const char* nomArchBin, const char* nomArchTxt, size_t tamReg, BinATxt binATxt);
int conversorTxtABin(const char* nomArchTxt, const char* nomArchBin, size_t tamReg, TxtABin txtABin);


#endif // MANEJODEARCHIVOS_H_INCLUDED
