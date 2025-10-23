#include <stdlib.h>
#include <string.h>
#include "archivosPan.h"
#include "vector9.h"

#define TAM_LINEA 501


char* cambiarSufijo(char* nomArch, char* old, char* new)
{
    char* i = nomArch;

    if(!(i = strrchr(nomArch, '.'))){
        return NULL;
    }

    strcpy(i, new);

    return nomArch;
}

int conversorBinATxt(const char* nomArchBin, const char* nomArchTxt, size_t tamReg, BinATxt binATxt)
{
    FILE* archBin = fopen(nomArchBin, "rb");

    if(!archBin)
    {
        return ERR_AP_ARCHIVO;
    }

    FILE* archTxt = fopen(nomArchTxt, "wt");

    if(!archTxt)
    {
        fclose(archBin);
        return ERR_AP_ARCHIVO;
    }

    void* reg = malloc(tamReg);

    if(!reg)
    {
        fclose(archBin);
        fclose(archTxt);
        return ERR_SIN_MEM;
    }

    fread(reg, tamReg, 1, archBin);
    while(!feof(archBin))
    {
        binATxt(reg, archTxt);
        fread(reg, tamReg, 1, archBin);
    }

    fclose(archBin);
    fclose(archTxt);
    free(reg);

    return TODO_OK;
}


int conversorTxtABin(const char* nomArchTxt, const char* nomArchBin, size_t tamReg, TxtABin txtABin)
{
    FILE* archTxt = fopen(nomArchTxt, "rt");

    if(!archTxt)
    {
        return ERR_AP_ARCHIVO;
    }

    FILE* archBin = fopen(nomArchBin, "wb");

    if(!archBin)
    {
        fclose(archTxt);
        return ERR_AP_ARCHIVO;
    }

    void* reg = malloc(tamReg);

    if(!reg)
    {
        fclose(archBin);
        fclose(archTxt);
        return ERR_SIN_MEM;
    }

    char linea[TAM_LINEA];
    int ret;

    while(fgets(linea, TAM_LINEA, archTxt))
    {
        ret = txtABin(linea, reg);

        if(ret == TODO_OK)
        {
            fwrite(reg, tamReg, 1, archBin);
        }
    }

    fclose(archBin);
    fclose(archTxt);
    free(reg);

    return TODO_OK;
}

int crearIndice(const char* nomArch, size_t tamReg, size_t tamIdx, int crearRegIdx(void* reg, unsigned n, void* idx),int (*Cmp)(void*, void*))
{
    void* reg = malloc(tamReg);

    if(!reg)
    {
        return ERR_SIN_MEM;
    }

    void* regIdx = malloc(tamIdx);

    if(!regIdx){
        free(reg);
        return ERR_SIN_MEM;
    }

    FILE* arch = fopen(nomArch, "rb");

    if(!arch)
    {
        free(reg);
        return ERR_AP_ARCHIVO;
    }

    Vector_t vIdx;
    if(vectorCrear(&vIdx, tamIdx))
    {
        free(reg);
        fclose(arch);
        return ERR_SIN_MEM;
    }

    unsigned nroRegAct = 0;

    while(fread(reg, tamReg, 1, arch))
    {
        crearRegIdx(reg, nroRegAct, regIdx);
        vectorInsertarOrd(&vIdx, regIdx, Cmp);
        nroRegAct++;
    }

    return vectorEscribirABinario(&vIdx, cambiarSufijo((char*)nomArch, NULL, ".idx"));
    vectorDestruir(&vIdx);
    free(regIdx);
    free(reg);
    fclose(arch);

    return EXITO;
}
