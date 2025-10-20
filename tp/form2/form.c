#include "graphics.h"

typedef struct Field_t{
    const char label[];

}Field_t;

typedef struct Form_t{
    const char title[];
    Field_t fields[];
    int fieldNum;
}Form_t;