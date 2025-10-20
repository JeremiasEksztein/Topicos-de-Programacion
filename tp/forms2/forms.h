#ifndef FORMS_H_INCLUDED
#define FORMS_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define FORM_TITLE_LEN 64
#define FORM_FIELDS_AMOUNT 256

// Field types
#define FIELD_TYPE_TEXT 1
#define FIELD_TYPE_NUMERIC 2
#define FIELD_TYPE_DATE 3
#define FIELD_TYPE_RADIO 4
#define FIELD_TYPE_CHECKBOX 5

// Field attributes
#define FIELD_ATTRIB_MIN
#define FIELD_ATTRIB_MAX
#define FIELD_ATTRIB_HINT

typedef struct Form_t *Form_t;
typedef struct Field_t *Field_t;

typedef struct Form_t {
    char title[FORM_TITLE_LEN];
    Field_t* fields[FORM_FIELDS_AMOUNT];
    int fieldNum;
} Form_t;

typedef struct Field_t {
    char label[FORM_TITLE_LEN];
    int type;
    char* buffer;

    // Additional attributes can be added here
} Field_t;

int formCreate(Form_t* form, const char* title);
int formSetTitle(Form_t* form, const char* title);
char* formGetTitle(Form_t* form);
int formSetFields(Form_t* form, Field_t** fields);
Field_t** formGetFields(Form_t* form);
int formGetFieldAmount(Form_t* form);
int formPost(Form_t* form);
int formDestroy(Form_t* form);

Field_t* fieldCreate(const char* label);
int fieldSetType(Field_t* field, int inputType);
int fieldGetType(const Field_t* field);
int fieldSetAttrib(Field_t* field, int attribType, char* value);
char* fieldGetAttrib(const Field_t* field, int attribType);
int fieldPrintAttrib(const Field_t* field, int attribType);
char* fieldGetBuffer(const Field_t* field);
int fieldDestroy(Field_t* field);

void printAttribList(void);

#endif // FORMS_H_INCLUDED