#include "manejoDeArchivos.h"

#define TAM_LINEA 501



int conversorBinATxt(const char* nomArchBin, const char* nomArchTxt, size_t tamReg, BinATxt binATxt)
{
    FILE* archBin = fopen(nomArchBin, "rb");

    if(!archBin){
        return ERR_ARCH;
    }

    FILE* archTxt = fopen(nomArchTxt, "wt");

    if(!archTxt){
        fclose(archBin);
        return ERR_ARCH;
    }

    void* reg = malloc(tamReg);

    if(!reg){
        fclose(archBin);
        fclose(archTxt);
        return ERR_MEM;
    }

    fread(reg, tamReg, 1, archBin);

    while(!feof(archBin)){
        binATxt(reg, archTxt);
        fread(reg, tamReg, 1, archBin);
    }

/*
    while(fread(reg, tamReg, 1, archBin)){

    }

    if(ferror(archBin)){
        fclose(archBin);
        fclose(archTxt);
        free(reg);
        return ERR_READ;
    }
*/

    fclose(archBin);
    fclose(archTxt);
    free(reg);

    return EXITO;
}

int conversorTxtABin(const char* nomArchTxt, const char* nomArchBin, size_t tamReg, TxtABin txtABin)
{
    FILE* archTxt = fopen(nomArchTxt, "rt");

    if(!archTxt){
        return ERR_ARCH;
    }

    FILE* archBin = fopen(nomArchBin, "wb");

    if(!archBin){
        fclose(archTxt);
        return ERR_ARCH;
    }

    void* reg = malloc(tamReg);

    if(!reg){
        fclose(archBin);
        fclose(archTxt);
        return ERR_MEM;
    }

    char buffer[TAM_LINEA];

    while(fgets(buffer, TAM_LINEA, archTxt)){
        txtABin(linea, reg);
        fwrite(reg, tamReg, 1, archBin);
    }

    fclose(archBin);
    fclose(archTxt);
    free(reg);

    return EXITO;
}



