/** @ingroup ModuloDivisiones
 * @{ */

/** @file herramientasDivisiones.c
 * @brief Implementacion de herramientasDivisiones.h */

#include "herramientasDivisiones.h"

#define divisionTablaDivisiones "----------------------------------------------------------------------------------------------"

int herramientaAjustarMontosIPCDivisiones(Vector_t* divs)
{
    Vector_t* tmp;
    RespuestaMontos ans;
    IPCDivisiones *i = NULL, *f = NULL;
    double varPor, montoAjus;

    ans = preguntarAjustarMonto();

    tmp = filtrarVector(divs, filtrarIPCDivisiones, &ans);

    if(!tmp || vectorCantElem(tmp) < 2){
        printf("No se encontraron registros que coincidan con los parametros ingresados.\n");
        return ERR_USUARIO;
    }

    i = vectorObtener(tmp, 0);
    f = vectorObtener(tmp, 1);

    varPor = ((atof(f->indiceIPC) / atof((i->indiceIPC))) -1.0f) * 100.0f;
    montoAjus = ans.monto * ((atof(f->indiceIPC) / atof(i->indiceIPC)));

    puts(FLUSH_TERMINAL);
    printf("La variacion porcentual del IPC Region " COLOR_BCYAN "%s" COLOR_RESET " entre " COLOR_BCYAN "%s" COLOR_RESET " y " COLOR_BCYAN "%s" COLOR_RESET
           " fue del " COLOR_YELLOW "%0.1lf %%\n" COLOR_RESET "El monto actualizado para el periodo seleccionado es: " COLOR_CYAN "$ %0.2lf" COLOR_RESET " -> " COLOR_BYELLOW "$ %0.2lf\n" COLOR_RESET, ans.region, ans.periodoIni, ans.periodoFin, varPor, ans.monto, montoAjus);

    esperarInput();

    vectorDestruir(tmp);

    return EXITO;
}

RespuestaMontos preguntarAjustarMonto(void)
{
    RespuestaMontos ans;
    Formulario_t form;
    const char* regiones[DIVISIONES_REGION_LEN] = {"Nacional", "GBA", "Pampeana", "Cuyo", "Noroeste", "Noreste", "Patagonia"};

    formularioInit(&form, "Ajustar montos por IPC");
    formularioAgregarCampoVA(&form, "Monto a ajustar ($)", 1, CAMPO_TIPO_NUMERICO, 0.0f, 9999999.9f);
    formularioAgregarCampoVA(&form, "La region a evaluar", 1, CAMPO_TIPO_OPCIONES, 7, regiones);
    formularioAgregarCampoVA(&form, "Periodo de inicio (AAAA-MM)", 1, CAMPO_TIPO_TEXTO, DIVISIONES_PERIODO_LEN, validarFechaForm, convertirFechaResDivs);
    formularioAgregarCampoVA(&form, "Periodo de fin (AAAA-MM)", 1, CAMPO_TIPO_TEXTO, DIVISIONES_PERIODO_LEN, validarFechaForm, convertirFechaResDivs);

    formularioAgregarValidado(&form, validarFechaResDivs);

    formularioPublicar(&form);

    ans.monto = atof(formularioRespuesta(&form, 0));
    stringNCopy(ans.region, formularioRespuesta(&form, 1), DIVISIONES_REGION_LEN);
    stringNCopy(ans.periodoIni, formularioRespuesta(&form, 2), DIVISIONES_PERIODO_LEN);
    stringNCopy(ans.periodoFin, formularioRespuesta(&form, 3), DIVISIONES_PERIODO_LEN);

    formularioDestruir(&form);

    return ans;
}

int validarFechaResDivs(void* ptr)
{
    Formulario_t* f = ptr;
    char* ini = formularioRawRespuesta(f, 2);
    char* fin = formularioRawRespuesta(f, 3);
    int tmpI, tmpF;

    tmpI = ini[5] * 10 + ini[6] - 11 * '0';
    tmpF = fin[5] * 10 + fin[6] - 11 * '0';

    tmpI += ini[0] * 100000 + ini[1] * 10000 + ini[2] * 1000 + ini[3] * 100 - 111100 * '0';
    tmpF += fin[0] * 100000 + fin[1] * 10000 + fin[2] * 1000 + fin[3] * 100 - 111100 * '0';

    if(tmpF <= tmpI){
        printf(COLOR_BOLD COLOR_RED "Error: fecha de inicio no puede ser mayor o igual a la fecha de fin, vuelva a intentar\n" COLOR_RESET);
        getchar();
        return 0;
    }

    return 1;
}

char* convertirFechaResDivs(char* ans)
{
    static char* meses[12] = {"Enero", "Febrero", "Marzo",
                          "Abril", "Mayo", "Junio",
                          "Julio", "Agosto", "Septiembre",
                          "Octubre", "Noviembre", "Diciembre"
                           };
    char a[5];
    char* mes = meses[ans[5] * 10 + ans[6] - 11 * '0' - 1];

    stringNCopy(a, ans, 4);

    sprintf(ans, "%s - %s", mes, a);

    return ans;
}

int filtrarIPCDivisiones(void* dato, void* contexto)
{
    IPCDivisiones* tmpD = dato;
    RespuestaMontos* tmpC = contexto;

    if(stringCmp(tmpD->desc, "Nivel general")){
        return 0;
    }

    if((!stringCmp(tmpD->periodo, tmpC->periodoIni) || !stringCmp(tmpD->periodo, tmpC->periodoFin)) && !stringCmp(tmpD->region, tmpC->region)){
        return 1;
    }

    return 0;
}

int clasificarBySIPCDivisiones(Vector_t* divs)
{
    Vector_t* bienes;
    Vector_t* servicios;
    Vector_t* nacional;

    bienes = filtrarVector(divs, filtrarBienes, NULL);
    servicios = filtrarVector(divs, filtrarServicios, NULL);

    /*vectorEscribirATexto(bienes, ARCH_BIENES, parsearEscrDivisiones);*/ /* Descomentar para grabar a memoria paso intermedio*/
    /*vectorEscribirATexto(servicios, ARCH_SERVICIOS, parsearEscrDivisiones);*/ /* Descomentar para grabar a memoria paso intermedio */

    bienes = reducirVectorPorClave(bienes, obtenerPeriodo, compararPeriodo, reducirBySProm);
    servicios = reducirVectorPorClave(servicios, obtenerPeriodo, compararPeriodo, reducirBySProm);

    nacional = unirVectores(bienes, servicios, unirBienesYServicios, sizeof(IPCPromedio));

    /*vectorEscribirATexto(nacional, ARCH_NACIONAL, parsearEscrPromedio);*/ /* Descomentar para grabar a memoria paso intermedio*/

    puts(FLUSH_TERMINAL);
    printf("---------------------------" COLOR_BYELLOW "Promedio IPC a nivel nacional por grupos" COLOR_RESET "---------------------------\n");
    printf(COLOR_BGRAY "%-*s\t" COLOR_RESET " | " COLOR_BGRAY "%-*s\t" COLOR_RESET " | " COLOR_BGRAY "%-*s\t" COLOR_RESET " | " COLOR_BGRAY "%-*s\t" COLOR_RESET "\n", DIVISIONES_PERIODO_LEN,"Periodo",DIVISIONES_REGION_LEN,"Region",DIVISIONES_INDICES_LEN,"Bienes",DIVISIONES_INDICES_LEN,"Servicios");
    puts(COLOR_BGRAY divisionTablaDivisiones COLOR_RESET);

    mostrarVector(nacional, mostrarPromedio);

    vectorDestruir(bienes);
    vectorDestruir(servicios);
    vectorDestruir(nacional);

    return EXITO;
}

int filtrarBienes(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;
    static char codsBien[5][3] = {"01", "02", "03", "05", "12"};
    int i;

    if(tmp->region[0] != 'N' || stringCmp(tmp->region, "Nacional")){
        return 0;
    }

    for(i = 0; i < 5; i++){
        if(tmp->cod[0] == codsBien[i][0] && tmp->cod[1] == codsBien[i][1] && tmp->cod[2] == '\0'){
            return 1;
        }
    }

    return 0;
}

int filtrarServicios(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;
    static char codsSer[7][3] = {"04", "06", "07", "08", "09", "10", "11"};
    int i;

    if(tmp->region[0] != 'N' || stringCmp(tmp->region, "Nacional")){
        return 0;
    }

    for(i = 0; i < 7; i++){
        if(tmp->cod[0] == codsSer[i][0] && tmp->cod[1] == codsSer[i][1] && tmp->cod[2] == '\0'){
            return 1;
        }
    }

    return 0;
}

void* obtenerPeriodo(void* elem)
{
    IPCDivisiones* tmp = elem;

    return tmp->periodo;
}

int compararPeriodo(void* lhs, void* rhs)
{
    char* i = lhs;
    char* j = rhs;

    return stringNCmp(i, j, DIVISIONES_PERIODO_LEN);
}

void* reducirBySProm(void* dato, void* acumulado)
{
    IPCDivisiones* tmp = dato;
    IPCDivisiones* tmpA = acumulado;

    stringNCopy(tmpA->cod, tmp->cod, DIVISIONES_COD_LEN);
    stringNCopy(tmpA->desc, tmp->desc, DIVISIONES_DESC_LEN);
    stringNCopy(tmpA->clasif, tmp->clasif, DIVISIONES_CLASIF_LEN);
    stringNCopy(tmpA->region, "Nacional", DIVISIONES_REGION_LEN);
    stringNCopy(tmpA->periodo, tmp->periodo, DIVISIONES_PERIODO_LEN);
    sprintf(tmpA->indiceIPC, "%0.6lf", atof(tmp->indiceIPC) + atof(tmpA->indiceIPC));

    return tmpA;
}

void* unirBienesYServicios(void* lhs, void* rhs, void* elem)
{
    IPCDivisiones* tmpL = lhs;
    IPCDivisiones* tmpR = rhs;
    IPCPromedio* tmp = elem;

    stringNCopy(tmp->fecha, tmpL->periodo, DIVISIONES_PERIODO_LEN);
    sprintf(tmp->indiceBienes, "%0.6lf", atof(tmpL->indiceIPC) / 5.0f);
    sprintf(tmp->indiceServicios, "%0.6lf", atof(tmpR->indiceIPC) / 7.0f);
    stringNCopy(tmp->region, "Nacional", DIVISIONES_REGION_LEN);

    return tmp;
}

void mostrarPromedio(void* reg)
{
    IPCPromedio* tmp = reg;

    printf(COLOR_BOLD COLOR_CYAN "%-*s\t" COLOR_RESET " | " COLOR_YELLOW "%-*s\t" COLOR_RESET " | " COLOR_GREEN "%-*s\t" COLOR_RESET " | " COLOR_RED "%-*s\t" COLOR_RESET "\n",
           DIVISIONES_PERIODO_LEN, tmp->fecha, DIVISIONES_REGION_LEN, tmp->region, DIVISIONES_INDICES_LEN, tmp->indiceBienes, DIVISIONES_INDICES_LEN,
           tmp->indiceServicios);
}

/** }@ */
