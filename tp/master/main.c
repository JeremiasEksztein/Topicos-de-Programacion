#include <stdio.h>
#include "../vector/vector.h"
#include "../secuenciaPalabras/secuenciaPalabras.h"
#include "../proceso/proceso.h"

#define CANT_ARGS 3

#define ARG_DIVISIONES_NOM 1
#define ARG_APERTURAS_NOM 2

// main.c serie_ipc_divisiones.csv serie_ipc_aperturas.csv

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

    herramientaAjustarMontosIPCDivisiones(&vecDivisiones);

    clasificarBySDivisiones(&vecDivisiones);

    herramientaCalcularAlquiler(&vecAperturas);

    vectorDestruir(&vecDivisiones);
    vectorDestruir(&vecAperturas);

    return EXITO;
}
