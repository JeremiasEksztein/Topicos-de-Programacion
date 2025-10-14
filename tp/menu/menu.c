#include "menu.h"

Menu_t* menuInicializar(Menu_t* menu, char* titulo)
{
    strncpy(menu->titulo, titulo, MENU_TITULO_LEN);
    menu->cantOpciones = 0;

    return menu;
}

int menuAgregarOpcion(Menu_t* menu, char* etiqueta, void (*OpcionAct)(void* ans), void* destino)
{
    Opcion opcion;

    strncpy(opcion.etiqueta, etiqueta, MENU_ETIQUETA_LEN);
    opcion.OpcionAct = OpcionAct;
    opcion.destino = destino;

    (menu->opciones)[menu->cantOpciones] = opcion;

    puts((menu->opciones)[menu->cantOpciones].etiqueta);

    menu->cantOpciones++;

    return 0;
}

int menUEliminarOpcion(Menu_t* menu, int pos)
{
    Opcion opcion = {.etiqueta = "", .OpcionAct = NULL, .destino = NULL};

    memmove(menu->opciones + pos, menu->opciones + pos + 1, menu->cantOpciones - pos);

    menu->cantOpciones--;

    return 0;
}

int menuPreguntar(Menu_t* menu)
{
    menuRefrescarPantalla();

    printf("════════%s════════\n", menu->titulo);

    Opcion* opciones = menu->opciones;
    Opcion opcion;
    int i = 0;

    for(; i < menu->cantOpciones; i++){
        opcion = opciones[i];
        printf("%d - %s\n", i + 1, opcion.etiqueta);
    }

    i = menu->Leer(menu);

    if(i < 0){
        return -1;
    }

    if(!opciones[i - 1].OpcionAct){
        return 0;
    }

    opciones[i - 1].OpcionAct(opciones[i - 1].destino);

    return 0;
}

int menuRefrescarPantalla(void)
{
    printf("\033[H\033[J");
    return 0;
}