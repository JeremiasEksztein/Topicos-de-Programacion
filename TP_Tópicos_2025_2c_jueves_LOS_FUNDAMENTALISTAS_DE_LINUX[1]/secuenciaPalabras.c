/** @ingroup ModuloSecuenciaPalabras
 * @{ */

/** @file secuenciaPalabras.c
 * @brief Implementacion de secuenciaPalabras.h */

#include "secuenciaPalabras.h"

int secuenciaPalabrasCrear(SecuenciaPalabras_t* sec, char* cadena)
{
    sec->cadena = cadena;
    sec->finDeCadena = 0;

    return EXITO;
}

int secuenciaPalabrasLeer(SecuenciaPalabras_t* sec, Palabra_t* pal)
{
    while(*(sec->cadena) != '\0' && !isprint(*(sec->cadena))){
        (sec->cadena)++;
    }

    if(*(sec->cadena) == '\0'){
        sec->finDeCadena = 1;
        return 0;
    }

    char* tmp = pal->cadena;

    do{
        *tmp = *(sec->cadena);
        tmp++;
        (sec->cadena)++;
    }while(*(sec->cadena) != '\0' && isprint(*(sec->cadena)));

    *tmp = '\0';

    return 1;
}

int secuenciaPalabrasEscribir(SecuenciaPalabras_t* sec, Palabra_t* pal)
{
    char* tmp = pal->cadena;

    while(*tmp){
        *(sec->cadena) = *tmp;
        (sec->cadena)++;
        tmp++;
    }

    return EXITO;
}

int secuenciaPalabrasEscribirCaract(SecuenciaPalabras_t* sec, int ch)
{
    *(sec->cadena) = ch;
    (sec->cadena)++;
    return EXITO;
}

int secuenciaPalabrasCerrar(SecuenciaPalabras_t* sec)
{
    *(sec->cadena) = '\0';

    return 1;
}

int secuenciaPalabrasEsFin(SecuenciaPalabras_t* sec)
{
    return sec->finDeCadena;
}

int esLetra(int ch)
{
    return ((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z'));
}

int palabraModificar(Palabra_t* pal, void (*Modificar)(char*))
{
    if(Modificar == NULL){
        return 0;
    }

    Modificar(pal->cadena);

    return 1;
}

void palabraMostrar(Palabra_t* pal)
{
    puts(pal->cadena);
}

void palabraATitulo(char* pal)
{
    char* i = pal;

    *i = toUpper(*i);
    i++;

    while(*i){
        *i = toLower(*i);
        i++;
    }

}

void palabraAMinuscula(char* pal)
{
    char* i = pal;

    while(*i){
        *i = toLower(*i);
        i++;
    }
}

/** }@ */
