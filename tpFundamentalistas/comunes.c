/** @ingroup ModuloComunes
 * @{ */

/** @file comunes.c
 * @brief Implementacion de comunes.h */

#include "comunes.h"

int validarFechaForm(char* ans)
{
    int tmp;

    tmp = ans[5] * 10 + ans[6] - 11 * '0';

    if(tmp < 0 || tmp > 12){
        printf("Error: mes incorrecto, vuelva a intentar\n");
        return 0;
    }

    tmp += ans[0] * 100000 + ans[1] * 10000 + ans[2] * 1000 + ans[3] * 100 - 111100 * '0';

    if(tmp < 201612 || tmp > 202507){
        printf("Error: fecha fuera de rango [2016-12 ; 2025-07], vuelva a intentar\n");
        return 0;
    }

    return 1;
}

void imprimirHeaderTabla(char* titulo, char** campos, int* paddings, int cc)
{
    int i, sum = paddings[0];
    printf(COLOR_BOLD COLOR_GREEN "%s\n", titulo);
    printf(COLOR_GRAY "%-*s\t | ", paddings[0], campos[0]);


    for(i = 1; i < cc; i++){
        printf("%-*s\t |", paddings[i], campos[i]);
        sum += paddings[i];
    }

    puts("");
    sum += 4 * cc;
    for(; sum > 0; sum--){
        printf("-");
    }

    puts(""COLOR_RESET);
}

int parsearEscrDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    return EXITO;
}

int parsearEscrPromedio(FILE* arch, void* reg)
{
    IPCPromedio* i = reg;

    fprintf(arch, "%s | %s | %s | %s\n", i->fecha, i->region, i->indiceBienes, i->indiceServicios);

    return EXITO;
}

int parsearEscrAperturas(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->periodo, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region);
    return EXITO;
}

int parsearEscrAlquileres(FILE* arch, void* reg)
{
    IPCAlquileres* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s\n", tmp->periodo, tmp->indiceIPC, tmp->acumuladoIPC, tmp->montoAjustado);

    return 0;
}

/** }@ */
