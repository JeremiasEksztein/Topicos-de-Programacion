/** @ingroup ModuloFormulario
 * @{ */

#ifndef FORMULARIO_H_INCLUDED
#define FORMULARIO_H_INCLUDED

/** @file formulario.h
 * @brief Header con el TDA formulario */

#include <stdarg.h>
#include "errores.h"
#include "cadenas.h"

#define FORM_TITULO_LEN 64
#define FORM_CAMPOS_CANT 16
#define FORM_ETIQUETAS_LEN 64
#define FORM_RESPUESTA_LEN 128
#define FORM_OPCIONES_LEN 64
#define FORM_OPCIONES_CANT 16

#define CAMPO_TIPO_NUMERICO 0
#define CAMPO_TIPO_TEXTO 1
#define CAMPO_TIPO_OPCIONES 2

/** @brief Struct del Campo de un TDA formulario */
typedef struct{
    char etiqueta[FORM_ETIQUETAS_LEN];
    char respuesta[FORM_RESPUESTA_LEN];
    int validado;
    int tipo;
    void* info;
}Campo;

/** @brief Struct del TDA formulario */
typedef struct{
    char titulo[FORM_TITULO_LEN];
    Campo campos[FORM_CAMPOS_CANT];
    int ce;
}Formulario_t;

int formularioInit(Formulario_t* f, char* titulo);
int formularioAgregarCampoVA(Formulario_t* f, char* etiqueta, int validado, int tipo, ...);
int formularioPublicar(Formulario_t* f);
char* formularioRespuesta(Formulario_t* f, int i);
int formularioDestruir(Formulario_t* f);

#endif /* FORMULARIO_H_INCLUDED */

/** }@ */
