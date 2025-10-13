#ifndef ALGORITMOS_H
#define ALGORITMOS_H

#include "vector.h"

int transformarVector(Vector_t* vector, int (*Transformar)(void* dato, void* contexto), void* contexto); //Transforma dentro del vector
Vector_t* copiarVector(Vector_t* vector); //Copia el vector
Vector_t* mapearVector(Vector_t* vector, void* (*Mapear)(void* dato, void* tmp, void* contexto), size_t n, void* contexto); //Mapea el vector a otro
Vector_t* filtrarVector(Vector_t* vector, int (*Filtrar)(void* dato, void* contexto), void* contexto); //Filtra elementos del vectora otro
void* reducirVector(Vector_t* vector, void* (*Reducir)(void* dato, void* acumulado)); //Reduce el vector a un unico elemento
Vector_t* reducirVectorPorClave(Vector_t* vector, void* (*ObtenerClave)(void* elem), int (*CompararClave)(void* lhs, void* rhs), void* (*Reducir)(void* elem, void* acumulado));
Vector_t* unirVectores(Vector_t* lhs, Vector_t* rhs, void* (*Unir)(void* lhs, void* rhs, void* elem), size_t n);

#endif