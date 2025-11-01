/** @ingroup ModuloAperturas
 * @{ */

/** @file parseoAperturas.c
 * @brief Implementacion de parseoAperturas.c */

#include "parseoAperturas.h"

int parsearYCorregirIPCAperturas(char* buffer, void* reg)
{
    IPCAperturas* tmp = reg;
    char* i = NULL;

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

    corregirFormatoFechaAperturas(tmp);
    stringReplace(tmp->desc, '.', ',');


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

/** }@ */
