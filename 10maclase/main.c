#include <stdio.h>
#include <stdlib.h>
#include "vector9.h"
#include "archivosPan.h"

typedef struct{
    char codigo[11];
    char desc[51];
    float precio;
}Producto;

typedef struct{
    char codigo[11];
    unsigned offset;
}IdxProducto;

#define ARG_PORCENTAJE 2
#define ARG_NOM_ARCH 1

#define EXITO 0
#define ERR_ARCH 1

int cambiarReg(void* reg, unsigned n, void* idx);
int cmpProds(void* lhs, void* rhs);
int generarArchivo(const char* nomArchProds);
int actualizarPreciosProductos(const char* nomArchProds, float per);
int mostrarArchProds(const char* nomArchProds);
int mostrarArchIdx(const char* nomArchProds);


// ActualizadorPreciosProductos.exe Productos.dat 10.5

int main(int argc, char** argv)
{
    generarArchivo(argv[ARG_NOM_ARCH]);
    //crearIndice(argv[ARG_NOM_ARCH], sizeof(Producto), sizeof(IdxProducto), cambiarReg, cmpProds);
    float per = atof(argv[ARG_PORCENTAJE]);

    int ret;

    ret = mostrarArchProds(argv[ARG_NOM_ARCH]);
    //mostrarArchIdx("Productos.idx");

    ret = actualizarPreciosProductos(argv[ARG_NOM_ARCH], per);
    ret = actualizarPreciosProductos(argv[ARG_NOM_ARCH], per);

    ret = mostrarArchProds(argv[ARG_NOM_ARCH]);

    return ret;
}

int cambiarReg(void* reg, unsigned n, void* idx)
{
    Producto* p = reg;
    IdxProducto* i = idx;

    strcpy(i->codigo, p->codigo);
    i->offset = n;
    return EXITO;
}

int cmpProds(void* lhs, void* rhs)
{
    IdxProducto* l = lhs;
    IdxProducto* r = rhs;

    return strcmp(l->codigo, r->codigo);
}

int generarArchivo(const char* nomArchProds)
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

    FILE* fp = fopen(nomArchProds, "wb");

    if(!fp){
        return ERR_ARCH;
    }

    fwrite(&prods, sizeof(prods), 1, fp);
    fclose(fp);

    return EXITO;
}

int actualizarPreciosProductos(const char* nomArchProds, float per)
{
    FILE* archProds = fopen(nomArchProds, "rb+");

    if(!archProds){
        return ERR_ARCH;
    }

    float incr = 1.0f + (per / 100.0f);
    Producto prod;

    while(fread(&prod, sizeof(Producto), 1, archProds)){
        prod.precio *= incr;
        fseek(archProds, -(long)sizeof(Producto), SEEK_CUR);
        fwrite(&prod, sizeof(Producto), 1, archProds);
        fflush(archProds);
    }

    fclose(archProds);

    return EXITO;
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
    if(vectorCrearDeArchivo(&vProdIdx, sizeof(ProductoIdx), nomArchProdsIdx))
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


int mostrarArchProds(const char* nomArchProds)
{
    FILE* fp = fopen(nomArchProds, "rb");

    if(!fp){
        return ERR_ARCH;
    }

    Producto prod;

    while(fread(&prod, sizeof(Producto), 1, fp)){
        printf("%s - %s - %0.2f\n", prod.codigo, prod.desc, prod.precio);
    }

    fclose(fp);

    return EXITO;
}

int mostrarArchIdx(const char* nomArchProds)
{
    FILE* fp = fopen(nomArchProds, "rb");

    if(!fp){
        return ERR_ARCH;
    }

    IdxProducto prod;

    while(fread(&prod, sizeof(IdxProducto), 1, fp)){
        printf("%s - %d\n", prod.codigo, prod.offset);
        //printf("%s - %s - %0.2f\n", prod.codigo, prod.desc, prod.precio);
    }

    fclose(fp);

    return EXITO;
}
