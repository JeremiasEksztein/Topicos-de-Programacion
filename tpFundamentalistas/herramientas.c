#include "herramientas.h"

int herramientaAjustarMontosIPCDivisiones(Vector_t* divs)
{
    Vector_t* tmp;
    RespuestaMontos ans/* = {.monto = 30000.0f, .region = "GBA", .periodoIni = "2022 - Diciembre", .periodoFin = "2024 - Enero"}*/;

    ans = preguntarAjustarMonto();
    //printf("Su seleccion: %lf | %s | %s | %s\n", ans.monto, ans.region, ans.periodoIni, ans.periodoFin);

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
    /*
    Formulario_t form;
    Entrada_t entrada[4];

    formularioCrear(&form, "Herramienta de monto ajustados por IPC");

    entradaCrear(&entrada[0], "Monto", "El monto a ajustar");
    entradaCrear(&entrada[1], "Region", "La region a evaluar");
    entradaCrear(&entrada[2], "Periodo de inicio", "Periodo de inicio del analisis");
    entradaCrear(&entrada[3], "Periodo de fin", "Periodo final del analisis");

    entradaSetGetTipo(&entrada[0], ENTRADA_TIPO_NUMERICO, &((EntradaNumerico){.min = 0, .max = 9999999.9f}));
    entradaSetGetTipo(&entrada[1], ENTRADA_TIPO_RADIO, &((EntradaRadio){.opciones = {"GBA", "Pampeana", "Noroeste", "Noreste", "Patagonia", "Cuyo"}, .cantOpciones = 6}));
    entradaSetGetTipo(&entrada[2], ENTRADA_TIPO_NUMERICO, &((EntradaNumerico){.min = 0, .max = 9999999.9f}));
    entradaSetGetTipo(&entrada[3], ENTRADA_TIPO_NUMERICO, &((EntradaNumerico){.min = 0, .max = 9999999.9f}));

    formularioSetGetEntradas(&form, entrada, 4);

    formularioPublicar(&form);

    ans.monto = atof(entradaRespuesta(&entrada[0]));

    stringNCopy(ans.region, entradaRespuesta(&entrada[1]), DIVISIONES_REGION_LEN);
    stringNCopy(ans.periodoIni, entradaRespuesta(&entrada[2]), DIVISIONES_PERIODO_LEN);
    stringNCopy(ans.periodoFin, entradaRespuesta(&entrada[3]), DIVISIONES_PERIODO_LEN);

    formularioDestruir(&form);
    entradaDestruir(&entrada[0]);
    entradaDestruir(&entrada[1]);
    entradaDestruir(&entrada[2]);
    entradaDestruir(&entrada[3]);

    */

    int tmp;

    do{
        printf("Ingrese monto para evaluar: ");
        scanf("%lf", &(ans.monto));
    }while(ans.monto <= 0);

    do{
        printf("Seleccione region de analisis: \n");
        printf("1 - GBA\n2 - Pampeana\n3 - Noroeste\n4 - Noreste\n5 - Cuyo\n6 - Patagonia\n");
        scanf("%d", &tmp);

        switch(tmp){
            case 1:
                stringNCopy(ans.region, "GBA", DIVISIONES_REGION_LEN);
                break;
            case 2:
                stringNCopy(ans.region, "Pampeana", DIVISIONES_REGION_LEN);
                break;
            case 3:
                stringNCopy(ans.region, "Noroeste", DIVISIONES_REGION_LEN);
                break;
            case 4:
                stringNCopy(ans.region, "Noreste", DIVISIONES_REGION_LEN);
                break;
            case 5:
                stringNCopy(ans.region, "Cuyo", DIVISIONES_REGION_LEN);
                break;
            case 6:
                stringNCopy(ans.region, "Patagonia", DIVISIONES_REGION_LEN);
                break;
            default:
                printf("Opcion invalida.\n");
        }

    }while(tmp < 1 || tmp > 6);

    flushStdin();

    printf("Ingrese periodo inicial (Mes - AAAA): ");
    scanString(ans.periodoIni, DIVISIONES_PERIODO_LEN);

    printf("Ingrese periodo final (Mes - AAAA): ");
    scanString(ans.periodoFin, DIVISIONES_PERIODO_LEN);

    /*
    scanf("%lf", &(ans.monto));

    flushStdin();

    scanString(ans.region, DIVISIONES_REGION_LEN);

    scanString(ans.periodoIni, DIVISIONES_PERIODO_LEN);

    scanString(ans.periodoFin, DIVISIONES_PERIODO_LEN);

    */

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

/*Ejercicio 6*/

int clasificarBySIPCDivisiones(Vector_t* divs)
{
    Vector_t* bienes;
    Vector_t* servicios;
    Vector_t* nacional;

    bienes = filtrarVector(divs, filtrarBienes, NULL);
    servicios = filtrarVector(divs, filtrarServicios, NULL);

    vectorEscribirATexto(bienes, ARCH_BIENES, parsearParaEscritura);
    vectorEscribirATexto(servicios, ARCH_SERVICIOS, parsearParaEscritura);

    bienes = reducirVectorPorClave(bienes, obtenerPeriodo, compararPeriodo, reducirBySProm);
    servicios = reducirVectorPorClave(servicios, obtenerPeriodo, compararPeriodo, reducirBySProm);

    nacional = unirVectores(bienes, servicios, unirBienesYServicios, sizeof(IPCPromedio));

    vectorEscribirATexto(nacional, ARCH_NACIONAL, parsearIPCPromedio);

    vectorDestruir(bienes);
    vectorDestruir(servicios);
    vectorDestruir(nacional);

    return EXITO;
}

int filtrarBienes(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;

    if((!stringCmp(tmp->cod, "01") || !stringCmp(tmp->cod, "02") || !stringCmp(tmp->cod, "03") || !stringCmp(tmp->cod, "05") || !stringCmp(tmp->cod, "12")) && stringCmp(tmp->region, "Nacional")){
            return 1;
    }

    return 0;
}

int filtrarServicios(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;

    if((!stringCmp(tmp->cod, "04") || !stringCmp(tmp->cod, "06") || !stringCmp(tmp->cod, "07") || !stringCmp(tmp->cod, "08") || !stringCmp(tmp->cod, "09") || !stringCmp(tmp->cod, "10") || !stringCmp(tmp->cod, "11")) && stringCmp(tmp->region, "Nacional")){
            return 1;
    }

    return 0;
}

int filtrarBienesDebug(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;

    if((!stringCmp(tmp->cod, "04") || !stringCmp(tmp->cod, "06") || !stringCmp(tmp->cod, "07") || !stringCmp(tmp->cod, "08") || !stringCmp(tmp->cod, "09") || !stringCmp(tmp->cod, "10") || !stringCmp(tmp->cod, "11")) && !stringCmp(tmp->region, "GBA")){
            return 1;
    }

    return 0;
}

int filtrarServiciosDebug(void* dato, void* contexto)
{
    IPCDivisiones* tmp = dato;

    if((!stringCmp(tmp->cod, "04") || !stringCmp(tmp->cod, "06") || !stringCmp(tmp->cod, "07") || !stringCmp(tmp->cod, "08") || !stringCmp(tmp->cod, "09") || !stringCmp(tmp->cod, "10") || !stringCmp(tmp->cod, "11")) || !stringCmp(tmp->region, "GBA")){
            return 1;
    }

    return 0;
}

void* obtenerPeriodo(void* elem)
{
    IPCDivisiones* tmp = elem;

    return tmp->periodo;
}

void* obtenerCod(void* elem)
{
    IPCDivisiones* tmp = elem;

    return tmp->cod;
}

int compararPeriodo(void* lhs, void* rhs)
{
    char* i = lhs;
    char* j = rhs;

    return stringNCmp(i, j, DIVISIONES_PERIODO_LEN);
}

int compararCodServicios(void* lhs, void* rhs)
{
    char* i = lhs;
    char* j = rhs;

    return (!filtrarServicios(i, NULL) && !filtrarServicios(j, NULL));
}

int compararCodBienes(void* lhs, void* rhs)
{
    char* i = lhs;
    char* j = rhs;

    return (!filtrarBienes(i, NULL) && !filtrarBienes(j, NULL));
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
    snprintf(tmpA->indiceIPC, DIVISIONES_INDICES_LEN, "%lf", atof(tmp->indiceIPC) + atof(tmpA->indiceIPC));

    return tmpA;
}

void* unirBienesYServicios(void* lhs, void* rhs, void* elem)
{
    IPCDivisiones* tmpL = lhs;
    IPCDivisiones* tmpR = rhs;
    IPCPromedio* tmp = elem;
    stringNCopy(tmp->fecha, tmpL->periodo, DIVISIONES_PERIODO_LEN);
    snprintf(tmp->indiceBienes, DIVISIONES_INDICES_LEN, "%lf", atof(tmpL->indiceIPC) / 30.0f);
    snprintf(tmp->indiceServicios, DIVISIONES_INDICES_LEN, "%lf", atof(tmpR->indiceIPC) / 42.0f);
    stringNCopy(tmp->region, "Nacional", DIVISIONES_REGION_LEN);

    return tmp;
}

int parsearIPCPromedio(FILE* arch, void* reg)
{
    IPCPromedio* i = reg;

    fprintf(arch, "%s | %s | %s | %s\n", i->fecha, i->region, i->indiceBienes, i->indiceServicios);

    return EXITO;
}

/*Ejercicio 9*/

int herramientaCalcularAlquilerIPCAperturas(Vector_t* aper)
{
    Vector_t* alquileres;
    RespuestaAlquileres tmp = {.monto = "30000", .periodo = "2024-09-01", .region = "GBA"};
    //RespuestaAlquileres tmp;
    char region[APERTURAS_REGION_LEN] = "";

    //tmp = preguntarAlquileres();

    alquileres = filtrarVector(aper, filtrarAlquileres, &tmp);

    stringNCopy(region, tmp.region, APERTURAS_REGION_LEN);
    snprintf(tmp.acumulado, APERTURAS_PERIODO_LEN, "%s", ((IPCAperturas*)vectorObtener(alquileres, 0))->indiceIPC);

    alquileres = mapearVector(alquileres, mapearAlquileres, sizeof(IPCAlquileres), &tmp);

    vectorEscribirATexto(alquileres, ARCH_ALQUILERES_CSV, parsearParaAlquileres);

    IPCAlquileres* tmpAlq = vectorObtener(alquileres, vectorCantElem(alquileres) - 1);
    printf("El alquiler original de $ %s a la fecha %s en la region %s, ha variado en un %% %s hacia un total ajustado de $ %s al periodo %s\n", tmp.monto, tmp.periodo, region, tmpAlq->acumuladoIPC, tmpAlq->montoAjustado, tmpAlq->periodo);
    mostrarVector(alquileres, mostrarAlquileres);

    vectorEscribirABinario(alquileres, ARCH_ALQUILERES_DAT);
    vectorLeerDeBinario(alquileres, ARCH_ALQUILERES_DAT);

    mostrarVector(alquileres, mostrarAlquileres);

    vectorDestruir(alquileres);

    return EXITO;
}

RespuestaAlquileres preguntarAlquileres(void)
{
    RespuestaAlquileres ans;

    int tmp;

    flushStdin();

    do{
        printf("Ingrese monto para evaluar: ");
        scanString(ans.monto, APERTURAS_INDICES_LEN);
    }while((atof(ans.monto)) <= 0);

    do{
        printf("Seleccione region de analisis: \n");
        printf("1 - GBA\n2 - Pampeana\n3 - Noroeste\n4 - Noreste\n5 - Cuyo\n6 - Patagonia\n");
        scanf("%d", &tmp);

        switch(tmp){
            case 1:
                stringNCopy(ans.region, "GBA", DIVISIONES_REGION_LEN);
                break;
            case 2:
                stringNCopy(ans.region, "Pampeana", DIVISIONES_REGION_LEN);
                break;
            case 3:
                stringNCopy(ans.region, "Noroeste", DIVISIONES_REGION_LEN);
                break;
            case 4:
                stringNCopy(ans.region, "Noreste", DIVISIONES_REGION_LEN);
                break;
            case 5:
                stringNCopy(ans.region, "Cuyo", DIVISIONES_REGION_LEN);
                break;
            case 6:
                stringNCopy(ans.region, "Patagonia", DIVISIONES_REGION_LEN);
                break;
            default:
                printf("Opcion invalida.\n");
        }

    }while(tmp < 1 || tmp > 6);

    flushStdin();

    printf("Ingrese periodo de inicio del contraro (AAAA-MM-DD): ");
    scanString(ans.periodo, DIVISIONES_PERIODO_LEN);

    printf("Su seleccion: %s | %s | %s\n", ans.monto, ans.region, ans.periodo);

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

    stringReplace(tmpD->region, '\r', '\0'); // Reemplazo el retorno de carro por caracter nulo

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

    stringNCopy(tmpT->periodo, tmpD->periodo, APERTURAS_PERIODO_LEN); //Guardo el periodo
    stringNCopy(tmpT->indiceIPC, tmpD->indiceIPC, APERTURAS_INDICES_LEN); // Guardo el indice

    snprintf(tmpT->acumuladoIPC, APERTURAS_INDICES_LEN, "%0.2lf", (atof(tmpD->indiceIPC) / atof(tmpC->acumulado) - 1) * 100.0f); //En periodo guardo el acumulado
    snprintf(tmpT->montoAjustado, APERTURAS_INDICES_LEN, "%0.2lf", atof(tmpC->monto) * (atof(tmpD->indiceIPC) / atof(tmpC->acumulado)));

    return tmpT;
}

void mostrarAlquileres(void* elem)
{
    IPCAlquileres* tmp = elem;

    printf("%s - %s - %s - %s\n", tmp->periodo, tmp->indiceIPC, tmp->acumuladoIPC, tmp->montoAjustado);
}

int parsearParaAlquileres(FILE* arch, void* reg)
{
    IPCAlquileres* tmp = reg;

    fprintf(arch, "%s | %s | %s | %s\n", tmp->periodo, tmp->indiceIPC, tmp->acumuladoIPC, tmp->montoAjustado);

    return 0;
}
