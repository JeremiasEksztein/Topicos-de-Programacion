/**
 *  @defgroup algoritmos
 *  @ingroup ModuloVector
 *  @{
 */

/** @file algoritmos.h 
 * @brief Header con distintos algoritmos sobre el TDA Vector. Inspirados en C++. */

#ifndef ALGORITMOS_H_INCLUDED
#define ALGORITMOS_H_INCLUDED

#include "vector.h"

/** @brief Transforma los elementos dentro del vector segun la funcion Transformar y el contexto otorgado, si lo hubiese.
 * @param vector Puntero al vector a transformar.
 * @param Transformar Puntero a una funcion con firma `int (*)(void*, void*)`.
 * La misma realiza la transformacion sobre el primer elemento, y obtiene el contexto del segundo.
 * @param contexto Puntero a informacion adicional que se le tenga que pasar a la transformacion.
 * @return Codigo de retorno de la funcion. */
int transformarVector(Vector_t* vector, int (*Transformar)(void* dato, void* contexto), void* contexto);

/** @brief Realiza una copia del vector, creando una nueva instancia en memoria.
 * @param vector Vector a copiar.
 * @return Puntero a una nueva instancia dinamica del vector.
 * @warning Es responsabilidad del usuario conservar el puntero retornado y liberar la memoria adecuadamente. */
Vector_t* copiarVector(Vector_t* vector);

/** @brief Realiza un mapeo de un vector a otro, creando una nueva instancia en memoria.
 * @param vector Vector a mapear.
 * @param Mapear Puntero a funcion con firma `void* (*)(void*, void*, void*)`.
 * La misma realiza el mapeo sobre el primer elemento, guarda los cambios en el segundo,
 * y recibe contexto adicional en el tercero.
 * @param n Tamaño del elemento mapeado en el nuevo vector instanciado.
 * @param contexto Puntero a informacion adicional que se le tenga que pasar al mapeo.
 * @return Puntero al nuevo vector mapeado.
 * @warning La funcion instancia dinamicamente un nuevo vector en memoria.
 * Es responsabilidad del usuario conservar el puntero y liberar la memoria adecuadamente. */
Vector_t* mapearVector(Vector_t* vector, void* (*Mapear)(void* dato, void* tmp, void* contexto), size_t n, void* contexto);

/** @brief Realiza un filtrado de un vector a otro, instanciado dinamicamente.
 * @param vector Vector a filtrar.
 * @param Filtrar Puntero a funcion con firma `int (*)(void*, void*)`.
 * Recibe el elemento a evaluar en el primer parametro y el contexto en el segundo.
 * @param contexto Puntero a informacion adicional que se le tenga que pasar al filtrado.
 * @return Puntero a un nuevo vector filtrado.
 * @warning La funcion instancia dinamicamente un nuevo vector en memoria.
 * Es responsabilidad del usuario conservar el puntero y liberar la memoria adecuadamente. */
Vector_t* filtrarVector(Vector_t* vector, int (*Filtrar)(void* dato, void* contexto), void* contexto);

/** @brief Realiza una reduccion de todos los elementos del vector a un unico elemento.
 * @param vector Vector a reducir.
 * @param Reducir Puntero a funcion con firma `void* (*)(void*, void*)`.
 * Recibe el elemento actual en el primer parametro y el acumulador en el segundo.
 * Retorna el acumulador actualizado.
 * @return Puntero al acumulador resultante. */
void* reducirVector(Vector_t* vector, void* (*Reducir)(void* dato, void* acumulado));

/** @brief Realiza una reduccion por claves, agrupando los elementos del vector por su clave.
 * @param vector Vector a reducir por claves.
 * @param ObtenerClave Funcion con firma `void* (*)(void*)`.
 * Recibe el elemento actual y retorna un puntero a la clave asociada.
 * @param CompararClave Funcion con firma `int (*)(void*, void*)`.
 * Retorna 0 si las claves son iguales, >0 si la primera es mayor o <0 si la segunda lo es.
 * @param Reducir Funcion con firma `void* (*)(void*, void*)`.
 * Aplica la reduccion sobre el primer parametro usando el segundo como acumulador.
 * @return Nuevo vector reducido por clave.
 * @warning La funcion instancia dinamicamente un vector en memoria.
 * Es responsabilidad del usuario conservar el puntero y liberar la memoria adecuadamente. */
Vector_t* reducirVectorPorClave(Vector_t* vector, void* (*ObtenerClave)(void* elem), int (*CompararClave)(void* lhs, void* rhs),void* (*Reducir)(void* elem, void* acumulado));

/** @brief Realiza la union entre dos vectores de igual tamaño y tipo.
 * @param lhs Vector izquierdo.
 * @param rhs Vector derecho.
 * @param Unir Funcion con firma `void* (*)(void*, void*, void*)`.
 * Recibe el elemento del vector izquierdo, el del derecho y el destino donde se guarda la union.
 * @param n Tamaño del elemento unido del nuevo vector instanciado.
 * @return Puntero al nuevo vector unido.
 * @warning La funcion instancia dinamicamente un vector en memoria.
 * Es responsabilidad del usuario conservar el puntero y liberar la memoria adecuadamente. */
Vector_t* unirVectores(Vector_t* lhs, Vector_t* rhs, void* (*Unir)(void* lhs, void* rhs, void* elem), size_t n);

#endif /* ALGORITMOS_H_INCLUDED */

/** @} */
