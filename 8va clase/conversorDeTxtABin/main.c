#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../manejoDeArchivos/manejoDeArchivos.h"

#define TAM_APYN 50
#define TAM_LEGAJO 8
#define TAM_SUELDO 11

int empleadoTxtVABin(char* linea, void* reg);
int empleadoTxtFABin(char* linea, void* reg);
int crearArchivoEmpleados(const char* nomArch);

typedef struct{
    int dia, mes, anio;
}Fecha;

typedef struct{
    int legajo;
    char apyn[TAM_APYN + 1];
    char genero;
    Fecha fechaIngr;
    double sueldo;
}Empleado;



#define ARGC 4

#define SRC_ARG 1
#define DEST_ARG 2
#define ANCHO_ARG 3

// ConversorDeTxtABin.exe Empleados.txt Empleados.dat V

int main(int argc, char* argv[])
{
    if(argc != ARGC){
        return -1;
    }

    crearArchivoEmpleadosBin(argv[SRC_ARG]);

    int res;
    char tipoT = argv[ANCHO_ARG][0];
    char* src = argv[SRC_ARG];
    char* dest = argv[DEST_ARG];

    if(tipoT == 'V'){
        res = conversorTxtVABin(src, dest, sizeof(Empleado), empleadoTxtVABin);
    }else if(tipoT == 'F'){
        res = conversorTxtFABin(src, dest, sizeof(Empleado), empleadoTxtFABin);
    }else{
        return -1;
    }

    return res;
}

int empleadoTxtVABin(char* linea, void* reg)
{
    Empleado* tmp = reg;
    char* i = strchr(linea, '\n');

    if(!i){
        return -1;
    }

    *i = '\0'
    i = strrchr(linea, '|'):
    sscanf(i + 1, "%f", tmp->sueldo);

    *i = '\0'
    i = strrchr(linea, '|'):
    sscanf(i + 1, "%d/%d/%d", tmp->fechaIngr.dia, tmp->fechaIngr.mes, tmp->fechaIngr.anio);

    *i = '\0'
    i = strrchr(linea, '|'):
    sscanf(i + 1, "%c", tmp->genero);

    *i = '\0'
    i = strrchr(linea, '|'):
    strncpy(tmp->apyn, i + 1, TAM_APYN);


}

int crearArchivoEmpleadosBin(const char* path)
{
    FILE* arch = fopen(path, "wb");
    if(!arch) {
        perror("Error al crear el archivo");
        return 0;
    }

    Empleado empleados[] = {
        {1001, "Gomez Ana",       'F', {12, 3, 2018}, 85000.50},
        {1002, "Perez Luis",      'M', {25, 7, 2019}, 91000.00},
        {1003, "Fernandez Lucia", 'F', {10, 1, 2017}, 97500.75},
        {1004, "Diaz Marcos",     'M', {8, 11, 2020}, 68000.20},
        {1005, "Lopez Camila",    'F', {15, 6, 2016}, 103000.00},
        {1006, "Martinez Jorge",  'M', {3, 9, 2018}, 83000.10}
    };

    size_t cant = sizeof(empleados) / sizeof(Empleado);

    if(fwrite(empleados, sizeof(Empleado), cant, arch) != cant) {
        perror("Error al escribir en el archivo");
        fclose(arch);
        return 0;
    }

    fclose(arch);
    return 1;
}
