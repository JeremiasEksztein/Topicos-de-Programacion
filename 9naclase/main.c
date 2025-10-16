#include <stdio.h>
#include <assert.h>
#include <string.h>

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
int leerProductos(char* filename);
int generarMovimientos(char* filename);
char* cambiarSufijo(char* filename,char*, char* sufijo);
int merge(char* fileProductos, char* fileMovimientos);

//9naclase Productos.dat Movimientos.dat

char* cambiarSufijo(char* filename, char* name, char* suffix)
{
    strcpy(filename, name);
    char* i = &filename[strlen(name)];
    *i = '.';
    strcpy(i + 1, suffix);
    return filename;
}
/*
char* cambiarSufijo(char* filechar* filename, char* sufijo)
{

    strcpy(&(filename[strcspn(filename, ".") + 1]), sufijo);
    return filename;
}
*/
int main(int argc, char** argv)
{
    generarProductos("Productos.dat");
    generarMovimientos("Movimientos.dat");

    int err = merge(argv[1], argv[2]);

    //leerProductos("Productos.dat");

    return err;
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

int leerProductos(char* filename)
{
    FILE* fp = fopen(filename, "rb");

    if(!fp) return 1;

    Producto prod;

    while(fread(&prod, sizeof(Producto), 1, fp)){
        printf("%d - %s - %d\n", prod.cod, prod.desc, prod.stock);
    }

    fclose(fp);

    return 0;
}

int generarMovimientos(char* filename)
{
    FILE* f = fopen(filename, "wb");

    assert(f);

    Movimientos movs[] = {{.cod = 1, .cant = 20},
                           {.cod = 4, .cant = 5},
                           {.cod = 7, .cant = 20},
                           {.cod = 7, .cant = -10},
                           {.cod = 8, .cant = 40},
                           {.cod = 12, .cant = 60},
                           {.cod = 12, .cant = -10},
                           {.cod = 14, .cant = -90},
                           {.cod = 15, .cant = 80},
                           {.cod = 15, .cant = 40}};

    fwrite(movs, sizeof(movs), 1, f);

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

    char nom[201];

    cambiarSufijo(nom, "Productos", "tmp");
    //strcpy(nom, cambiarSufijo(fileProductos, "tmp")); //Cambiar sufijo cambia la cadena, lpm

    FILE* tmp = fopen(nom, "wb");

    if(!tmp){
        fclose(prod);
        fclose(movs);
        return 1;
    }

    Producto prodTmp, prodNuevo;
    Movimientos movsTmp;

    fread(&prodTmp, sizeof(Producto), 1, prod);
    fread(&movsTmp, sizeof(Movimientos), 1, movs);

    while(!feof(prod) && !feof(movs)){
        int cmp = prodTmp.cod - movsTmp.cod;

        if(!cmp){ // Producto con movimientos
            prodTmp.stock += movsTmp.cant;
            fread(&movsTmp, sizeof(Movimientos), 1, movs);
        }else if(cmp > 0){ // Movimientos sin producto - Productos nuevos
            prodNuevo.cod = movsTmp.cod;
            prodNuevo.stock = movsTmp.cant;
            (prodNuevo.desc)[0] = '\0';
            fread(&movsTmp, sizeof(Movimientos), 1, movs);
            while(prodNuevo.cod == movsTmp.cod && !feof(movs)){
                prodNuevo.stock += movsTmp.cant;
                fread(&movsTmp, sizeof(Movimientos), 1, movs);
            }
            fwrite(&prodNuevo, sizeof(Producto), 1, tmp);
        }else if(cmp < 0){ // Producto sin movimientos
            fwrite(&prodTmp, sizeof(Producto), 1, tmp);
            fread(&prodTmp, sizeof(Producto), 1, prod);
        }
    }

    while(!feof(prod)){
        fread(&prodTmp, sizeof(Producto), 1, prod);
        fwrite(&prodTmp, sizeof(Producto), 1, tmp);
    }

    while(!feof(movs)){
        prodNuevo.cod = movsTmp.cod;
        prodNuevo.stock = movsTmp.cant;
        (prodNuevo.desc)[0] = '\0';
        fread(&movsTmp, sizeof(Movimientos), 1, movs);
        while(prodNuevo.cod == movsTmp.cod && !feof(movs)){
            prodNuevo.stock += movsTmp.cant;
            fread(&movsTmp, sizeof(Movimientos), 1, movs);
        }
        fwrite(&prodNuevo, sizeof(Producto), 1, tmp);
    }

    fclose(tmp);
    fclose(prod);
    fclose(movs);

    leerProductos(nom);

    remove(fileProductos);
    rename(nom, fileProductos);

    return 0;
}