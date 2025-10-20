#ifndef FORMULARIO_H_INCLUDED
#define FORMULARIO_H_INCLUDED

#include "../comunes/comunes.h"

#define ENTRADA_ETIQUETA_LEN 32
#define ENTRADA_HINT_LEN 32
#define ENTRADA_BUFFER_LEN 128
#define ENTRADA_OPCIONES_LEN 32

#define FORMULARIO_TITULO_LEN 64
#define FORMULARIO_ENTRADA_CANT 32

#define ENTRADA_TIPO_NUMERICO 0
#define ENTRADA_TIPO_TEXTO 1
#define ENTRADA_TIPO_RADIO 2
#define ENTRADA_TIPO_CHECKLIST 3 

typedef struct EntradaNumerico{
    double min;
    double max;
}EntradaNumerico;

typedef struct EntradaTexto{
    int len;
}EntradaTexto;

typedef struct EntradaRadio{
    char* opciones[ENTRADA_OPCIONES_LEN];
    int cantOpciones;
}EntradaRadio;

typedef struct EntradaChecklist{
    char* opciones[ENTRADA_OPCIONES_LEN];
    int cantOpciones;
    int cantSelecciones;
}EntradaChecklist;

typedef struct Entrada_t{
    const char etiqueta[ENTRADA_ETIQUETA_LEN];
    const char hint[ENTRADA_HINT_LEN];
    char* buffer;
    int tipo;
    void* info;
}Entrada_t;

typedef struct Formulario_t{
    const char titulo[FORMULARIO_TITULO_LEN];
    Entrada_t entradas[FORMULARIO_ENTRADA_CANT];
    int cantEntradas;
}Formulario_t;

int formularioCrear(Formulario_t* forma, const char* titulo);

char* formualarioSetGetTitulo(Formulario_t* forma, const char* titulo);
Entrada_t* formularioSetGetEntradas(Formulario_t* forma, Entrada_t* entradas, int n);
int formularioCantEntradas(Formulario_t* forma);

int formularioPublicar(Formulario_t* forma);

int formularioDestruir(Formulario_t* forma);

int entradaCrear(Entrada_t* entrada, const char* etiqueta, const char* hint);

int entradaSetGetTipo(Entrada_t* entrada, int tipo, void* info);
char* entradaSetGetEtiqueta(Entrada_t* entrada, const char* etiqueta);
char* entradaSetGetHint(Entrada_t* entrada, const char* hint);

int entradaPublicar(Entrada_t* entrada);

char* entradaRespuesta(Entrada_t* entrada);

int entradaDestruir(Entrada_t* entrada);

#endif