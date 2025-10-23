#include "parseo.h"

//static int indiceDebug = 0;

int parsearIPCDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;
    char buffer[500] = "";
    char* i = NULL;

    if(!fgets(buffer, 500, arch)){
        return EXITO;
    }

    stringRemove(buffer, '"');

    if(!(i = stringRChar(buffer, '\n'))){
        if(!(i = stringRChar(buffer, EOF))){
            LOG(ERR_BUFFER_CORTO);
        }
    }

    *i = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        LOG(ERR_REGISTRO);
    }

    ++i;
    stringNCopy(tmp->periodo, i, DIVISIONES_PERIODO_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        LOG(ERR_REGISTRO);
    }

    ++i;
    stringNCopy(tmp->region, i, DIVISIONES_REGION_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        LOG(ERR_REGISTRO);
    }

    ++i;
    stringNCopy(tmp->varAnualIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        LOG(ERR_REGISTRO);
    }

    ++i;
    stringNCopy(tmp->varMensIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        LOG(ERR_REGISTRO);
    }

    ++i;
    stringNCopy(tmp->indiceIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->clasif, i, DIVISIONES_CLASIF_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->desc, i, DIVISIONES_DESC_LEN);
    *(--i) = '\0';

    stringNCopy(tmp->cod, buffer, DIVISIONES_COD_LEN);

    //printf("%s %s %s %s %s %s %s %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    //getchar();

    return EXITO;
}

int parsearIPCAperturas(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;
    char buffer[500] = "";
    char* i = NULL;

    if(!fgets(buffer, 500, arch)){
        return EXITO;
    }

    if(!(i = stringRChar(buffer, '\n'))){
        if(!(i = stringRChar(buffer, EOF))){
            LOG(ERR_BUFFER_CORTO);
        }
    }

    //indiceDebug++;
    *i = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->region, i, APERTURAS_REGION_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->varAnualIPC, i, APERTURAS_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->varMensIPC, i, APERTURAS_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->indiceIPC, i, APERTURAS_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->periodo, i, APERTURAS_PERIODO_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->clasif, i, APERTURAS_CLASIF_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->desc, i, APERTURAS_DESC_LEN);
    *(--i) = '\0';

    stringNCopy(tmp->cod, buffer, APERTURAS_COD_LEN);

    //printf("%d\n", indiceDebug);

    return EXITO;
}

int corregirCampos(Vector_t* vec, int (*Corrector)(void*))
{
    Iterador_t iter;

    iteradorCrear(&iter, vec);

    void* tmp = NULL;

    while((tmp = iteradorSiguiente(&iter))){
        LOG(Corrector(tmp));
    }

    iteradorDestruir(&iter);

    return EXITO;
}

int corregirIPCDivisiones(void* reg)
{
    IPCDivisiones* tmp = reg;

    int decodificador[10] = {'4', '6', '8', '7', '1', '9', '5', '0', '3', '2'}; // tal vez para el digito 5 le corresponde un 9

    decodificarFechaDivisiones(tmp, decodificador);
    convertirFechaDivisiones(tmp);
    normalizarDescripcionDivisiones(tmp);
    stringReplace(tmp->indiceIPC, ',', '.');
    stringReplace(tmp->varAnualIPC, ',', '.');
    stringReplace(tmp->varMensIPC, ',', '.');

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
        ++i;
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

    stringNCopy(m, i + 4, 2);
    mes = atoi(m);

    if(mes < 1 || mes > 12){
        return ERR_REGISTRO;
    }

    snprintf(reg->periodo, DIVISIONES_PERIODO_LEN, "%s - %s", meses[mes - 1], a);

    return EXITO;
}

int normalizarDescripcionDivisiones(IPCDivisiones* reg)
{
    char* i = reg->desc;
	*i = toupper(*i);

	i++;
	while (*i) {
		if (isalpha(*i)) {
			*i = tolower(*i);
		}
		++i;
	}
	return EXITO;
	/*
    SecuenciaPalabras_t lect, escr;
    Palabra_t pal;

    char* i = reg->desc;
    char buf[100];

    secuenciaPalabrasCrear(&lect, i);
    secuenciaPalabrasCrear(&escr, buf);

    secuenciaPalabrasLeer(&lect, &pal);
    palabraModificar(&pal, palabraATitulo);
    secuenciaPalabrasEscribir(&escr, &pal);
    secuenciaPalabrasEscribirCaract(&escr, ' ');

    secuenciaPalabrasLeer(&lect, &pal);

    while(!secuenciaPalabrasEsFin(&lect)){
        palabraModificar(&pal, palabraAMinuscula);
        secuenciaPalabrasEscribir(&escr, &pal);
        secuenciaPalabrasLeer(&lect, &pal);
        secuenciaPalabrasEscribirCaract(&escr, ' ');
    }

    secuenciaPalabrasCerrar(&escr);

    stringNCopy(i, buf, DIVISIONES_DESC_LEN);

    return 0;
    */
}

void palabraATitulo(char* pal)
{
    char* i = pal;

    *i = toupper(*i);
    i++;

    while(*i){
        *i = tolower(*i);
        i++;
    }

}

void palabraAMinuscula(char* pal)
{
    char* i = pal;

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
    stringReplace(tmp->varAnualIPC, ',', '.');
    stringReplace(tmp->varMensIPC, ',', '.');

    return EXITO;
}

int corregirFormatoFechaAperturas(IPCAperturas* reg)
{
    char* i = reg->periodo;

    char a[5], m[3];

    stringNCopy(a, i, 4);
    stringNCopy(m, i + 4, 2);

    sprintf(i, "%s-%s-01", a, m);

    return EXITO;
}

int parsearParaDivisiones(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    return EXITO;
}

int parsearParaAperturas(FILE* arch, void* reg)
{
    IPCAperturas* tmp = reg;

    fprintf(arch, "%s|%s|%s|%s|%s|%s|%s|%s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->periodo, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region);
    return EXITO;
}

int parsearParaEscritura(FILE* arch, void* reg)
{
    IPCDivisiones* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s | %s | %s | %s | %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    return EXITO;
}
