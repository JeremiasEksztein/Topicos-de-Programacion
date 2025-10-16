#ifndef FORM_H_INCLUDED
#define FORM_H_INCLUDED

#include <ncurses.h>
#include <form.h>

typedef struct Form_t *Form_t;
typedef struct Input *Input;

typedef struct attribList{
}attribList;

#define INPUT_TYPE_RADIO 0
#define INPUT_TYPE_CHECKLIST 1
#define INPUT_TYPE_TEXT 2
#define INPUT_TYPE_DATE 3
#define INPUT_TYPE_NUMERIC 4

#define FORM_TITLE_LEN 128
#define FORM_INPUT_LABEL_LEN 64
#define FORM_INPUT_MAX_AMOUNT 256
#define FORM_INPUT_RESPONSE_LEN 256

#define INPUT_ATTRIB_LIST 0
#define INPUT_LIST_MAX_AMOUNT 32
#define INPUT_LIST_LABEL_LEN 64

#define INPUT_ATTRIB_MIN 
#define INPUT_ATTRIB_MAX
#define INPUT_ATTRIB_VALIDATE

Form_t* formCreate(Form_t* form, const char* title);
int formDestroy(Form_t* form);

int formAddInput(Form_t* form, Input* newInput);
int formUpdateInput(Form_t* form, Input* newInput, int id);
int formDeleteInput(Form_t* form, int id);

int formAsk(Form_t* form);

int formResetResponses(Form_t* form);
char* formGetResponse(Form_t* form, int id);

//int* formSetGetIDs(Form_t* form, int* newIDs);
//char** formSetGetLabels(Form_t* form, char** newLabels);

Input* inputCreate(const char** label, int id, int type, struct attribList attribs);


#endif // FORM_H