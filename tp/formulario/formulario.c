#include "formulario.h"
#include "graficos.h"

void imprimirTitulo(const char* titulo);

int leerEntradaNumerica(char* buffer, void* info);
int leerEntradaTexto(char* buffer, void* info);
int leerEntradaRadio(char* buffer, void* info);
int leerEntradaChecklist(char* buffer, void* info);

void imprimirTitulo(const char* titulo)
{
    CLEAR_SCREEN;
    PRINT_BIG_PRETTY(titulo);
}

int leerEntradaNumerica(char* buffer, void* info)
{
    EntradaNumerico* tmp = info;
    double buf;
    
    //PRINT_HINT_PRETTY("Ingrese un numero");
    //PRINT_MIN_MAX_PRETTY(tmp->min, tmp->max);

    fgets(buffer, ENTRADA_BUFFER_LEN, stdin);

    if((buf = atof(buffer)) == 0 || (buf < tmp->min) || (buf > tmp->max)){
        return ERR_USUARIO;
    }
    
    buffer[stringCSpan(buffer, "\n") - 1] = '\0';

    return EXITO;
}

int leerEntradaTexto(char* buffer, void* info)
{
    EntradaTexto* tmp = info;

    //PRINT_HINT_PRETTY("Ingrese una cadena de texto. Largo maximo:");
    //PRINT_HINT_PRETTY(tmp->len);

    fgets(buffer, ENTRADA_BUFFER_LEN, stdin);

    if(stringLenght(buffer) > tmp->len){
        return ERR_USUARIO;
    }

    buffer[stringCSpan(buffer, "\n") - 1] = '\0';

    return EXITO;
}

int leerEntradaRadio(char* buffer, void* info)
{
    EntradaRadio* tmp = info;
    int buf;

    //PRINT_HINT_PRETTY("Ingrese un UNICO numero para seleccionar de la lista");

    for(int i = 0; i < tmp->cantOpciones; i++){
        //PRINT_LIST_ITEM_PRETTY(i + 1, (tmp->opciones)[i]);
    }

    fgets(buffer, ENTRADA_BUFFER_LEN, stdin);

    if((buf = atoi(buffer)) < 0 || buf > tmp->cantOpciones){
        return ERR_USUARIO;
    }
    
    buffer[stringCSpan(buffer, "\n") - 1] = '\0';

    return EXITO;
}

int leerEntradaChecklist(char* buffer, void* info)
{
    EntradaChecklist* tmp = info;
    //int buf;

   // PRINT_HINT_PRETTY("Ingrese los numeros, SEPARADOS POR COMAS, para seleccionar de la lista");

    for(int i = 0; i < tmp->cantOpciones; i++){
     //   PRINT_LIST_ITEM_PRETTY(i + 1, (tmp->opciones)[i]);
    }

    fgets(buffer, ENTRADA_BUFFER_LEN, stdin);

    /*
    if((buf = atoi(buffer)) < 0 || buf > tmp->cantOpciones){
        return ERR_USUARIO;
    }
*/
    
    buffer[stringCSpan(buffer, "\n") - 1] = '\0';

    return EXITO;
}

int formularioCrear(Formulario_t* forma, const char* titulo)
{
    stringNCopy((char*)forma->titulo, (char*)titulo, FORMULARIO_TITULO_LEN);
    forma->cantEntradas = 0;

    return EXITO;
}

char* formualarioSetGetTitulo(Formulario_t* forma, const char* titulo)
{
    if(!titulo){
        return (char*)forma->titulo;
    }

    stringNCopy((char*)forma->titulo, (char*)titulo, FORMULARIO_TITULO_LEN);
    
    return (char*)forma->titulo;
}

Entrada_t* formularioSetGetEntradas(Formulario_t* forma, Entrada_t* entradas, int n)
{
    if(!entradas){
        return forma->entradas;
    }

    Entrada_t* entr = forma->entradas;

    memmove(entr, entradas, n * sizeof(Entrada_t));

    /*
    for(int i = 0; i < n; i++){
        memmove(entr + i, entradas + i, sizeof(Entrada_t));
        //entr[i] = entradas[i];
    }
    */

    return forma->entradas;
}

int formularioCantEntradas(Formulario_t* forma)
{
    return forma->cantEntradas;
}

int formularioPublicar(Formulario_t* forma)
{
    Entrada_t* entr = forma->entradas;
    int i;

    for(i = 0; i < forma->cantEntradas; i++){
        imprimirTitulo(forma->titulo);
        entradaPublicar(entr + i);
    }

    return EXITO;
}

int formularioDestruir(Formulario_t* forma)
{
    forma->cantEntradas = 0;

    return EXITO;
}

int entradaCrear(Entrada_t* entrada, const char* etiqueta, const char* hint)
{
    entrada->buffer = malloc(ENTRADA_BUFFER_LEN);

    if(!entrada->buffer){
        return ERR_SIN_MEM;
    }

    stringNCopy((char*)entrada->etiqueta, (char*)etiqueta, ENTRADA_ETIQUETA_LEN);
    stringNCopy((char*)entrada->hint, (char*)hint, ENTRADA_HINT_LEN);

    return EXITO;
}

int entradaSetGetTipo(Entrada_t* entrada, int tipo, void* info)
{
    if(tipo < -1 || info == NULL){
        return entrada->tipo;
    }

    entrada->tipo = tipo;
    entrada->info = info;

    return EXITO;
}

char* entradaSetGetEtiqueta(Entrada_t* entrada, const char* etiqueta)
{
    if(!etiqueta){
        return (char*)entrada->etiqueta;
    }

    stringNCopy((char*)entrada->etiqueta, (char*)etiqueta, ENTRADA_ETIQUETA_LEN);

    return (char*)entrada->etiqueta;
}

char* entradaSetGetHint(Entrada_t* entrada, const char* hint)
{
    if(!hint){
        return (char*)entrada->hint;
    }

    stringNCopy((char*)entrada->hint, (char*)hint, ENTRADA_HINT_LEN);

    return (char*)entrada->hint;
}

int entradaPublicar(Entrada_t* entrada)
{
    //PRINT_SMALL_PRETTY(entrada->etiqueta);
    //PRINT_HINT_PRETTY(entrada->hint);

    switch(entrada->tipo){
        case ENTRADA_TIPO_NUMERICO:
            leerEntradaNumerica(entrada->buffer, entrada->info);
        case ENTRADA_TIPO_TEXTO:
            leerEntradaTexto(entrada->buffer, entrada->info);
        case ENTRADA_TIPO_RADIO:
            leerEntradaRadio(entrada->buffer, entrada->info);
        case ENTRADA_TIPO_CHECKLIST:
            leerEntradaChecklist(entrada->buffer, entrada->info);
        default:
            return -1;
    }

    return 0;
}

char* entradaRespuesta(Entrada_t* entrada)
{
    if(!entrada){
        return NULL;
    }

    return entrada->buffer;
}

int entradaDestruir(Entrada_t* entrada)
{
    free(entrada->buffer);

    return EXITO; 
}


