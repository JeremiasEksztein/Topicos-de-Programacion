/** @ingroup ModuloDivisiones
 * @{ */

/** @file herramientasDivisiones.c
 * @brief Implementacion de herramientasDivisiones.h */

#include "herramientasDivisiones.h"

int herramientaAjustarMontosIPCDivisiones(Vector_t* divs)
{
    Vector_t* tmp;
    RespuestaMontos ans;

    ans = preguntarAjustarMonto();

    tmp = filtrarVector(divs, filtrarIPCDivisiones, &ans);

    if(!tmp || tmp->cantElem < 2){
        printf("No se encontraron registros que coincidan con los parametros ingresados.\n");
        return ERR_USUARIO;
    }

    IPCDivisiones* i = vectorObtener(tmp, 0);
    IPCDivisiones* f = vectorObtener(tmp, 1);

    double varPor = ((atof(f->indiceIPC) / atof((i->indiceIPC))) - 1.0f) * 100.0f;
    double montoAjus = ans.monto + (ans.monto * varPor / 100.0f);

    printf("El monto $ %0.2lf en la region %s durante %s, ajustado en la misma region al %s vario en un %%%0.1lf a un total de $ %0.1lf\n", ans.monto, ans.region, ans.periodoIni, ans.periodoFin, varPor, montoAjus);

    vectorDestruir(tmp);

    return EXITO;
}

RespuestaMontos preguntarAjustarMonto(void)
{
    RespuestaMontos ans;

    Formulario_t form;
    char* regiones[DIVISIONES_REGION_LEN] = {"GBA", "Pampeana", "Patagonia", "Cuyo", "Noroeste", "Noreste"};

    formularioInit(&form, "Ajustar montos por IPC");
    formularioAgregarCampoVA(&form, "Monto a ajustar", 1, CAMPO_TIPO_NUMERICO, 0.0f, 9999999.9f);
    formularioAgregarCampoVA(&form, "La region a evaluar", 1, CAMPO_TIPO_OPCIONES, 6, regiones);
    formularioAgregarCampoVA(&form, "Periodo de inicio (Mes - AAAA)", 1, CAMPO_TIPO_TEXTO, DIVISIONES_PERIODO_LEN);
    formularioAgregarCampoVA(&form, "Periodo de fin (Mes - AAAA)", 1, CAMPO_TIPO_TEXTO, DIVISIONES_PERIODO_LEN);

    formularioPublicar(&form);

    ans.monto = atof(formularioRespuesta(&form, 0));
    stringNCopy(ans.region, formularioRespuesta(&form, 1), DIVISIONES_REGION_LEN);
    stringNCopy(ans.periodoIni, formularioRespuesta(&form, 2), DIVISIONES_PERIODO_LEN);
    stringNCopy(ans.periodoFin, formularioRespuesta(&form, 3), DIVISIONES_PERIODO_LEN);

    printf("Su seleccion: %lf | %s | %s | %s\n", ans.monto, ans.region, ans.periodoIni, ans.periodoFin);

    return ans;
}

int filtrarIPCDivisiones(void* dato, void* contexto)
{
    IPCDivisiones* tmpD = dato;
    RespuestaMontos* tmpC = contexto;

    if((!stringCmp(tmpD->periodo, tmpC->periodoIni) || !stringCmp(tmpD->periodo, tmpC->periodoFin)) && !stringCmp(tmpD->region, tmpC->region) && !stringCmp(tmpD->desc, "Nivel general")){
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

    vectorEscribirATexto(bienes, ARCH_BIENES, parsearEscrDivisiones);
    vectorEscribirATexto(servicios, ARCH_SERVICIOS, parsearEscrDivisiones);

    bienes = reducirVectorPorClave(bienes, obtenerPeriodo, compararPeriodo, reducirBySProm);
    servicios = reducirVectorPorClave(servicios, obtenerPeriodo, compararPeriodo, reducirBySProm);

    nacional = unirVectores(bienes, servicios, unirBienesYServicios, sizeof(IPCPromedio));

    vectorEscribirATexto(nacional, ARCH_NACIONAL, parsearEscrPromedio);

    vectorDestruir(bienes);
    vectorDestruir(servicios);
    vectorDestruir(nacional);

    return EXITO;
}

int filtrarBienes(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;

    if((!stringCmp(tmp->cod, "01") || !stringCmp(tmp->cod, "02") || !stringCmp(tmp->cod, "03") || !stringCmp(tmp->cod, "05") || !stringCmp(tmp->cod, "12")) && !stringCmp(tmp->region, "Nacional")){
            return 1;
    }

    return 0;
}

int filtrarServicios(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;

    if((!stringCmp(tmp->cod, "04") || !stringCmp(tmp->cod, "06") || !stringCmp(tmp->cod, "07") || !stringCmp(tmp->cod, "08") || !stringCmp(tmp->cod, "09") || !stringCmp(tmp->cod, "10") || !stringCmp(tmp->cod, "11")) && !stringCmp(tmp->region, "Nacional")){
            return 1;
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
    snprintf(tmpA->indiceIPC, DIVISIONES_INDICES_LEN, "%f", atof(tmp->indiceIPC) + atof(tmpA->indiceIPC));

    return tmpA;
}

void* unirBienesYServicios(void* lhs, void* rhs, void* elem)
{
    IPCDivisiones* tmpL = lhs;
    IPCDivisiones* tmpR = rhs;
    IPCPromedio* tmp = elem;
    stringNCopy(tmp->fecha, tmpL->periodo, DIVISIONES_PERIODO_LEN);
    snprintf(tmp->indiceBienes, DIVISIONES_INDICES_LEN, "%lf", atof(tmpL->indiceIPC) / 5.0f);
    snprintf(tmp->indiceServicios, DIVISIONES_INDICES_LEN, "%lf", atof(tmpR->indiceIPC) / 7.0f);
    stringNCopy(tmp->region, "Nacional", DIVISIONES_REGION_LEN);

    return tmp;
}

/** }@ */
