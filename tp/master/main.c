#include <stdio.h>
#include "../comunes/comunes.h"
#include "../vector/vector.h"
#include "../secuenciaPalabras/secuenciaPalabras.h"
#include "../proceso/proceso.h"

void imprimirRegistroDivisiones(void* reg);
int parsearParaEscritura(FILE* arch, void* reg);
int parsearParaEscritura2(FILE* arch, void* reg);


#define CANT_ARGS 3

#define ARG_DIVISIONES_NOM 1
#define ARG_APERTURAS_NOM 2

// main.c serie_ipc_divisiones.csv serie_ipc_aperturas.csv

int main(int argc, char* argv[])
{
    if(argc != CANT_ARGS){
        return ERR_USUARIO;
    }

    Vector_t vecDivisiones, vecAperturas;

    TRY(vectorCrear(&vecDivisiones, sizeof(IPCDivisiones)));
    TRY(vectorLeerDeTexto(&vecDivisiones, argv[ARG_DIVISIONES_NOM], parsearIPCDivisiones));

    TRY(corregirCampos(&vecDivisiones, corregirIPCDivisiones));

    TRY(vectorCrear(&vecAperturas, sizeof(IPCAperturas)));
    TRY(vectorLeerDeTexto(&vecAperturas, argv[ARG_APERTURAS_NOM], parsearIPCAperturas));

    TRY(corregirCampos(&vecAperturas, corregirIPCAperturas));

    herramientaAjustarMontosIPCDivisiones(&vecDivisiones);

    vectorDestruir(&vecDivisiones);
    vectorDestruir(&vecAperturas);

    /*

    clasificarBySDivisiones(&vecDivisiones);

    herramientaCalcularAlquiler(&vecAperturas);

    vectorDestruir(&vecDivisiones);
    vectorDestruir(&vecAperturas);

    return EXITO;

    */
}


void imprimirRegistroDivisiones(void* reg)
{
    IPCDivisiones* tmp = reg;

    printf("%s %s %s %s %s %s %s %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
}

int parsearParaEscritura(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s | %s | %s | %s | %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    return EXITO;
}

int parsearParaEscritura2(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s | %s | %s | %s | %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->periodo, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region);
    return EXITO;
}