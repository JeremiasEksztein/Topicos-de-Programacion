#include <stdio.h>
#include "../vector/vector.h"
#include "../secuenciaPalabras/secuenciaPalabras.h"
#include "../proceso"

#define CANT_ARGS 3

#define ARG_DIVISIONES_NOM 1
#define ARG_APERTURAS_NOM 2


int main(int argc, char* argv[])
{
    if(argc != CANT_ARGS){
        return -1;
    }

    Vector_t vecDivisiones, vecAperturas;

    vectorCrear(&vecDivisiones, sizeof(IPCDivisiones));
    vectorLeerDeTexto(&vecDivisiones, argv[ARG_DIVISIONES_NOM], parsearIPCDivisiones);

    corregirCampos(&vecDivisiones, corregirIPCDivisiones);

    vectorCrear(&vecAperturas, sizeof(IPCAperturas));
    vectorLeerDeTexto(&vecAperturas, argv[ARG_APERTURAS_NOM], parsearIPCAperturas);

    corregirCampos(&vecAperturas, corregirIPCAperturas);

    return 0;
}
