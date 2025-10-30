#ifndef ITERADOR_H_INCLUDED
#define ITERADOR_H_INCLUDED

#include "vector9.h"
#include <stddef.h>
#include <stdint.h>
#include <limits.h>

typedef struct{
    Vector_t* v;
    void* i;
    void* f;
    void* act;
}Iterador_t;

#define bool char
#define i8 char
#define i16 short
#define i32 int
#define i64 long
#define u8 unsigned char
#define u16 unsigned short
#define u32 unsigned
#define u64 unsigned long
#define f32 float
#define f64 double

i32 iteradorCrear(Iterador_t* iter, Vector_t* vec);
void* iteradorPrimero(Iterador_t* iter);
void* iteradorSiguiente(Iterador_t* iter);
i32 iteradorDestruir(Iterador_t* iter);
void* iteradorActual(Iterador_t* iter);
void* iteradorUltimo(Iterador_t* iter);
void* iteradorAnt(Iterador_t* iter);

#endif