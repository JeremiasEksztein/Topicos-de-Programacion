#include <stdio.h>
#include <locale.h>
#include "../comunes/comunes.h"
#include "../vector/vector.h"
#include "../secuenciaPalabras/secuenciaPalabras.h"
#include "../proceso/proceso.h"

void imprimirRegistroDivisiones(void* reg);
int parsearParaDivisiones(FILE* arch, void* reg);
int parsearParaAperturas(FILE* arch, void* reg);

#define CANT_ARGS 3

#define ARG_DIVISIONES_NOM 1
#define ARG_APERTURAS_NOM 2

// main.c serie_ipc_divisiones.csv serie_ipc_aperturas.csv

int main(int argc, char* argv[])
{
    if(argc != CANT_ARGS){  // Si no se ingresa la cantidad correcta de argumentos salimos
        return ERR_USUARIO;
    }

    setlocale(LC_ALL, "es_AR.UTF-8");
    setlocale(LC_CTYPE, "es_AR.UTF-8");

    Vector_t vecDivisiones, vecAperturas;

    vectorCrear(&vecDivisiones, sizeof(IPCDivisiones)); // Creamos el vector de divisiones
    vectorLeerDeTexto(&vecDivisiones, argv[ARG_DIVISIONES_NOM], parsearIPCDivisiones); // Leemos y parseamos al vector serie_ipc_divisiones.csv

    vectorEliminarPos(&vecDivisiones, 0); // Eliminamos el titulo del vector

    corregirCampos(&vecDivisiones, corregirIPCDivisiones); // Corregimos los campos del vector

    vectorCrear(&vecAperturas, sizeof(IPCAperturas)); // Creamos el vector de aperturas
    vectorLeerDeTexto(&vecAperturas, argv[ARG_APERTURAS_NOM], parsearIPCAperturas); // Leemos y parseamos al vector serie_ipc_aperturas.csv
 
    vectorEliminarPos(&vecAperturas, 0); // Eliminamos el titulo del vector
 
    corregirCampos(&vecAperturas, corregirIPCAperturas); // Corregimos los campos del vector
 
    vectorEscribirATexto(&vecDivisiones, ARCH_DIVISIONES, parsearParaDivisiones); // Guardamos los contenidos de los vectores en archivos .csv
    vectorEscribirATexto(&vecAperturas, ARCH_APERTURAS, parsearParaAperturas);

    herramientaAjustarMontosIPCDivisiones(&vecDivisiones); // Usamos la herramienta de calcular montos ajustados del punto 5

    clasificarBySIPCDivisiones(&vecDivisiones); // Ejecutamos la clasificacion pedida por el punto 6 en bienes y servicios

    herramientaCalcularAlquilerIPCAperturas(&vecAperturas); // Usamos la herramienta de calcular alquiler ajustado por inflacion del punto 9

    vectorDestruir(&vecDivisiones); // Liberamos la memoria alocada para los vectores
    vectorDestruir(&vecAperturas);

    return EXITO; // Salimos
}


void imprimirRegistroDivisiones(void* reg)
{
    IPCDivisiones* tmp = reg;

    printf("%s %s %s %s %s %s %s %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
}

int parsearParaDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s | %s | %s | %s | %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    return EXITO;
}

int parsearParaAperturas(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s | %s | %s | %s | %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->periodo, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region);
    return EXITO;
}