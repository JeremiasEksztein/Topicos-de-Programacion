#ifndef FORM_H_INCLUDED
#define FORM_H_INCLUDED

/// @file form.h
/// @brief Header con las funcionalidades del TDA Formulario

#include "comunes.h"
#include <string.h>

#define FORM_TITULO_LEN 64
#define FORM_ENTRADAS_CANT 16
#define FORM_ETIQUETAS_LEN 48
#define FORM_RESPUESTA_LEN 128
#define FORM_OPCIONES_LEN 64

#define ENTRADA_TIPO_NUMERICO 0
#define ENTRADA_TIPO_TEXTO 1
#define ENTRADA_TIPO_OPCIONES 2

#define FORM_ATRIBUTO_MIN 0
#define FORM_ATRIBUTO_MAX 1
#define FORM_ATRIBUTO_LEN 2
#define FORM_ATRIBUTO_VALID 3

typedef struct{
    double min;
    double max;
    int len;
    int validacion;
}EntradaAtrib;

typedef struct{
    char etiqueta[FORM_ETIQUETAS_LEN];
    char respuesta[FORM_RESPUESTA_LEN];
    char opciones[FORM_OPCIONES_LEN];
    int tipo;
    EntradaAtrib atrib;
}Entrada;

typedef struct{
    char titulo[FORM_TITULO_LEN];
    Entrada entradas[FORM_ENTRADAS_CANT];
    int cantEntradas;
}Form_t;

int formInit(Form_t* form, char* titulo);
int formAgregarInput(Form_t* form, int tipo, char* etiqueta, char* opciones);
int formAgregarAtrib(Form_t* form, EntradaAtrib* atrib, int i);

int atribInit(EntradaAtrib* atrib);
int atribSet(EntradaAtrib* atrib, int tipo, double valor);

int formPublicar(Form_t* form);

char* formRespuesta(Form_t* form, int i);

#endif // FORM_H_INCLUDED
