/** @ingroup ModuloMaster
 * @{ */

/** @file main.c
 * @brief Punto de entrada del programa.
 * El programa va por partes. En primer lugar procesa y opera sobre el archivo de ipc_serie_divisiones.csv
 * en segundo lugar procesa ipc_serie_aperturas.csv. */

#include <stdio.h>
#include <locale.h>
#include "errores.h"
#include "comunes.h"
#include "vector.h"
#include "parseoDivisiones.h"
#include "herramientasDivisiones.h"
#include "parseoAperturas.h"
#include "herramientasAperturas.h"

#define CANT_ARGS 3

#define ARG_DIVISIONES_NOM 1
#define ARG_APERTURAS_NOM 2

#define ESTIMACION_TAM_DIVISIONES 14000
#define ESTIMACION_TAM_APERTURAS 28000

/* main.c ./archivos/serie_ipc_divisiones.csv ./archivos/serie_ipc_aperturas.csv */

int main(int argc, char* argv[])
{
    if(argc != CANT_ARGS){  /* Si no se ingresa la cantidad correcta de argumentos salimos */
        LOG(ERR_ARGS);
    }

    /*setlocale(LC_ALL, ""); Fijamos el locale del programa al locale argentino */

    Vector_t vecDivisiones, vecAperturas;

    LOG(vectorCrearConCapacidad(&vecDivisiones, sizeof(IPCDivisiones), ESTIMACION_TAM_DIVISIONES)); /* Creamos el vector con la cantidad de elementos estimados */
    LOG(vectorLeerDeTexto(&vecDivisiones, argv[ARG_DIVISIONES_NOM], parsearIPCDivisiones)); /* Cargamos en memoria el archivo y lo parseamos */
    LOG(vectorEliminarPos(&vecDivisiones, 0)); /* Eliminamos el titulo del archivo del vector */
    LOG(corregirCampos(&vecDivisiones, corregirIPCDivisiones)); /* Corregimos los campos del vector, segun lo pedido */
    LOG(herramientaAjustarMontosIPCDivisiones(&vecDivisiones)); /* Herramienta de monto ajustado por IPC, ej. 5 */
    LOG(clasificarBySIPCDivisiones(&vecDivisiones)); /* Clasificamos el vector por bienes, servicios y su promedio nacional, ej. 6 */
    vectorDestruir(&vecDivisiones); /* Liberamos la memoria del vector */

    LOG(vectorCrearConCapacidad(&vecAperturas, sizeof(IPCAperturas), ESTIMACION_TAM_APERTURAS)); /* Creamos el vector con la cantidad de elementos estimados */
    LOG(vectorLeerDeTexto(&vecAperturas, argv[ARG_APERTURAS_NOM], parsearIPCAperturas)); /* Cargamos en memoria el archivo y lo parseamos */
    LOG(vectorEliminarPos(&vecAperturas, 0)); /* Eliminamos el titulo del archivo del vector */
    LOG(corregirCampos(&vecAperturas, corregirIPCAperturas)); /* Corregimos los campos del vector, segun lo pedido */
    LOG(herramientaCalcularAlquilerIPCAperturas(&vecAperturas)); /* Herramienta de calcular alquileres segun IPC, ej. 9 */
    vectorDestruir(&vecAperturas); /* Liberamos la memoria del vector */

    return EXITO; /* Salimos gente. */
}


/** }@ */
