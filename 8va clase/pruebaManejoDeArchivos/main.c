#include <stdio.h>
#include <stdlib.h>
#include "../manejoDeArchivos/manejoDeArchivos.h"

#define TAM_APYN 50
#define TAM_LEGAJO 8
#define TAM_SUELDO 11

int empleadoBinATxtV(const void* reg, FILE* archTxt);
int empleadoBinATxtF(const void* reg, FILE* archTxt);
int crearArchivoEmpleadosBin(const char* nomArch);

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

// ConversorEmpleadosBinATxt.exe Empleados.dat Empleados.txt V

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
        res = conversorBinATxt(src, dest, sizeof(Empleado), empleadoBinATxtV);
    }else if(tipoT == 'F'){
        res = conversorBinATxt(src, dest, sizeof(Empleado), empleadoBinATxtF);
    }else{
        return -1;
    }

    return res;
}

int empleadoBinATxtV(const void* reg, FILE* archTxt)
{
    Empleado* tmp = (Empleado*) reg;

    fprintf(archTxt, "%d|%s|%c|%d/%d/%d|$ %.2f\n", tmp->legajo, tmp->apyn, tmp->genero, tmp->fechaIngr.dia,
                                                   tmp->fechaIngr.mes, tmp->fechaIngr.anio, tmp->sueldo);

    return 0;
}

int empleadoBinATxtF(const void* reg, FILE* archTxt)
{
    Empleado* tmp = (Empleado*) reg;

    fprintf(archTxt, "%0*d%-*s|%c|%02d/%02d/%04d|$ %0*.2f\n", TAM_LEGAJO, tmp->legajo, TAM_APYN, tmp->apyn, tmp->genero, tmp->fechaIngr.dia,
                                                             tmp->fechaIngr.mes, tmp->fechaIngr.anio, TAM_SUELDO, tmp->sueldo);

    return 0;
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
