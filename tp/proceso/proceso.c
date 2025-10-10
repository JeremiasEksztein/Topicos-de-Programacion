#include "proceso.h"

int parsearIPCDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;
    char buffer[500];
    char* i = NULL;

    fgets(buffer, 500, arch);

    stringRemove(buffer, '\"');

    if(!(i = strrchr(buffer, '\n'))){
        return ERR_BUFFER_CORTO;
    }

    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->periodo);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->region);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->varAnualIPC);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->varMensIPC);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->indiceIPC);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->clasif);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->desc);
    *i = '\0';

    sscanf(i, "%s", tmp->cod);
    
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
    sscanf(i, "%s", tmp->region);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->varAnualIPC);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->varMensIPC);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->indiceIPC);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->periodo);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->clasif);
    *i = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    sscanf(i, "%s", tmp->desc);
    *i = '\0';

    sscanf(i, "%s", tmp->cod);
    
    return EXITO;
}

int corregirCampos(Vector_t* vec, int (*Corrector)(void*))
{
    Iterador_t iter;

    iteradorCrear(&iter, vec);

    void* tmp = NULL;

    while((tmp = iteradorSiguiente(&iter))){
        Corrector(tmp);
    }

    iteradorDestruir(&iter);

    return EXITO;
}

int corregirIPCDivisiones(void* reg)
{
    IPCDivisiones* tmp = reg;

    int decodificador[10] = {4, 6, 8, 7, 1, 5, 5, 0, 3, 2};

    decodificarFechaDivisiones(tmp, decodificador);
    convertirFechaDivisiones(tmp);
    normalizarDescripcionDivisiones(tmp);
    stringReplace(tmp->indiceIPC, ',', '.');
    
    return EXITO;
}

int decodificarFechaDivisiones(IPCDivisiones* reg, int* decod)
{
    char* i = reg->periodo;

    while(*i){
        *i = decod[*i - 48];
    }    

    return EXITO;   
}

int convertirFechaDivisiones(IPCDivisiones* reg)
{
    char* i = reg->periodo;
    char* meses[12] = {"Enero", "Febrero", "Marzo", 
                        "Abril", "Mayo", "Junio", 
                        "Julio", "Agosto", "Septiembre",
                        "Octubre", "Noviembre", "Diciembre"
    };

    char a[5], m[16];

    stringNCopy(a, i, 4);
    stringTrim(m, i, 4, 6);

    stringCopy(m, meses[atoi(m) - 1]);

    sprintf(i, "%s - %s", m, a);

    return 0;
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
    secuenciaPalabrasEscribir(&escr, &pal);

    while(!secuenciaPalabrasEsFin(&lect)){
        secuenciaPalabrasLeer(&lect, &pal);
        palabraModificar(&pal, palabraATitulo);
        secuenciaPalabrasEscribir(&escr, &pal);
    }

    secuenciaPalabrasCerrar(&escr);

    return 0;
}

void palabraATitulo(Palabra_t* pal)
{  
    char* i = pal->cadena;

    *i++ = toupper(*i);
    
    while(*i){
        *i++ = tolower(*i);
    }

}

void palabraAMinuscula(Palabra_t* pal)
{
    char* i = pal->cadena;

    while(*i){
        *i++ = tolower(*i);
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
    stringTrim(m, i, 4, 6);

    sprintf(i, "%s-%s-01", a, m);

    return EXITO;
}

int herramientaAjustarMontoIPCDivisiones(Vector_t* divs)
{
    return EXITO;
}

int clasificarBySIPCDivisiones(Vector_t* divs);
{
    return EXITO;
}

int herramientaCalcularAlquilerIPCAperturas(Vector_t* aper)
{
    return EXITO;
}



