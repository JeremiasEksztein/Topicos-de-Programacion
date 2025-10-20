#ifndef MENU_H
#define MENU_H

#include <string.h>
#include <stdio.h>

#define MENU_TITULO_LEN 256
#define MENU_ETIQUETA_LEN 256
#define MENU_CANT_OPCIONES 256

typedef struct{
    char etiqueta[MENU_ETIQUETA_LEN];
    void (*OpcionAct)(void* destino);
    void* destino;
}Opcion;

typedef struct Menu_t{
    char titulo[MENU_TITULO_LEN];
    Opcion opciones[MENU_CANT_OPCIONES];
    int (*Leer)(struct Menu_t* menu);
    int cantOpciones;
}Menu_t;

Menu_t* menuInicializar(Menu_t* menu, char* titulo, int (*Leer)(struct Menu_t* menu));

int menuAgregarOpcion(Menu_t* menu, char* etiqueta, void (*OpcionAct)(void* ans), void* destino);
int menuEliminarOpcion(Menu_t* menu, int pos);

int menuPreguntar(Menu_t* menu);

char* menuObtenerTitulo(Menu_t* menu);
int menuObtenerCantOpciones(Menu_t* menu);

int menuRefrescarPantalla(void);

#endif