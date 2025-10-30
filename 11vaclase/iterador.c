#include "iterador.h"

i32 iteradorCrear(Iterador_t* iter, Vector_t* vec)
{
    if(!iter || !vec){
        return 1;
    }

    iter->act = vec->data;
    iter->f = vec->data + vec->cantElem * vec->tamElem;
    iter->i = vec->data;
    iter->v = vec;
    return 0;
}


