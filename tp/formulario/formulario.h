#ifndef FORMULARIO_H_INCLUDED
#define FORMULARIO_H_INCLUDED

#define FORMULARIO_TITULO_LEN 64
#define CAMPO_ETIQUETA_LEN 64
#define RESPUESTA_LEN 128
#define FORMULARIO_CAMPOS_NUM 64

typedef struct{
    char etiqueta[CAMPO_ETIQUETA_LEN];
    char respuesta[RESPUESTA_LEN];
    int tipo;
    void* datos;
}Campo_t;

typedef struct{
    char titulo[FORMULARIO_TITULO_LEN];
    Campo_t* campos[FORMULARIO_CAMPOS_NUM];
    int camposCant;
}Formulario_t;

#define CAMPO_ENTERO 0
#define CAMPO_NUMERICO 1
#define CAMPO_TEXTO 2
#define CAMPO_RADIO 3
#define CAMPO_CHECKLIST 4
#define CAMPO_FECHA 5

Formulario_t* formularioCrear(Formulario_t* forma, const char* titulo);

int formularioAgregarCampos(Formulario_t* forma, Campo_t* campos, int cantCampos);
int formularioPublicar(Formulario_t* forma);

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

#endif