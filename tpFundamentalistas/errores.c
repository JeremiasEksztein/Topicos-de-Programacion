/** @ingroup ModuloComunes
 * @{ */

/** @file errores.c
 * @brief Implementacion de errores.h */

#include "errores.h"

int logError(int cod, char* file, int line, char* date, char* time, char* func)
{
    char mensaje[50];
    switch(cod){
        case EXITO:
            return EXITO;
        case ERR_PUNTERO_NULO:
            stringCopy(mensaje, "Error con operacion con punteros dinamicos.");
            break;
        case ERR_SIN_MEM:
            stringCopy(mensaje, "Error al alocar memoria dinamica.");
            break;
        case ERR_ARCH:
            stringCopy(mensaje, "Error al abrir archivo.");
            break;
        case ERR_BUFFER_CORTO:
            stringCopy(mensaje, "Error en la lectura de archivo. Buffer de lectura demasiado corto.");
            break;
        case ERR_REGISTRO:
            stringCopy(mensaje, "Error en la lectura de archivo. Registro corrompido.");
            break;
        case ERR_USUARIO:
            stringCopy(mensaje, "Error en el ingreso de informacion.");
            break;
        case ERR_ARGS:
            stringCopy(mensaje, "Error el pasaje de argumentos a main");
            break;
        default:
            stringCopy(mensaje, "Error en la funcion de error. Muy mal.");
            cod = 90;
    }

    FILE* fp = fopen("errorlog.txt", "at+");

    /*fprintf(fp, "%d | %s:%d | %s | %s | %s | %s\n", cod, file, line, __DATE__, __TIME__, func, mensaje); */

    fprintf(fp, "Error codigo: %d; En archivo: %s:%d; Compilado en la fecha %s a la hora %s; en funcion: %s()\n%s\n",cod, file, line, date, time, func, mensaje);

    fclose(fp);

    if(cod == 90){
        abort();
    }

    return EXITO;
}

/** }@ */
