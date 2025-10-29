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
            printf(COLOR_DIM COLOR_GRAY "%d - [%s]" COLOR_RESET "\n", i__ + 1, atr__->opciones[i__]);\
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
    int (*Validar)(char* ans); /* Las expresiones regulares del hombre pobre. Si tenia mas tiempo y animos las programaba*/
    char* (*Parsear)(char* ans);
}AtribTxt;

typedef struct{
    char opciones[FORM_OPCIONES_CANT][FORM_OPCIONES_LEN];
    int cantOpciones;
}AtribOpciones;

int campoValidar(Campo* c);
int formularioValidar(Formulario_t* f);

int campoValidar(Campo* c)
{
    switch(c->tipo){
        case CAMPO_TIPO_NUMERICO: ; /* C considera un error declarar una variable debajo de un label, ; es un statement vacio*/
            AtribNum* atn = c->info;
            double tmpF;

            if((tmpF = atof(c->respuesta)) < atn->min || tmpF > atn->max){
                printf(COLOR_BOLD COLOR_RED "Respuesta fuera del rango valido [%lf : %lf]" COLOR_RESET "\n", atn->min, atn->max);
                return 0;
            }

            break;
        case CAMPO_TIPO_TEXTO: ;
            AtribTxt* att = c->info;

            if(stringLenght(c->respuesta) > att->len){
                printf(COLOR_BOLD COLOR_RED "Respuesta demasiado larga, maxlen: %d" COLOR_RESET "\n", att->len);
                return 0;
            }

            if(att->Validar && !att->Validar(c->respuesta)){ /* Si se proveyo de una funcion de validacion y la respuesta no la supera*/
                return 0;
            }

            break;
        case CAMPO_TIPO_OPCIONES: ;
            AtribOpciones* ato = c->info;
            int tmpI;

            if((tmpI = atoi(c->respuesta)) < 0 || tmpI > ato->cantOpciones){
                puts(COLOR_BOLD COLOR_RED "Opcion incorrecta, elija de nuevo" COLOR_RESET);
                return 0;
            }
    }

    return 1;
}

int formularioValidar(Formulario_t* f)
{
    int i;

    for(i = 0; i < f->cv; i++){
        if(!((f->Validaciones[i])(f))){
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
    f->cv = 0;

    return EXITO;
}

int formularioAgregarCampoVA(Formulario_t* f, char* etiqueta, int validado, int tipo, ...)
{
    if(!f || !etiqueta || tipo < CAMPO_TIPO_NUMERICO || tipo > CAMPO_TIPO_OPCIONES){
        return ERR_USUARIO;
    }

    if(f->ce == FORM_CAMPOS_CANT){
        return ERR_SIN_MEM;
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
            att->Validar = va_arg(ap, int(*)(char*));
            att->Parsear = va_arg(ap, char*(*)(char*));

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

int formularioAgregarValidado(Formulario_t* f, int (*ValidarFormulario)(void* f))
{
    if(!f || !ValidarFormulario){
        return ERR_USUARIO;
    }

    if(f->cv == FORM_VALIDACIONES_CANT){
        return ERR_SIN_MEM;
    }

    (f->Validaciones)[f->cv] = ValidarFormulario;
    f->cv++;

    return EXITO;
}

int formularioPublicar(Formulario_t* f)
{
    Campo* c;
    int i, conforme = 0; /* No conforme */

    do{
        do{
            esperarInput();
            flushStdin();

            for(i = 0; i < f->ce; i++){
                do{
                    puts(FLUSH_TERMINAL);
                    printf(COLOR_BOLD "---------" COLOR_YELLOW "%s" COLOR_RESET COLOR_BOLD "---------\n" COLOR_RESET, f->titulo);
                    c = (f->campos + i);
                    printf(COLOR_BOLD COLOR_CYAN "%s: " COLOR_RESET, c->etiqueta);

                    if(c->tipo == CAMPO_TIPO_OPCIONES){
                        MOSTRAR_OPCIONES(c);
                    }

                    scanString(c->respuesta, FORM_RESPUESTA_LEN);
                }while(c->validado && !campoValidar(c));

                if(c->tipo == CAMPO_TIPO_OPCIONES){
                    GET_OPCION(c, atoi(c->respuesta));
                }
            }
        }while(f->cv && !formularioValidar(f));

        puts(FLUSH_TERMINAL);
        printf(COLOR_BOLD "---------" COLOR_YELLOW "%s" COLOR_RESET COLOR_BOLD "---------\n" COLOR_RESET, f->titulo);

        puts("Su seleccion: ");
        for(i = 0; i < f->ce; i++){
            c = (f->campos + i);
            printf("%0d - " COLOR_BOLD COLOR_CYAN "%s" COLOR_RESET "\n", i + 1 , c->respuesta);
        }

        do{
            puts(COLOR_BOLD COLOR_GRAY "Esta conforme?\t" COLOR_GREEN "Y" COLOR_RESET "/" COLOR_RED "N" COLOR_RESET "\n" );
            conforme = toupper(getchar());
        }while(conforme != 'Y' && conforme != 'N');

        conforme = (conforme == 'Y') ? 1 : 0;
    }while(!conforme);

    return EXITO;
}

char* formularioRespuesta(Formulario_t* f, int i)
{
    if(!f || i < 0 || i > f->ce){
        return NULL;
    }

    Campo* c = f->campos + i;
    AtribTxt* att = (c->tipo == CAMPO_TIPO_TEXTO) ? c->info : NULL;
    char* res;

    res = c->respuesta;

    if(att){
        res = att->Parsear(c->respuesta);
    }

    return res;
}

char* formularioRawRespuesta(Formulario_t* f, int i)
{
    if(!f || i < 0 || i > f->ce){
        return NULL;
    }

    Campo* c = f->campos + i;

    return c->respuesta;
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
