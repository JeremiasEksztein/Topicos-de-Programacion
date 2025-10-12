#include "menuDinamico.h"

int menuDinamicoCrear(MenuDinamico_t* menu, const char* titulo, int tipoDeMenu, OpcionMenu* opciones, size_t cantOpciones)
{
    stringNCopy(menu->titulo, titulo, MENU_DINAMICO_TITULO_LEN);
    menu->tipoDeMenu = tipoDeMenu;

    menu->opciones = opciones;
    menu->cantOpciones = cantOpciones;

    return EXITO;
}

int menuDinamicoDestruir(MenuDinamico_t* menu)
{
    memzero(menu->titulo, MENU_DINAMICO_TITULO_LEN);
    menu->tipoDeMenu = 0;
    menu->opciones = NULL;
    menu->cantOpciones = 0;
    
    return EXITO;
}

int menuDinamicoPreguntar(MenuDinamico_t* menu)
{
    printf("%s\n", menu->titulo);
    printf("---------------------------------\n");

    int i = 0;
    OpcionMenu* opcion;

    for(opcion = menu->opciones; i < menu->cantOpciones, i++, opcion++){
        printf("%d - %s\n", i + 1, opcion->opcion);
    }

    printf("Su respuesta:\t");

    scanf("")

}