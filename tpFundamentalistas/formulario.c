/** @ingroup ModuloFormulario
 * @{ */

/** @file formulario.c 
 * @brief Implementacion del TDA formulario */

#include "formulario.h"

#define MOSTRAR_OPCIONES(c) \
    do{\
        AtribOpciones* atr__ = (c)->info;\
        puts("");\
        int i__;\
        for(i__ = 0; i__ < atr__->cantOpciones; i__++){\
            printf("%d - [%s]\n", i__ + 1, atr__->opciones[i__]);\
        }\
    }while(0)

#define GET_OPCION(c, i) \
    do{\
        AtribOpciones* atr__ = (c)->info;\
        stringNCopy((c)->respuesta, atr__->opciones[(i) - 1], FORM_RESPUESTA_LEN);\
    }while(0)

typedef struct{
    double min;
    double max;
}AtribNum;

typedef struct{
    int len;
}AtribTxt;

typedef struct{
    char opciones[FORM_OPCIONES_CANT][FORM_OPCIONES_LEN];
    int cantOpciones;
}AtribOpciones;

int formularioValidar(Campo* c);

int formularioValidar(Campo* c)
{
    switch(c->tipo){
        case CAMPO_TIPO_NUMERICO: ; /* C considera un error declarar una variable debajo de un label */
            AtribNum* atn = c->info;
            double tmpF;

            if((tmpF = atof(c->respuesta)) < atn->min || tmpF > atn->max){
                printf("Respuesta fuera del rango valido [%lf : %lf]\n", atn->min, atn->max);
                return 0;
            }

            break;
        case CAMPO_TIPO_TEXTO: ;
            AtribTxt* att = c->info;

            if(stringLenght(c->respuesta) > att->len){
                printf("Respuesta demasiado larga, maxlen: %d\n", att->len);
                return 0;
            }

            break;
        case CAMPO_TIPO_OPCIONES: ;
            AtribOpciones* ato = c->info;
            int tmpI;

            if((tmpI = atoi(c->respuesta)) < 0 || tmpI > ato->cantOpciones){
                MOSTRAR_OPCIONES(c);
                return 0;
            }
    }

    return 1;
}

int formularioInit(Formulario_t* f, char* titulo)
{
    if(!f || !titulo){
        return ERR_USUARIO;
    }

    stringNCopy(f->titulo, titulo, FORM_TITULO_LEN);
    f->ce = 0;

    return EXITO;
}

int formularioAgregarCampoVA(Formulario_t* f, char* etiqueta, int validado, int tipo, ...)
{
    if(!f || !etiqueta || tipo < CAMPO_TIPO_NUMERICO || tipo > CAMPO_TIPO_OPCIONES){
        return ERR_USUARIO;
    }

    Campo* c = f->campos + f->ce;
    va_list ap;
    va_start(ap, tipo);

    stringNCopy(c->etiqueta, etiqueta, FORM_ETIQUETAS_LEN);
    c->validado = validado;
    c->tipo = tipo;

    switch(tipo){
        case CAMPO_TIPO_NUMERICO:
            c->info = malloc(sizeof(AtribNum));

            if(!(c->info)){
                return ERR_SIN_MEM;
            }

            AtribNum* atn = c->info;

            atn->min = va_arg(ap, double);
            atn->max = va_arg(ap, double);

            if(atn->min >= atn->max){
                free(c->info);
                return ERR_USUARIO;
            }

            break;
        case CAMPO_TIPO_TEXTO:
            c->info = malloc(sizeof(AtribTxt));

            if(!(c->info)){
                return ERR_SIN_MEM;
            }

            AtribTxt* att = c->info;

            att->len = va_arg(ap, int);

            if(att->len < 0){
                free(c->info);
                return ERR_USUARIO;
            }

            break;
        case CAMPO_TIPO_OPCIONES:
            c->info = malloc(sizeof(AtribOpciones));

            if(!(c->info)){
                return ERR_SIN_MEM;
            }

            AtribOpciones* ato = c->info;
            int i;

            ato->cantOpciones = va_arg(ap, int);
            char** tmp = va_arg(ap, char**);

            for(i = 0; i < ato->cantOpciones; i++){
                stringNCopy(ato->opciones[i], tmp[i], FORM_OPCIONES_LEN);
                /*memcpy(ato->opciones[i], tmp[i], FORM_OPCIONES_LEN); */
            }

            if(ato->cantOpciones < 0){
                free(c->info);
                return ERR_USUARIO;
            }

            break;
        default:
            return ERR_USUARIO;
    }

    va_end(ap);
    f->ce++;

    return EXITO;
}

int formularioPublicar(Formulario_t* f)
{
    printf("----%s----\n", f->titulo);
    Campo* c;
    int i;

    for(i = 0; i < f->ce; i++){
        do{
            c = (f->campos + i);
            printf("%s: ", c->etiqueta);

            if(c->tipo == CAMPO_TIPO_OPCIONES){
                MOSTRAR_OPCIONES(c);
            }

            scanString(c->respuesta, FORM_RESPUESTA_LEN);
        }while(c->validado && !formularioValidar(c));

        if(c->tipo == CAMPO_TIPO_OPCIONES){
            GET_OPCION(c, atoi(c->respuesta));
        }
    }

    return EXITO;
}

char* formularioRespuesta(Formulario_t* f, int i)
{
    if(!f || i < 0 || i > f->ce){
        return NULL;
    }

    Campo* c = f->campos + i;
    char* res;

    res = c->respuesta;

    return res;
}

int formularioDestruir(Formulario_t* f)
{
    Campo* c = f->campos;
    int i;

    for(i = 0; i < f->ce; i++, c++){
        free(c->info);
    }

    return EXITO;
}

/** }@ */
