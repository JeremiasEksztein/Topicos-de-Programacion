#include "form.h"

int formValidar(Entrada* entr);
int validarOpciones(Entrada* entr);

int formValidar(Entrada* entr)
{
    EntradaAtrib* atribs = &(entr->atrib);
    double tmpF;

    if(!atribs->validacion){
        return 1;
    }

    if(((tmpF = atof(entr->respuesta)) < atribs->min || (tmpF > atribs->max)) && (entr->tipo == ENTRADA_TIPO_NUMERICO)){
        printf("Respuesta fuera del rango valido [%lf : %lf]\n", atribs->min, atribs->max);
        return 0;
    }

    if(strlen(entr->respuesta) > atribs->len){
        printf("Respuesta demasiado larga, maxlen: %d\n", atribs->len);
        return 0;
    }

    if(entr->tipo == ENTRADA_TIPO_OPCIONES){
        if(validarOpciones(entr)){
            printf("Opcion invalida: (%s)\n", entr->opciones);
            return 0;
        }
    }

    return 1;
}

int validarOpciones(Entrada* entr)
{
    char t[FORM_OPCIONES_LEN] = "";
    strcpy(t, entr->opciones);
    char* i = strtok(t, "|");
    char* j = entr->respuesta;

    int cmp;

    while(i && cmp){
        cmp = strcmp(i, j);
        i = strtok(NULL, "|");
    }

    return cmp;
}

int formInit(Form_t* form, char* titulo)
{
    strcpy((char*)form->titulo, titulo);
    form->cantEntradas = 0;

    return EXITO;
}

int formAgregarInput(Form_t* f, int tipo, char* etiqueta, char* opciones)
{
    if(!f || !etiqueta){
        return ERR_USUARIO;
    }

    Entrada* entr = f->entradas;

    strcpy(entr[f->cantEntradas].etiqueta, etiqueta);
    entr[f->cantEntradas].tipo = tipo;

    if(tipo == ENTRADA_TIPO_OPCIONES){
        strcpy(entr[f->cantEntradas].opciones, opciones);
    }

    f->cantEntradas++;

    return EXITO;
}

int formAgregarAtrib(Form_t* f, EntradaAtrib* atrib, int i)
{
    if(!f || !atrib){
        return ERR_USUARIO;
    }

    memmove(&(f->entradas)[i - 1].atrib,  atrib, sizeof(EntradaAtrib));

    return EXITO;
}

int formMostrar(const Form_t* f)
{
    printf("----%s----\n", f->titulo);

    for(int i = 0; i < f->cantEntradas; i++){
        printf("(%d) - %s\n", i + 1, (f->entradas)[i].etiqueta);
    }

    return EXITO;
}


int formPublicar(Form_t* f)
{
    printf("----%s----\n", f->titulo);
    Entrada* entr;

    for(int i = 0; i < f->cantEntradas; i++){
        do{

            entr = &f->entradas[i];
            printf("%s: ", entr->etiqueta);

            if(entr->tipo == ENTRADA_TIPO_OPCIONES){
                printf("(%s) ", entr->opciones);
            }

            fgets(entr->respuesta, sizeof(entr->respuesta), stdin);
            entr->respuesta[strcspn(entr->respuesta, "\n")] = 0;
        }while(!formValidar(entr));
    }

    return EXITO;
}

char* formRespuesta(Form_t* f, int indice)
{
    if(!f || indice < 0 || indice > f->cantEntradas){
        return NULL;
    }

    return (f->entradas)[indice - 1].respuesta;
}

int atribInit(EntradaAtrib* atrib)
{
    atrib->len = 0;
    atrib->max = 0;
    atrib->min = 0;
    atrib->validacion = 0;

    return EXITO;
}

int atribSet(EntradaAtrib* atrib, int tipo, double valor)
{
    switch(tipo){
        case FORM_ATRIBUTO_MAX:
            atrib->max = valor;
            break;
        case FORM_ATRIBUTO_MIN:
            atrib->min = valor;
            break;
        case FORM_ATRIBUTO_LEN:
            atrib->len = valor;
            break;
        case FORM_ATRIBUTO_VALID:
            atrib->validacion = (int) valor;
            break;
        default:
            return ERR_SIN_MEM;
    }

    return EXITO;
}
