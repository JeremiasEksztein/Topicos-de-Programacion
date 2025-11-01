/** @ingroup ModuloDivisiones
 * @{ */

/** @file parseoDivisiones.c
 * @brief Implementacion de parseoDivisiones.h */

#include "parseoDivisiones.h"

int parsearYCorregirIPCDivisiones(char* buffer, void* reg)
{
    IPCDivisiones* tmp = reg;
    char* i = NULL;
    static int decodificador[10] = {'4', '6', '8', '7', '1', '9', '5', '0', '3', '2'}; /* tal vez para el digito 5 le corresponde un 9 */

    stringRemove(buffer, '"');
    stringReplace(buffer, ',', '.');

    if(!(i = stringRChar(buffer, '\n'))){
        if(!(i = stringRChar(buffer, EOF))){
            return ERR_BUFFER_CORTO;
        }
    }

    *i = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->periodo, i, DIVISIONES_PERIODO_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->region, i, DIVISIONES_REGION_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->varAnualIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
    }

    ++i;
    stringNCopy(tmp->varMensIPC, i, DIVISIONES_INDICES_LEN);
    *(--i) = '\0';

    if(!(i = stringRChar(buffer, ';'))){
        return ERR_REGISTRO;
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

    decodificarFechaDivisiones(tmp, decodificador);
    convertirFechaDivisiones(tmp);
    normalizarDescripcionDivisiones(tmp);
    stringReplace(tmp->desc, '.', ',');

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

    sprintf(reg->periodo, "%s - %s", meses[mes - 1], a);

    return EXITO;
}

int normalizarDescripcionDivisiones(IPCDivisiones* reg)
{
    char* i = reg->desc;

	*i = toUpper(*i);

	i++;
	while (*i) {
		if (isAlpha(*i)) {
			*i = toLower(*i);
		}
		++i;
	}
	return EXITO;

}

/** }@ */
