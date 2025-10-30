/** @ingroup ModuloFormulario
 * @{ */

#ifndef FORMULARIO_H_INCLUDED
#define FORMULARIO_H_INCLUDED

/** @file formulario.h
 * @brief Header con el TDA formulario */

#include <stdarg.h>
#include "errores.h"
#include "comunes.h"
#include "cadenas.h"

#define FORM_TITULO_LEN 64
#define FORM_CAMPOS_CANT 16
#define FORM_VALIDACIONES_CANT 16
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

    int (*Validaciones[FORM_VALIDACIONES_CANT])(void* f);
    int cv;
}Formulario_t;

/**
 *  @fn int formularioInit(Formulario_t* f, char* titulo)
 *  @brief Inicializa el TDA Formulario con un titulo dado
 *  @param f Puntero al formulario
 *  @param titulo Titulo del formulario
 */
int formularioInit(Formulario_t* f, char* titulo);

/**
 *  @fn int formularioAgregarCampoVA(Formulario_t* f, char* etiqueta, int validado, int tipo, ...)
 *  @brief Agrega un campo al formulario, con parametros variables segun el tipo
 *  @param f Puntero al formulario
 *  @param etiqueta Etiqueta del campo
 *  @param validado Indica si el campo debe ser validado (1) o no (0)
 *  @param tipo Tipo del campo (CAMPO_TIPO_NUMERICO, CAMPO_TIPO_TEXTO, CAMPO_TIPO_OPCIONES)
 *  @param ... Parametros variables segun el tipo:
 *       - CAMPO_TIPO_NUMERICO: double min, double max
 *       - CAMPO_TIPO_TEXTO: int len, int (*Validar)(char*), char* (*Parsear)(char*)
 *       - CAMPO_TIPO_OPCIONES: int cantOpciones, char** opciones
 *  @warning La funcion es variadica, el pasaje incorrecto de parametros - en el orden incorrecto o sin todos los parametros -
 *  incurrira en comportamiento indefinido.
 *  @warning El TDA utiliza memoria dinamica para almacenar la informacion, se tiene que conservar el estado del TDA
 *  hasta su destruccion.
 */
int formularioAgregarCampoVA(Formulario_t* f, char* etiqueta, int validado, int tipo, ...);

/**
 *  @fn int formularioAgregarValidado(Formulario_t* f, int (*ValidarFormulario)(void* f)) 
 *  @brief Agrega una funcion de validacion al formulario
 *  @param f Puntero al formulario
 *  @param ValidarFormulario Funcion de validacion a agregar
 *  @brief El puntero al formulario es void debido a estar declarado antes del TDA
 */
int formularioAgregarValidado(Formulario_t* f, int (*ValidarFormulario)(void* f));

/** @fn int formularioPublicar(Formulario_t* f)
 *  @brief Publica el formulario en terminal, solicitando las respuestas al usuario
 *  @param f Puntero al formulario
 */
int formularioPublicar(Formulario_t* f);

/**
 *  @fn char* formularioRespuesta(Formulario_t* f, int i)
 *  @brief Entrega la respuesta i del formulario, parseada segun el tipo de campo.
 *  @brief Las respuestas estan indexadas desde 0.
 *  @param f Puntero al formulario
 *  @param i Indice de la respuesta a obtener
 */
char* formularioRespuesta(Formulario_t* f, int i);

/**
 *  @fn char* formularioRawRespuesta(Formulario_t* f, int i)
 *  @brief Entrega la respuesta i del formulario, sin parseo alguno.
 *  @brief Tiene de uso la validacion del formulario para asegurar que la respuesta es valida.
 *  @brief Las respuestas estan indexadas desde 0.
 *  @param f Puntero al formulario
 *  @param i Indice de la respuesta a obtener
 */
char* formularioRawRespuesta(Formulario_t* f, int i); /* Entrega la respuesta i del formulario, sin parseo alguno*/

/**
 *  @fn int formularioDestruir(Formulario_t* f)
 *  @brief Destruye el formulario, liberando la memoria utilizada
 *  @param f Puntero al formulario
 */
int formularioDestruir(Formulario_t* f);

#endif /* FORMULARIO_H_INCLUDED */

/** }@ */
