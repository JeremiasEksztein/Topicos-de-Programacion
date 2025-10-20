#include "form.h"
#include <stdio.h>
#include <string.h>

#define FIELD_ATTRIB_NAME_LEN 32
#define FIELD_BUFFER_LEN 256

#define FIELD_ATTRIB_MIN_POS 0
#define FIELD_ATTRIB_MAX_POS 1
#define FIELD_ATTRIB_MAX_LEN_POS 2
#define FIELD_ATTRIB_OPTIONS_POS 3
#define FIELD_ATTRIB_HINT_POS 4
#define FIELD_ATTRIB_MIN_CHECK_POS 5
#define FIELD_ATTRIB_MAX_CHECK_POS 6

#define COLOR_RESET   "\033[0m"
#define COLOR_BOLD    "\033[1m"
#define COLOR_DIM     "\033[2m"
#define COLOR_RED     "\033[1;31m"
#define COLOR_YELLOW  "\033[1;33m"
#define COLOR_CYAN    "\033[1;36m"
#define COLOR_GRAY    "\033[0;37m"

static char attribNames[FIELD_ATTRIB_AMOUNT][FIELD_ATTRIB_NAME_LEN] = {
    "min",
    "max",
    "maxlen",
    "options",
    "hint",
    "mincheck",
    "maxcheck"
};

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

int clearScreen(void);
void printTitle(const char* title);

int askField(Field_t* field);
int renderField(Field_t* field);

int readRadio(Field_t* field);
int readChecklist(Field_t* field);
int readInt(Field_t* field);
int readNumeric(Field_t* field);
int readText(Field_t* field);

int readDate(Field_t* field);
int validateDate(int a, int m, int d);

int clearScreen(void)
{
    printf("\033[H\033[J");
}

void printTitle(const char* title)
{
    printf("+%.*s+\n", FORM_TITLE_LEN + 2, "--------------------------------");
    printf("| %s |\n", title);
    printf("+%.*s+\n", FORM_TITLE_LEN + 2, "--------------------------------");
    printf("\n");
}

int askField(Field_t* field)
{
    renderField(field);

    switch(field->fieldType){
        case FIELD_TYPE_RADIO:
            readRadio(field);
            break;
        case FIELD_TYPE_CHECKLIST:
            readChecklist(field);
            break;
        case FIELD_TYPE_INT:    
            readInt(field);
            break;
        case FIELD_TYPE_NUMERIC:
            readNumeric(field);
            break;
        case FIELD_TYPE_TEXT:
            readText(field);
            break;
        case FIELD_TYPE_DATE:
            readDate(field);
            break;
        default:    
            return -1;
    }

    return 0;
}

int renderField(Field_t* field)
{
    printf(COLOR_BOLD "%s" COLOR_RESET, field->label);

    printf()

    //Render the fields information

    

}

Form_t* formCreate(const char* title)
{
    if(!title){
        return NULL;
    }

    Form_t* form = malloc(sizeof(Form_t));

    if(!form){
        return NULL;
    }

    form->fieldAmount = 0;
    strncpy(form->title, title, FORM_TITLE_LEN);
    
    return form;
}

int formSetTitle(Form_t* form, const char* title)
{
    if(!form || !title){
        return -1;
    }

    return (strncpy(form->title, title, FORM_TITLE_LEN)) ? 0 : 1;
}

char* formGetTitle(Form_t* form)
{
    if(!form){
        return NULL;
    }

    return form->title;
}

Field_t* formGetFields(Form_t* form)
{
    if(!form || !form->fieldAmount){
        return NULL;
    }

    return form->fields;
}

int formGetFieldAmount(Form_t* form)
{
    if(!form){
        return -1;
    }

    return form->fieldAmount;
}

int formPost(Form_t* form)
{
    Field_t* f = form->fields;
    int ult = form->fieldAmount;

    for(int i = 0; i < ult; i++){
        clearScreen();
        printTitle(form->title);
        askField(&(f[i]));
    }

    return 0;
}

int formDestroy(Form_t* form)
{
    free(form);

    return 0;
}

Field_t* fieldCreate(const char* label)
{
    if(!label){
        return NULL;
    }

    Field_t* field = malloc(sizeof(Field_t));

    if(!field){
        return NULL;
    }
    

    strncpy(field->label, label, FIELD_LABEL_LEN);
    field->fieldType = FIELD_TYPE_DEFAULT;
    memset(field->fieldAttributes, '\0', sizeof(Attribute) * FIELD_ATTRIB_AMOUNT);
    
    char* buffer = malloc(FIELD_BUFFER_LEN);

    if(!buffer){
        free(field);
        return NULL;
    }

    field->buffer = buffer;

    return field;
}

int fieldSetType(Field_t* field, int inputType)
{
    if(!field){
        return -1;
    }

    field->fieldType = inputType;

    return 0;
}

int fieldGetType(const Field_t* field)
{
    if(!field){
        return -1;
    }

    return field->fieldType;
}

int fieldSetAttrib(Field_t* field, int attribType, char* value)
{
    if(!field || !value){
        return -1;
    }

    Attribute* attribs = field->fieldAttributes;
    char* err;

    //User has the responsibility to not fuck up the value they enter

    switch(attribType){
        case FIELD_ATTRIB_MIN:
            err = strncpy(attribs[FIELD_ATTRIB_MIN_POS].value, value, FIELD_ATTRIB_VALUE_LEN);
            break;
        case FIELD_ATTRIB_MAX:
            err = strncpy(attribs[FIELD_ATTRIB_MAX_POS].value, value, FIELD_ATTRIB_VALUE_LEN);
            break;
        case FIELD_ATTRIB_MAX_LEN:
            err = strncpy(attribs[FIELD_ATTRIB_MAX_LEN_POS].value, value, FIELD_ATTRIB_VALUE_LEN);
            break;
        case FIELD_ATTRIB_OPTIONS:
            err = strncpy(attribs[FIELD_ATTRIB_OPTIONS_POS].value, value, FIELD_ATTRIB_VALUE_LEN);
            break;
        case FIELD_ATTRIB_HINT:
            err = strncpy(attribs[FIELD_ATTRIB_HINT_POS].value, value, FIELD_ATTRIB_VALUE_LEN);
            break;
        case FIELD_ATTRIB_MIN_CHECK:
            err = strncpy(attribs[FIELD_ATTRIB_MIN_CHECK_POS].value, value, FIELD_ATTRIB_VALUE_LEN);
            break;
        case FIELD_ATTRIB_MAX_CHECK:
            err = strncpy(attribs[FIELD_ATTRIB_MAX_CHECK_POS].value, value, FIELD_ATTRIB_VALUE_LEN);
            break;
        default:
    }

    return err ? 0 : 1;
}

char* fieldGetAttrib(const Field_t* field, int attribType)
{
    if(!field){
        return NULL;
    }

    Attribute* attribs = field->fieldAttributes;

    switch(attribType){
        case FIELD_ATTRIB_MIN:
            return attribs[FIELD_ATTRIB_MIN_POS].value;
        case FIELD_ATTRIB_MAX:
            return attribs[FIELD_ATTRIB_MAX_POS].value;
        case FIELD_ATTRIB_MAX_LEN:
            return attribs[FIELD_ATTRIB_MAX_LEN_POS].value;
        case FIELD_ATTRIB_OPTIONS:
            return attribs[FIELD_ATTRIB_OPTIONS_POS].value;
        case FIELD_ATTRIB_HINT:
            return attribs[FIELD_ATTRIB_HINT_POS].value;
        case FIELD_ATTRIB_MIN_CHECK:
            return attribs[FIELD_ATTRIB_MIN_CHECK_POS].value;
        case FIELD_ATTRIB_MAX_CHECK:
            return attribs[FIELD_ATTRIB_MAX_CHECK_POS].value;
        default:
    }

    return NULL;
}

int fieldPrintAttrib(const Field_t* field, int attribType)
{
    if(!field){
        return -1;
    }

    printf("attribs: %s - value: %s\n", attribNames[attribType], (field->fieldAttributes)[attribType]);

    return 0;
}

char* fieldGetBuffer(const Field_t* field)
{
    if(!field){
        return NULL;
    }

    return field->buffer;
}

int fieldDestroy(Field_t* field)
{
    if(!field){
        return -1;
    }

    free(field->buffer);
    free(field);

    return 0;
}

void printAttribList(void)
{
    for(int i = 0; i < FIELD_ATTRIB_AMOUNT; i++){
        printf("(%d) - %s\n", i + 1, attribNames[i]);
    }
}






