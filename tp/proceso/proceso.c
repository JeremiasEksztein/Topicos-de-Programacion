#include "proceso.h"

int parsearIPCDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;
    char buffer[500];
    char* i = NULL;

    fgets(buffer, 500, arch);

    stringRemove(buffer, '"');

    if(!(i = stringRChar(buffer, '\n'))){
        return ERR_BUFFER_CORTO;
    }

    *i = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->periodo, i);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->region, i);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->varAnualIPC, i);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->varMensIPC, i);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->indiceIPC, i);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->clasif, i);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->desc, i);
    *(--i) = '\0';

    stringCopy(tmp->cod, buffer);

//    printf("%s %s %s %s %s %s %s %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    
    return EXITO;
}

int parsearIPCAperturas(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;
    char buffer[500];
    char* i = NULL;

    fgets(buffer, 500, arch);

    if(!(i = strrchr(buffer, '\n'))){
        return ERR_BUFFER_CORTO;
    }

    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->region, i);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->varAnualIPC, i);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->varMensIPC, i);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->indiceIPC, i);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->periodo, i);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringCopy(tmp->clasif, i);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->desc);
    *(--i) = '\0';

    stringCopy(tmp->cod, buffer);
    
    return EXITO;
}

int corregirCampos(Vector_t* vec, int (*Corrector)(void*))
{
    Iterador_t iter;

    iteradorCrear(&iter, vec);

    void* tmp = NULL;

    while((tmp = iteradorSiguiente(&iter))){
        TRY(Corrector(tmp));
    }

    iteradorDestruir(&iter);

    return EXITO;
}

int corregirIPCDivisiones(void* reg)
{
    IPCDivisiones* tmp = reg;

    int decodificador[10] = {'4', '6', '8', '7', '1', '5', '5', '0', '3', '2'};

    decodificarFechaDivisiones(tmp, decodificador);

    printf("%s | %s | %s | %s | %s | %s | %s | %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);

    convertirFechaDivisiones(tmp);
    normalizarDescripcionDivisiones(tmp);
    stringReplace(tmp->indiceIPC, ',', '.');
    
    return EXITO;
}

int decodificarFechaDivisiones(IPCDivisiones* reg, int* decod)
{
    char* i = reg->periodo;

    while(*i){
        if(*i >= '0' && *i <= '9'){
            *i = decod[*i - '0'];
        } else {
            return ERR_REGISTRO;
        }
        i++;
    }      

    return EXITO;   
}

int convertirFechaDivisiones(IPCDivisiones* reg)
{
    char* i = reg->periodo;

    static const char* meses[12] = {"Enero", "Febrero", "Marzo", 
                          "Abril", "Mayo", "Junio", 
                          "Julio", "Agosto", "Septiembre",
                          "Octubre", "Noviembre", "Diciembre"
                           };

    char a[5];
    char m[3];
    int mes;

    stringNCopy(a, i, 4);
    stringNCopy(m, i + 4, 3);
    mes = atoi(m);

    if(mes < 1 || mes > 12){
        return ERR_REGISTRO;
    }
    
    snprintf(reg->periodo, DIVISIONES_PERIODO_LEN, "%s - %s", a, meses[mes - 1]);

    return EXITO;
}

int normalizarDescripcionDivisiones(IPCDivisiones* reg)
{
    SecuenciaPalabras_t lect, escr;
    Palabra_t pal;

    char* i = reg->desc;
    char buf[DIVISIONES_DESC_LEN];

    secuenciaPalabrasCrear(&lect, i);
    secuenciaPalabrasCrear(&escr, buf);

    secuenciaPalabrasLeer(&lect, &pal);
    palabraModificar(&pal, palabraATitulo);
    palabraMostrar(buf);
    secuenciaPalabrasEscribir(&escr, &pal);

    while(!secuenciaPalabrasEsFin(&lect)){
        secuenciaPalabrasLeer(&lect, &pal);
        palabraModificar(&pal, palabraAMinuscula);
        secuenciaPalabrasEscribir(&escr, &pal);
    }

    secuenciaPalabrasCerrar(&escr);

    return 0;
}

void palabraATitulo(Palabra_t* pal)
{  
    char* i = pal->cadena;

    *i = toupper(*i);
    i++;

    while(*i){
        *i = tolower(*i);
        i++;
    }

}

void palabraAMinuscula(Palabra_t* pal)
{
    char* i = pal->cadena;

    while(*i){
        *i = tolower(*i);
        i++;
    }
}

int corregirIPCAperturas(void* reg)
{
    IPCAperturas* tmp = reg;

    corregirFormatoFechaAperturas(tmp);
    stringReplace(tmp->indiceIPC, ',', '.');

    return EXITO;
}

int corregirFormatoFechaAperturas(IPCAperturas* reg)
{
    char* i = reg->periodo;

    char a[5], m[3];

    stringNCopy(a, i, 4);
    stringTrim(m, i, 4, 7);

    sprintf(i, "%s-%s-01", a, m);

    return EXITO;
}



int herramientaAjustarMontoIPCDivisiones(Vector_t* divs)
{
    return EXITO;
}

int clasificarBySIPCDivisiones(Vector_t* divs)
{
    return EXITO;
}

int herramientaCalcularAlquilerIPCAperturas(Vector_t* aper)
{
    return EXITO;
}



