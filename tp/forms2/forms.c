#include "forms.h"

typedef struct Attribute{
    char name[FIELD_ATTRIB_NAME_LEN];
    char value[FIELD_ATTRIB_VALUE_LEN];
}Attribute;

typedef struct Field_t{
    const char label[FIELD_LABEL_LEN];
    char* buffer;
    int fieldType;
    Attribute fieldAttributes[FIELD_ATTRIB_AMOUNT];
}Field_t;

typedef struct Form_t{
    const char title[FORM_TITLE_LEN];
    Field_t fields[FORM_FIELDS_AMOUNT];
    //Field_t* fields;
    //int fieldsCap;
    int fieldAmount;
}Form_t;

