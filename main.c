#include <stdio.h>
#include <locale.h>
#include "comunes.h"
#include "vector.h"
#include "parseo.h"
#include "herramientas.h"

#define CANT_ARGS 3

#define ARG_DIVISIONES_NOM 1
#define ARG_APERTURAS_NOM 2

#define ESTIMACION_TAM_DIVISIONES 14000
#define ESTIMACION_TAM_APERTURAS 28000

// main.c ./archivos/serie_ipc_divisiones.csv ./archivos/serie_ipc_aperturas.csv

int main(int argc, char* argv[])
{
    if(argc != CANT_ARGS){  // Si no se ingresa la cantidad correcta de argumentos salimos
        LOG(ERR_ARGS);
    }

    //setlocale(LC_ALL, ""); // Fijamos el locale del programa al locale argentino

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
