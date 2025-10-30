/** @ingroup ModuloAperturas
 * @{ */

/** @file herramientasAperturas.c
 * @brief Implementacion de herramientasAperturas.h */

#include "herramientasAperturas.h"

#define divisionParaTitulo "-------------------------------------------------------------------------------------------------"

int herramientaCalcularAlquilerIPCAperturas(Vector_t* aper)
{
    Vector_t* alquileres;
    RespuestaAlquileres tmp;
    char region[APERTURAS_REGION_LEN] = "";

    tmp = preguntarAlquileres();

    alquileres = filtrarVector(aper, filtrarAlquileres, &tmp);

    stringNCopy(region, tmp.region, APERTURAS_REGION_LEN);
    sprintf(tmp.acumulado, "%s", ((IPCAperturas*)vectorObtener(alquileres, 0))->indiceIPC);

    alquileres = mapearVector(alquileres, mapearAlquileres, sizeof(IPCAlquileres), &tmp);

    /*vectorEscribirATexto(alquileres, ARCH_ALQUILERES_CSV, parsearEscrAlquileres);*/ /*Descomentar para ver contenidos*/

    IPCAlquileres* tmpAlq = vectorObtener(alquileres, vectorCantElem(alquileres) - 1);
    puts(FLUSH_TERMINAL);
    printf("El alquiler original de " COLOR_BCYAN "$%s" COLOR_RESET " a la fecha " COLOR_BCYAN  "%s" COLOR_RESET
            " en la region " COLOR_BCYAN "%s" COLOR_RESET ", ha variado en un " COLOR_BYELLOW "%%%s" COLOR_RESET
            " hacia un total ajustado de " COLOR_BYELLOW "$%s" COLOR_RESET " al periodo " COLOR_BCYAN "%s" COLOR_RESET "\n",
            tmp.monto, tmp.periodo, region, tmpAlq->acumuladoIPC, tmpAlq->montoAjustado, tmpAlq->periodo);

    esperarInput();

    puts(FLUSH_TERMINAL);
    printf(COLOR_BOLD "%-*s\t" " | " "%-*s\t" " | " "%-*s\t" " | " "%-*s" COLOR_RESET "\n", APERTURAS_PERIODO_LEN, "Periodo", APERTURAS_INDICES_LEN, "Indice", APERTURAS_INDICES_LEN, "Variacion%", APERTURAS_INDICES_LEN, "Monto ajustado");
    puts(COLOR_BGRAY divisionParaTitulo COLOR_RESET);

    mostrarVector(alquileres, mostrarAlquileres);

    esperarInput();

    vectorEscribirABinario(alquileres, ARCH_ALQUILERES_DAT);
    vectorLeerDeBinario(alquileres, ARCH_ALQUILERES_DAT);

    puts(FLUSH_TERMINAL);
    printf(COLOR_BOLD "Contenidos del archivo binario\n" COLOR_RESET);
    printf(COLOR_BOLD "%-*s\t" " | " "%-*s\t" " | " "%-*s\t" " | " "%-*s" COLOR_RESET "\n", APERTURAS_PERIODO_LEN, "Periodo", APERTURAS_INDICES_LEN, "Indice", APERTURAS_INDICES_LEN, "Variacion%", APERTURAS_INDICES_LEN, "Monto ajustado");
    puts(COLOR_BGRAY divisionParaTitulo COLOR_RESET);
    mostrarVector(alquileres, mostrarAlquileres);

    esperarInput();

    vectorDestruir(alquileres);

    return EXITO;
}

RespuestaAlquileres preguntarAlquileres(void)
{
    RespuestaAlquileres ans;

    Formulario_t f;
    char* regiones[APERTURAS_REGION_LEN] = {"Nacional", "GBA", "Pampeana", "Cuyo", "Noroeste", "Noreste", "Patagonia"};

    formularioInit(&f, "Calcular alquileres por inflacion");

    formularioAgregarCampoVA(&f, "Ingrese monto del alquiler ($)", 1, CAMPO_TIPO_NUMERICO, 0.0f, 9999999.9f);
    formularioAgregarCampoVA(&f, "Seleccione region de analisis", 1, CAMPO_TIPO_OPCIONES, 6, regiones);
    formularioAgregarCampoVA(&f, "Ingrese periodo de inicio del contrato (AAAA-MM)", 1, CAMPO_TIPO_TEXTO, APERTURAS_PERIODO_LEN, validarFechaForm, convertirFechaResAper);

    formularioPublicar(&f);

    stringNCopy(ans.monto, formularioRespuesta(&f, 0), APERTURAS_INDICES_LEN);
    stringNCopy(ans.region, formularioRespuesta(&f, 1), APERTURAS_REGION_LEN);
    stringNCopy(ans.periodo, formularioRespuesta(&f, 2), APERTURAS_PERIODO_LEN);

    formularioDestruir(&f);

    return ans;
}

char* convertirFechaResAper(char* ans)
{
    stringCat(ans, "-01");
    return ans;
}

int filtrarAlquileres(void* dato, void* contexto)
{
    IPCAperturas* tmpD = dato;
    RespuestaAlquileres* tmpC = contexto;

    int fechaAct;
    static int fechaIni = 0;

    if(fechaIni == 0){
        fechaIni = tmpC->periodo[5] * 10 + tmpC->periodo[6] - 11 * '0';
        fechaIni += tmpC->periodo[0] * 100000 + tmpC->periodo[1] * 10000 + tmpC->periodo[2] * 1000 + tmpC->periodo[3] * 100 - 111100 * '0';
    }

    fechaAct = tmpD->periodo[5] * 10 + tmpD->periodo[6] - 11 * '0';
    fechaAct += tmpD->periodo[0] * 100000 + tmpD->periodo[1] * 10000 + tmpD->periodo[2] * 1000 + tmpD->periodo[3] * 100 - 111100 * '0';

    if(!stringCmp(tmpD->cod, "04.1.1") && !stringCmp(tmpC->region, tmpD->region) && (fechaIni <= fechaAct)){
        return 1;
    }

    return 0;
}

void* mapearAlquileres(void* dato, void* tmp, void* contexto)
{
    IPCAperturas* tmpD = dato;
    IPCAlquileres* tmpT = tmp;
    RespuestaAlquileres* tmpC = contexto;

    stringNCopy(tmpT->periodo, tmpD->periodo, APERTURAS_PERIODO_LEN); /*Guardo el periodo */
    stringNCopy(tmpT->indiceIPC, tmpD->indiceIPC, APERTURAS_INDICES_LEN); /* Guardo el indice */

    sprintf(tmpT->acumuladoIPC, "%0.2lf", (atof(tmpD->indiceIPC) / atof(tmpC->acumulado) - 1) * 100.0f);
    sprintf(tmpT->montoAjustado, "%0.2lf", atof(tmpC->monto) * (atof(tmpD->indiceIPC) / atof(tmpC->acumulado)));

    return tmpT;
}

void mostrarAlquileres(void* elem)
{
    IPCAlquileres* tmp = elem;

    printf(COLOR_BOLD COLOR_CYAN "%-*s\t" COLOR_GRAY " | " COLOR_CYAN "%-*s\t" COLOR_GRAY " | " COLOR_CYAN "%-*s\t" COLOR_GRAY " | " COLOR_CYAN "%-*s\n" COLOR_RESET, APERTURAS_PERIODO_LEN, tmp->periodo, APERTURAS_INDICES_LEN, tmp->indiceIPC, APERTURAS_INDICES_LEN, tmp->acumuladoIPC, APERTURAS_INDICES_LEN, tmp->montoAjustado);
}

/** }@ */
