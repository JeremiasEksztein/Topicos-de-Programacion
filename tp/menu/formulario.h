#ifndef FORMULARIO_H
#define FORMULARIO_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define FORM_TITLE_LEN 64
#define FORM_RESPONSE_LEN 64
#define INPUT_LABEL_LEN 256
#define FORM_INPUT_AMOUNT 256

#define INPUT_TYPE_RADIO 10 //Input radio information
#define INPUT_TYPE_CHECKLIST 11 //Input checklist information
#define INPUT_TYPE_TEXT 12 //Input text information
#define INPUT_TYPE_DATE 13 //Input date information
#define INPUT_TYPE_NUMERIC 14 //Input numeric information
#define INPUT_TYPE_SUBMIT 15 //Special input type, to finalize the form
#define INPUT_TYPE_RETURN 16 //Special input type, to allow for mistakes, very difficult to do

//It only makes sense for this to support radio, checkbox, text, numeric and date inputs, with added information for ranges, verifications, etc.

typedef struct Input *Input;
typedef struct Form_t *Form_t;

/*
typedef struct Input{
    const char label[INPUT_LABEL_LEN];
    int id;
    int type;
    int (*ReadInput)(void* dest, void* data);
    void* dest;
    void* data;
}Input;
*/

//For example; you could set 5 radio inputs, all with the same id. Therefore, Form_t will interpret them as belonging to the same step and print them together

/**
 * @class Form_t
 * @brief Form ADT which imitates HTML forms
 * @details Form_t loads inputs dynamically into it's own stack array
 *          when asked, Form_t will print into screen, in order, all
 *          of it's inputs. Interpreting every ID as a logical "step"
 *          in it
 */

 /*
typedef struct Form_t{
    const char title[FORM_TITLE_LEN];
    void* dest;
    Input inputs[FORM_INPUT_AMOUNT];
    int ids[FORM_INPUT_AMOUNT];
    int inputAmount;
    int idAmount;
}Form_t;
*/

Form_t* formInitialize(Form_t* form, const char* title);

int formAddInput(Form_t* form, Input* input);
int formDeleteInput(Form_t* form, int id, char* label);

int formOrderInputs(Form_t* form, int* order);

char** formAsk(Form_t* form);

char* formSetGetTitle(Form_t* form, char* newTitle);
int* formGetIDs(Form_t* form);
void formSeeSteps(Form_t* form);

Input* createInput(Input* input, const char* label, int id, int type, void* data);

#undef I
#undef T

#endif // FORMULARIO_H