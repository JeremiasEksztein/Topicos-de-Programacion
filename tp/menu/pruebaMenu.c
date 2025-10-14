#include "menu.h"
#include "formulario.h"

void añadirUno(void* ans);
void restarUno(void* ans);
void añadirCinco(void* ans);

int leerMenu(Menu_t* menu);

int main()
{
    Menu_t menu;

    int i = 0;

    menuDinamicoInicializar(&menu, "Menu de prueba", leerMenu);

    menuDinamicoAgregarOpcion(&menu, "Añadir 1", añadirUno, &i);
    menuDinamicoAgregarOpcion(&menu, "Restar 1", restarUno, &i);
    menuDinamicoAgregarOpcion(&menu, "Añadir 5", añadirCinco, &i);
    menuDinamicoAgregarOpcion(&menu, "Voy a matarte", añadirUno, &i);
    menuDinamicoEliminarOpcion(&menu, 4);
    menuDinamicoAgregarOpcion(&menu, "Salir", NULL, NULL);

    menuDinamicoPreguntar(&menu);
    printf("%d\n", i);

    return 0;
}

int leerMenu(Menu_t* menu)
{
    
}

void añadirUno(void* ans)
{
    int* i = ans;

    (*i)++;
}


void restarUno(void* ans)
{
    int* i = ans;

    (*i)--;
}


void añadirCinco(void* ans)
{
    int* i = ans;

    (*i) += 5;
}