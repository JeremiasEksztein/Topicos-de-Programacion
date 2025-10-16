#include <stdio.h>
#include <assert.h>

#define DESC_LEN 64

#define OPEN_FILE(fp, filename, mode) do{ \
        if(!((fp) == fopen((filename), (mode)))){ \
            return 1;    \
        } \
    }while(0)

typedef struct{
    int cod;
    char desc[DESC_LEN];
    int stock;
}Producto;

typedef struct{
    int cod;
    int cant;
}Movimientos;

int generarProductos(char* filename);
int generarMovimientos(char* filename);
int merge(char* fileProductos, char* fileMovimientos);

//9naclase Productos.dat Movimientos.dat

int main(int argc, char** argv)
{
    generarProductos("Productos.dat");
    generarMovimientos("Movimientos.dat");

    assert(merge(argv[1], argv[2]));

    return 0;
}

int generarProductos(char* filename)
{
    FILE* f = fopen(filename, "wb");

    assert(f);

    Producto prods[5] = {{.cod = 0, .desc = "Higo", .stock = 100},
                         {.cod = 4, .desc = "Banana", .stock = 100},
                         {.cod = 7, .desc = "Pera", .stock = 50},
                         {.cod = 9, .desc = "Manzana", .stock = 70},
                         {.cod = 14, .desc = "Durazno", .stock = 90}};

    fwrite(prods, sizeof(Producto) * 5, 1, f);

    fclose(f);

    return 0;
}

int generarMovimientos(char* filename)
{
    FILE* f = fopen(filename, "wb");

    assert(f);

    Movimientos movs[9] = {{.cod = 1, .cant = 20},
                           {.cod = 4, .cant = 5},
                           {.cod = 7, .cant = 20},
                           {.cod = 7, .cant = -10},
                           {.cod = 8, .cant = 40},
                           {.cod = 12, .cant = 60},
                           {.cod = 12, .cant = -10},
                           {.cod = 15, .cant = 80},
                           {.cod = 15, .cant = 40}};

    fwrite(movs, sizeof(Movimientos) * 9, 1, f);

    fclose(f);

    return 0;
}

int merge(char* fileProductos, char* fileMovimientos)
{
    FILE* prod = fopen(fileProductos, "rb");
    
    if(!prod){
        return 1;
    }

    FILE* movs = fopen(fileMovimientos, "rb");

    if(!movs){
        fclose(prod);
        return 1;
    }

    FILE* tmp = fopen("tmp.dat", "wb");

    if(!tmp){
        fclose(prod);
        fclose(movs);
        return 1;
    }

    Producto prodTmp;
    Movimientos movsTmp;

    fread(&prodTmp, sizeof(Producto), 1, prod);
    fread(&movsTmp, sizeof(Movimientos), 1, movs);

    int cmp = prodTmp.cod - movsTmp.cod;
    int cantDelta = 0;

    while(!feof(prod) && !feof(movs)){
        if(!cmp){
            cantDelta += movsTmp.cant;
            fread(&prodTmp, sizeof(Producto), 1, prod);
            fread(&movsTmp, sizeof(Movimientos), 1, movs);
        }else if(cmp > 0){
            fread(&movsTmp, sizeof(Movimientos), 1, movs);
        }else if(cmp < 0){
            
        }

        cmp = prodTmp.cod - movsTmp.cod;
        //fwrite(&prodTmp, sizeof(prodTmp), 1, tmp);
    }

    while(!feof(prod)){

    }

    while(!feof(movs)){

    }


    fclose(tmp);
    fclose(prod);
    fclose(movs);

    rename("tmp.dat", fileProductos);
    remove(tmp);

    return 0;
}