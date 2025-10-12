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
    stringNCopy(tmp->periodo, i, DIVISIONES_PERIODO_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->region, i, DIVISIONES_REGION_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->varAnualIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->varMensIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->indiceIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->clasif, i, DIVISIONES_CLASIF_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->desc, i, DIVISIONES_DESC_LEN);
    *(--i) = '\0';

    stringNCopy(tmp->cod, buffer, DIVISIONES_COD_LEN);

    //printf("%s %s %s %s %s %s %s %s\n", tmp->cod, tmp->desc, tmp->clasif, tmp->indiceIPC, tmp->varMensIPC, tmp->varAnualIPC, tmp->region, tmp->periodo);
    
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
    stringNCopy(tmp->region, i, APERTURAS_REGION_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->varAnualIPC, i, APERTURAS_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->varMensIPC, i, APERTURAS_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->indiceIPC, i, APERTURAS_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->periodo, i, APERTURAS_PERIODO_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->clasif, i, APERTURAS_CLASIF_LEN);
    *(--i) = '\0';

    if(!(i = strrchr(buffer, ';'))){
        return ERR_REGISTRO;
    }

    i++;
    stringNCopy(tmp->desc, i, APERTURAS_DESC_LEN);
    *(--i) = '\0';

    stringNCopy(tmp->cod, buffer, APERTURAS_COD_LEN);
    
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

    stringNCopy(m, i + 4, 2);
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
        secuenciaPalabrasEscribirCaract(&escr, ' ');
        secuenciaPalabrasLeer(&lect, &pal);
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

/*Hay que agregar aca una interfaz de menu y en general emprolijarlo todo
 pero como prueba de concepto parece funcionar*/

int herramientaAjustarMontosIPCDivisiones(Vector_t* divs)
{
    Vector_t* tmp;
    Respuesta ans;

    ans = preguntarAjustarMonto();

    tmp = filter(divs, filtrarIPCDivisiones, &ans);

    if(!tmp || tmp->cantElem < 2){
        printf("No se encontraron registros que coincidan con los parametros ingresados.\n");
        return ERR_USUARIO;
    }

    IPCDivisiones* i = vectorObtener(tmp, 0);
    IPCDivisiones* f = vectorObtener(tmp, 1);

    double varPor = ((atof(f->indiceIPC) / atof((i->indiceIPC))) - 1) * 100;
    double montoAjus = ans.monto + (ans.monto * varPor / 100);

    printf("El monto $ %0.2lf en la region %s durante %s, ajustado en la misma region al %s vario en un %%%0.2lf a un total de $ %0.2lf\n", ans.monto, ans.region, ans.periodoIni, ans.periodoFin, varPor, montoAjus);

    vectorDestruir(tmp);


    /*
    Vector_t* tmp;
    MenuDinamico_t menuDeAjustar;

    menuDinamicoCrear(&menuDeAjustar, ...);

    void* respuestas = menuPreguntar();

    tmp = filter(&divs, filtrarIPCDivisiones, respuestas);

    IPCDivisiones* i = vectorObtener(tmp, 0);
    IPCDivisiones* f = vectorObtener(tmp, 1);

    double varPor = ((atof(f->indiceIPC) / atof((i->indiceIPC - 1)))) * 100;
    double montoAjus = respuestas.monto * (1 + varPor);

    printf("El monto %0.2lf en la region %s durante %s, ajustado en la misma region al %s vale %0.2lf\n", respuestas.monto, respuestas.region, respuestas.periodoIni, respuestas.periodoFin);

    menuDinamicoDestruir(&menuDeAjustar);
    vectorDestruir(tmp);
*/
    return EXITO;
}

Respuesta preguntarAjustarMonto(void)
{
    Respuesta ans;

    scanf("%lf", &(ans.monto));

    flushStdin();

    scanString(ans.region, DIVISIONES_REGION_LEN);

    scanString(ans.periodoIni, DIVISIONES_PERIODO_LEN);

    scanString(ans.periodoFin, DIVISIONES_PERIODO_LEN);

    //printf("%lf | %s | %s | %s\n", ans.monto, ans.region, ans.periodoIni, ans.periodoFin);

    return ans;
}

int filtrarIPCDivisiones(void* dato, void* contexto)
{
    IPCDivisiones* tmpD = dato;
    Respuesta* tmpC = contexto;

    if((!stringCmp(tmpD->periodo, tmpC->periodoIni) || !stringCmp(tmpD->periodo, tmpC->periodoFin)) && !stringCmp(tmpD->region, tmpC->region) && !stringCmp(tmpD->desc, "NIVEL GENERAL")){
        return 1;
    }

    return 0;
}

int clasificarBySIPCDivisiones(Vector_t* divs)
{
    Vector_t* bienesYServicios;
    Vector_t* nacional;

    bienesYServicios = filtrarVector(divs, filtrarBienesYServicios, NULL);
    bienesYServicios = mapearVector(bienesYServicios, mapearBienesYServicios, sizeof(IPCClasificado));

    


    vectorEscribirATexto(bienesYServicios, "pruebaNacional.csv", parsearIPCNacional);

    vectorDestruir(bienesYServicios);

    return EXITO;
}

int filtrarBienesYServicios(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;

    if(!stringCmp(tmp->desc, "NIVEL GENERAL") || !stringCmp(tmp->desc, "NA")){
        return 0;
    }

    return 1;
}

void* mapearBienesYServicios(void* dato, void* elem)
{
    IPCDivisiones* tmpD = dato;
    IPCClasificado* tmpC = elem;

    stringNCopy(tmpC->desc, tmpD->desc, CLASIFICADO_DESC_LEN);
    cargarFecha(tmpC->fecha, tmpD->periodo);
    cargarGrupo(tmpC->grupo, tmpD->desc);
    stringNCopy(tmpC->indiceIPC, tmpD->indiceIPC, CLASIFICADO_IND_IPC_LEN);
    stringNCopy(tmpC->region, tmpD->region, CLASIFICADO_REGION_LEN);

    return tmpC;
}

int herramientaCalcularAlquilerIPCAperturas(Vector_t* aper)
{
    return EXITO;
}



