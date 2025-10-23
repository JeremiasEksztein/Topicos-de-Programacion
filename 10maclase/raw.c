#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../Archivo/Archivo.h"
#include "../Vector/Vector.h"

#define TODO_OK 0
#define ERR_ARCHIVO 1
#define ERR_SIN_MEM 2
#define ERR_COD_INEX 3


typedef struct
{
    char codigo[11];
    char descripcion[51];
    float precio;
}
Producto;


typedef struct
{
    char codigo[11];
    unsigned nroReg;
}
ProductoIdx;


int generarArchivoProductos(const char* nomArchProds);
int actualizarPreciosProductos(const char* nomArchProds, float porc);
int actualizarPrecio1Producto(const char* nomArchProds, const char* codProd, float porc);
int mostrarArchProductos(const char* nomArchProds);
void crearProductoIdx(const void* reg, unsigned nroReg, void* regIdx);
int cmpProductoIdx(const void* e1, const void* e2);


// ActualizadorPreciosProductos.exe Productos.dat PERA 10.5 MANZ 20 NARAN 15

int main(int argc, char* argv[])
{
    int ret;

    ret = generarArchivoProductos(argv[1]);

    if(ret != TODO_OK)
    {
        return ret;
    }

    ret = crearIndice(argv[1], sizeof(Producto), sizeof(ProductoIdx), crearProductoIdx, cmpProductoIdx);

    if(ret != TODO_OK)
    {
        return ret;
    }

    float porc = atof(argv[3]);

//    ret = actualizarPreciosProductos(argv[1], porc);
    ret = actualizarPrecio1Producto(argv[1], argv[2], porc);

    if(ret != TODO_OK)
    {
        return ret;
    }

    ret = mostrarArchProductos(argv[1]);

    return ret;
}


int generarArchivoProductos(const char* nomArchProds)
{
    Producto prods[] =
    {
        {"PERA", "PERA WILLIAMS", 120.50},
        {"MANZANA", "MANZANA ROJA", 100.75},
        {"NARANJA", "NARANJA VALENCIA", 80.20},
        {"BANANA", "BANANA CAVENDISH", 90.00},
        {"KIWI", "KIWI VERDE", 150.30},
        {"FRUTILLA", "FRUTILLA FRESCA", 200.10},
        {"UVA", "UVA RED GLOBE", 110.40},
        {"MANDARINA", "MANDARINA TANGERINA", 70.60},
        {"CEREZA", "CEREZA BING", 250.00},
        {"MANGO", "MANGO ATAULFO", 180.80}
    };

    FILE* archProds = fopen(nomArchProds, "wb");

    if(!archProds)
    {
        return ERR_ARCHIVO;
    }

    fwrite(prods, sizeof(prods), 1, archProds);

    fclose(archProds);

    return TODO_OK;
}


int actualizarPreciosProductos(const char* nomArchProds, float porc)
{
    FILE* archProds = fopen(nomArchProds, "r+b");

    if(!archProds)
    {
        return ERR_ARCHIVO;
    }

    float factorIncr = 1 + porc / 100;

    Producto prod;

    while(fread(&prod, sizeof(Producto), 1, archProds))
    {
        prod.precio *= factorIncr;
        fseek(archProds, -(long)sizeof(Producto), SEEK_CUR);
        fwrite(&prod, sizeof(Producto), 1, archProds);
        fflush(archProds); // fseek(archProds, 0L, SEEK_CUR);
    }

    fclose(archProds);

    return TODO_OK;
}


int actualizarPrecio1Producto(const char* nomArchProds, const char* codProd, float porc)
{
    FILE* archProds = fopen(nomArchProds, "r+b");

    if(!archProds)
    {
        return ERR_ARCHIVO;
    }

    char nomArchProdsIdx[201];
    cambiarExtension(nomArchProds, "idx", nomArchProdsIdx);

    Vector vProdIdx;
    if(!vectorCrearDeArchivo(&vProdIdx, sizeof(ProductoIdx), nomArchProdsIdx))
    {
        fclose(archProds);
        return ERR_SIN_MEM;
    }

    ProductoIdx prodIdx;
    strcpy(prodIdx.codigo, codProd);

    if(vectorOrdBuscar(&vProdIdx, &prodIdx, cmpProductoIdx) == -1)
    {
        fclose(archProds);
        vectorDestruir(&vProdIdx);
        return ERR_COD_INEX;
    }

    float factorIncr = 1 + porc / 100;

    Producto prod;
    fseek(archProds, prodIdx.nroReg * sizeof(Producto), SEEK_SET);
    fread(&prod, sizeof(Producto), 1, archProds);
    prod.precio *= factorIncr;
    fseek(archProds, prodIdx.nroReg * sizeof(Producto), SEEK_SET);
    fwrite(&prod, sizeof(Producto), 1, archProds);

    fclose(archProds);
    vectorDestruir(&vProdIdx);

    return TODO_OK;
}


int mostrarArchProductos(const char* nomArchProds)
{
    FILE* archProds = fopen(nomArchProds, "rb");

    if(!archProds)
    {
        return ERR_ARCHIVO;
    }

    Producto prod;

    while(fread(&prod, sizeof(Producto), 1, archProds))
    {
        printf("%-10s\t%-25s\t%06.2f\n", prod.codigo, prod.descripcion, prod.precio);
    }

    fclose(archProds);

    return TODO_OK;
}


void crearProductoIdx(const void* reg, unsigned nroReg, void* regIdx)
{
    const Producto* prod = reg;
    ProductoIdx* prodIdx = regIdx;
    strcpy(prodIdx->codigo, prod->codigo);
    prodIdx->nroReg = nroReg;
}


int cmpProductoIdx(const void* e1, const void* e2)
{
    const ProductoIdx* prodIdx1 = e1;
    const ProductoIdx* prodIdx2 = e2;
    return strcmp(prodIdx1->codigo, prodIdx2->codigo);
}


#ifndef ARCHIVO_H_INCLUDED
#define ARCHIVO_H_INCLUDED

#include <stdio.h>
#include "../Vector/Vector.h"

#define TODO_OK 0
#define ERR_AP_ARCHIVO 1
#define ERR_SIN_MEM 2


typedef void (*BinATxt)(const void* reg, FILE* archTxt);
typedef int (*TxtABin)(char* linea, void* reg);
typedef void (*CrearRegIdx)(const void* reg, unsigned nroReg, void* regIdx);


int conversorBinATxt(const char* nomArchBin, const char* nomArchTxt, size_t tamReg, BinATxt binATxt);
int conversorTxtABin(const char* nomArchTxt, const char* nomArchBin, size_t tamReg, TxtABin txtABin);
int crearIndice(const char* nomArch, size_t tamReg, size_t tamRegIdx, CrearRegIdx crearRegIdx, Cmp cmpIdx);
void cambiarExtension(const char* nomArch, const char* ext, char* nomArchNuevo);


#endif // ARCHIVO_H_INCLUDED

#include <stdlib.h>
#include <string.h>
#include "../Vector/Vector.h"
#include "Archivo.h"

#define TAM_LINEA 501


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


int crearIndice(const char* nomArch, size_t tamReg, size_t tamRegIdx, CrearRegIdx crearRegIdx, Cmp cmpIdx)
{
    void* reg = malloc(tamReg);

    if(!reg)
    {
        return ERR_SIN_MEM;
    }

    void* regIdx = malloc(tamRegIdx);

    if(!regIdx)
    {
        free(reg);
        return ERR_SIN_MEM;
    }

    FILE* arch = fopen(nomArch, "rb");

    if(!arch)
    {
        free(reg);
        free(regIdx);
        return ERR_AP_ARCHIVO;
    }

    Vector vIdx;
    if(!vectorCrear(&vIdx, tamRegIdx))
    {
        free(reg);
        free(regIdx);
        fclose(arch);
        return ERR_SIN_MEM;
    }

    unsigned nroRegAct = 0;

    while(fread(reg, tamReg, 1, arch))
    {
        crearRegIdx(reg, nroRegAct, regIdx);
        vectorOrdInsertar(&vIdx, regIdx, cmpIdx, NULL);
        nroRegAct++;
    }

    fclose(arch);
    free(reg);
    free(regIdx);

    char nomArchIdx[201];
    cambiarExtension(nomArch, "idx", nomArchIdx);

    if(!vectorGrabar(&vIdx, nomArchIdx))
    {
        return ERR_AP_ARCHIVO;
    }

    vectorDestruir(&vIdx);

    return TODO_OK;
}


void cambiarExtension(const char* nomArch, const char* ext, char* nomArchNuevo)
{
    strcpy(nomArchNuevo, nomArch);
    char* punto = strrchr(nomArchNuevo, '.');
    strcpy(punto + 1, ext);
}
