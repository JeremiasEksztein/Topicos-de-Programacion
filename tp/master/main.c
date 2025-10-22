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

/// @brief El programa tiene que correrse con dos argumentos: los nombres de los archivos serie_ipc_divisiones.csv y serie_ipc_aperturas.csv

// main.c serie_ipc_divisiones.csv serie_ipc_aperturas.csv

int main(int argc, char* argv[])
{
    if(argc != CANT_ARGS){  // Si no se ingresa la cantidad correcta de argumentos salimos
        LOG(ERR_ARGS);
    }
    
    setlocale(LC_ALL, "es_AR.UTF-8"); // Fijamos el locale del programa al locale argentino

    Vector_t vecDivisiones, vecAperturas;

    LOG(vectorCrear(&vecDivisiones, sizeof(IPCDivisiones))); // Creamos el vector de divisiones
    LOG(vectorReservar(&vecDivisiones, 14000)); // Reservamos espacio para 14000 elementos
    LOG(vectorLeerDeTexto(&vecDivisiones, argv[ARG_DIVISIONES_NOM], parsearIPCDivisiones)); // Leemos y parseamos al vector serie_ipc_divisiones.csv

    LOG(vectorEliminarPos(&vecDivisiones, 0));// Eliminamos el titulo del vector

    LOG(corregirCampos(&vecDivisiones, corregirIPCDivisiones));// Corregimos los campos del vector

    LOG(vectorCrear(&vecAperturas, sizeof(IPCAperturas))); // Creamos el vector de aperturas
    LOG(vectorReservar(&vecAperturas, 28000)); // Reservamos espacio para 28000 elementos
    LOG(vectorLeerDeTexto(&vecAperturas, argv[ARG_APERTURAS_NOM], parsearIPCAperturas)); // Leemos y parseamos al vector serie_ipc_aperturas.csv
 
    LOG(vectorEliminarPos(&vecAperturas, 0)); // Eliminamos el titulo del vector
 
    LOG(corregirCampos(&vecAperturas, corregirIPCAperturas)); // Corregimos los campos del vector
 
    LOG(vectorEscribirATexto(&vecDivisiones, ARCH_DIVISIONES, parsearParaDivisiones)); // Guardamos los contenidos de los vectores en archivos .csv
    LOG(vectorEscribirATexto(&vecAperturas, ARCH_APERTURAS, parsearParaAperturas));

    LOG(herramientaAjustarMontosIPCDivisiones(&vecDivisiones)); // Usamos la herramienta de calcular montos ajustados del punto 5

    LOG(clasificarBySIPCDivisiones(&vecDivisiones)); // Ejecutamos la clasificacion pedida por el punto 6 en bienes y servicios

    LOG(herramientaCalcularAlquilerIPCAperturas(&vecAperturas)); // Usamos la herramienta de calcular alquiler ajustado por inflacion del punto 9

    vectorDestruir(&vecDivisiones); // Liberamos la memoria alocada para los vectores
    vectorDestruir(&vecAperturas);

    return EXITO; // Salimos gente.
}


void imprimirRegistroDivisiones(void* reg)
{
    IPCDivisiones* tmp = reg;

    printf("%s %s %s %s %s %s %s %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
}

int parsearParaDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    return EXITO;
}

int parsearParaAperturas(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->periodo, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region);
    return EXITO;
}