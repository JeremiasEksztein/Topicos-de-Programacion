#ifndef MENU_DINAMICO_H
#define MENU_DINAMICO_H

#include <stddef.h>

typedef struct{
    const char opcion[200]; //Texto a mostrar como opcion
    void (*AccionMenu)(void*); //Accion que se efectuara sobre la respuesta
    void* respuesta;
}OpcionMenu;

typedef struct{
    const char titulo[200];
    int tipoDeMenu;
    OpcionMenu* opciones;
    size_t cantOpciones;
    size_t cap; //No deberia poder cambiarse el tamaño del menu dinamicamente
}MenuDinamico_t;

/*
    MenuDinamico_t -> OpcionMenu[];
                            OpcionMenu -> - 1 AnsA
                                          - 2 AnsB
                                          - 3 AnsC
                                          - 4 Salir
*/

int menuDinamicoCrear(MenuDinamico_t* menu, const char* titulo, int tipoDeMenu, OpcionMenu* opciones, size_t cantOpciones);
int menuDinamicoDestruir(MenuDinamico_t* menu);

int menuDinamicoPreguntar(MenuDinamico_t* menu);
void* menuDinamicoObtenerRespuesta(MenuDinamico_t* menu);

#endif