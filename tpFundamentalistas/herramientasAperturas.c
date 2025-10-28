/** @ingroup ModuloAperturas 
 * @{ */

/** @file herramientasAperturas.c
 * @brief Implementacion de herramientasAperturas.h */

#include "herramientasAperturas.h"

int herramientaCalcularAlquilerIPCAperturas(Vector_t* aper)
{
    Vector_t* alquileres;
    RespuestaAlquileres tmp;
    char region[APERTURAS_REGION_LEN] = "";

    tmp = preguntarAlquileres();

    alquileres = filtrarVector(aper, filtrarAlquileres, &tmp);

    stringNCopy(region, tmp.region, APERTURAS_REGION_LEN);
    snprintf(tmp.acumulado, APERTURAS_PERIODO_LEN, "%s", ((IPCAperturas*)vectorObtener(alquileres, 0))->indiceIPC);

    alquileres = mapearVector(alquileres, mapearAlquileres, sizeof(IPCAlquileres), &tmp);

    vectorEscribirATexto(alquileres, ARCH_ALQUILERES_CSV, parsearEscrAlquileres);

    IPCAlquileres* tmpAlq = vectorObtener(alquileres, vectorCantElem(alquileres) - 1);
    printf("El alquiler original de $ %s a la fecha %s en la region %s, ha variado en un %% %s hacia un total ajustado de $ %s al periodo %s\n", tmp.monto, tmp.periodo, region, tmpAlq->acumuladoIPC, tmpAlq->montoAjustado, tmpAlq->periodo);
    mostrarVector(alquileres, mostrarAlquileres);

    vectorEscribirABinario(alquileres, ARCH_ALQUILERES_DAT);
    vectorLeerDeBinario(alquileres, ARCH_ALQUILERES_DAT);

    printf("Contenidos del archivo binario\n");
    mostrarVector(alquileres, mostrarAlquileres);

    vectorDestruir(alquileres);

    return EXITO;
}

RespuestaAlquileres preguntarAlquileres(void)
{
    RespuestaAlquileres ans;

    Formulario_t f;
    char* regiones[APERTURAS_REGION_LEN] = {"GBA", "Pampeana", "Patagonia", "Cuyo", "Noroeste", "Noreste"};

    formularioInit(&f, "Calcular alquileres por inflacion");

    formularioAgregarCampoVA(&f, "Ingrese monto del alquiler", 1, CAMPO_TIPO_NUMERICO, 0.0f, 9999999.9f);
    formularioAgregarCampoVA(&f, "Seleccione region de analisis", 1, CAMPO_TIPO_OPCIONES, 6, regiones);
    formularioAgregarCampoVA(&f, "Ingrese periodo de inicio del contrato (AAAA-MM-DD)", 1, CAMPO_TIPO_TEXTO, APERTURAS_PERIODO_LEN);

    formularioPublicar(&f);

    stringNCopy(ans.monto, formularioRespuesta(&f, 0), APERTURAS_INDICES_LEN);
    stringNCopy(ans.region, formularioRespuesta(&f, 1), APERTURAS_REGION_LEN);
    stringNCopy(ans.periodo, formularioRespuesta(&f, 2), APERTURAS_PERIODO_LEN);

    printf("Su seleccion: %s | %s | %s\n", ans.monto, ans.region, ans.periodo);

    formularioDestruir(&f);

    return ans;
}

int filtrarAlquileres(void* dato, void* contexto)
{
    IPCAperturas* tmpD = dato;
    RespuestaAlquileres* tmpC = contexto;

    int d, m, a, t;

    sscanf(tmpC->periodo, "%d-%d-%d\n", &a, &m, &d);

    a *= 10000;
    m *= 100;
    t = a + m + d;

    sscanf(tmpD->periodo, "%d-%d-%d\n", &a, &m, &d);

    a *= 10000;
    m *= 100;

    t = t - a - m - d;

    stringReplace(tmpD->region, '\r', '\0'); /* Reemplazo el retorno de carro por caracter nulo */

    if(!stringCmp(tmpD->cod, "04.1.1") && !stringCmp(tmpC->region, tmpD->region) && (t <= 0)){
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

    snprintf(tmpT->acumuladoIPC, APERTURAS_INDICES_LEN, "%0.2lf", (atof(tmpD->indiceIPC) / atof(tmpC->acumulado) - 1) * 100.0f); /*En periodo guardo el acumulado */
    snprintf(tmpT->montoAjustado, APERTURAS_INDICES_LEN, "%0.2lf", atof(tmpC->monto) * (atof(tmpD->indiceIPC) / atof(tmpC->acumulado)));

    return tmpT;
}

void mostrarAlquileres(void* elem)
{
    IPCAlquileres* tmp = elem;

    printf("%s - %s - %s - %s\n", tmp->periodo, tmp->indiceIPC, tmp->acumuladoIPC, tmp->montoAjustado);
}

/** }@ */
