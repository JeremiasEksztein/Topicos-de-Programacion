#include "formulario.h"
#include <stdio.h>

#define COLOR_RESET   "\033[0m"
#define COLOR_BOLD    "\033[1m"
#define COLOR_DIM     "\033[2m"
#define COLOR_RED     "\033[1;31m"
#define COLOR_YELLOW  "\033[1;33m"
#define COLOR_CYAN    "\033[1;36m"
#define COLOR_GRAY    "\033[0;37m"

#define CLEAR_SCREEN printf("\033[H\033[J")

#define PRINT_BIG_PRETTY(txt) do{\
        printf("+%.*s+\n", FORMULARIO_TITULO_LEN + 2, "--------------------------------");\
        printf("| %s |\n", (txt));\
        printf("+%.*s+\n", FORMULARIO_TITULO_LEN + 2, "--------------------------------");\
        printf("\n");\
    }while(0)

#define PRINT_SMALL_PRETTY(txt) \
    do{ \
        printf("+%.*s+\n", strlen(txt) + 2, "--------------------------------");\
        printf("| %s |\n", (txt));\
        printf("+%.*s+\n", strlen(txt) + 2, "--------------------------------");\
        printf("\n");\
    }while(0)

#define PRINT_HINT_PRETTY(txt) \
    do{ \
        printf(COLOR_DIM "Hint: %s" COLOR_RESET "\n", (txt));\
    }while(0)

#define PRINT_LIST_ITEM_PRETTY(i, txt) \
    do{ \
        printf("| %d. %s |\n", (i), (txt));\
    }while(0)


Formulario_t* formularioCrear(Formulario_t* forma, const char* titulo)
{
    stringNCopy(forma->titulo, titulo, FORMULARIO_TITULO_LEN);
    forma->camposCant = 0;
    memset(forma->campos, '\0', sizeof(Campo_t*) * FORMULARIO_CAMPOS_NUM);

    return 0;
}

int formularioAgregarCampos(Formulario_t* forma, Campo_t* campos, int cantCampos)
{
    int ce = cantCampos;
    int i = 0;

    for(; i < ce; i++){
        (forma->campos)[i] = (campos)++;
    }

    return 0;
}


int formularioPublicar(Formulario_t* forma)
{
    Campo_t* campos = forma->campos;
    
    for(int i = 0; i < forma->camposCant; i++){
        CLEAR_SCREEN;
        PRINT_BIG_PRETTY(forma->titulo);
        PRINT_SMALL_PRETTY(campos[i].etiqueta);
        PRINT_HINT_PRETTY(campoGetHint(&(campos[i])));
        questionField(&(campos[i]));
    }

    return 0;
}

int formularioDestruir(Formulario_t* forma);


Campo_t* campoCrear(Campo_t* campo, const char* etiqueta);

int campoFijarEntero(Campo_t* campo, char* hint, int max, int min);
int campoFijarNumerico(Campo_t* campo, char* hint, double max, double min);
int campoFijarTexto(Campo_t* campo, char* hint, int tamanio);
int campoFijarRadio(Campo_t* campo, char* hint, char** elems, int cantElem);
int campoFijarChecklist(Campo_t* campo, char* hint, char** elems, int cantElem);
int campoFijarFecha(Campo_t* campo, char* hint, char* max, char* min);

char* campoBuffer(Campo_t* campo);

int campoDestruir(Campo_t* campo);