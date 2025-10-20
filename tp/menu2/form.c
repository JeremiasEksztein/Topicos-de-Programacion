#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "form.h"

typedef struct Input{
    char label[FORM_INPUT_LABEL_LEN];
    char response[FORM_INPUT_RESPONSE_LEN];
    int id;
    int type;
    attribList attrib;
}Input;

typedef struct Form_t{
    const char title[FORM_TITLE_LEN];
    Input inputs[FORM_INPUT_MAX_AMOUNT];
    int inputAmount;    
}Form_t;

int binarySearchForm(Input* inputs, int inputAmount, int id);

void refreshScreen(void);
void printTitle(const char* title);
void printInput(Input* input);

char* readRadioInput(Input* input);
char* readChecklistInput(Input* input);
char* readTextInput(Input* input);
char* readDateInput(Input* input);
char* readNumericInput(Input* input);

static char* (*Read[5])(Input* input) = {readRadioInput, readChecklistInput, readTextInput, readDateInput, readNumericInput};

void refreshScreen(void)
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

void printInput(Input* input)
{


}

char* readRadioInput(Input* input)
{
    printf("Input ONE of the numbers displayed to select: \n");
    fgets(input->response, FORM_INPUT_RESPONSE_LEN, stdin);

    input->response[strcspn(input->response, "\n")] = '\0';

    if(!strlen(input->response)){
        puts("Invalid input, try again");
        readRadioInput(input);
    }

    return input->response;
}

Form_t* formCreate(Form_t* form, const char* title)
{
    strncpy(form->title, title, FORM_TITLE_LEN);
    memset(form->inputs, '\0', sizeof(Input) * FORM_INPUT_MAX_AMOUNT);
    form->inputAmount = 0;

    return form;
}

int formDestroy(Form_t* form)
{
    (form->title)[0] = '\0';
    //memset(form->inputs, '\0', sizeof(Input) * FORM_INPUT_MAX_AMOUNT);
    form->inputAmount = 0;

    return form;
}

int formAddInput(Form_t* form, Input* input)
{
    Input* in = form->inputs;

    int elem = input->id;
    Input* i = in;
    Input* j = in + form->inputAmount - 1;
    int count = 0;

    while(elem > i->id && i <= j && !count){
        i++;
        count += !(elem - i->id);
    }

    if(elem == i->id && i > j && count > 1){
        return 1;
    }

    for(; i < j; j--){
        *(j + 1) = *j;
    }
     
    form->inputAmount++;

    i->type = input->type;
    (i->response)[0] = '\0';
    i->data = input->data;

    return 0;
}

/*

//In theory they should be added, right? To complete the CRUD, right?

int formUpdateInput(Form_t* form, Input* newInput, int id)
{
    return 0;
}

*/

/*
int formDeleteInput(Form_t* form, int id)
{
    Input* in = form->inputs;
    int pos;

    while(bsearch())

}
*/

int formAsk(Form_t* form)
{
    Input* in = form->inputs;
    int ce = form->inputAmount;


    for(int i = 0; i < ce; i++){
        refreshScreen();
        printTitle(form->title);
        printInput(in + i);
        Read[in[i].type](in + i);
    }

    return 0;
}

int formResetResponses(Form_t* form)
{
    Input* in = form->inputs;
    int ci = form->inputAmount;

    for(int i = 0; i < ci; i++){
        memset(in[i].response)[0], '\0', FORM_INPUT_RESPONSE_LEN);
    }

    return 0;
}

char* formGetResponse(Form_t* form, int id)
{
    int pos = binarySearch(form->inputs, form->inputAmount, id);
    
    if(pos < 0){
        return NULL;
    }

    return (form->inputs)[pos].response;
}

Input* inputCreate(const char* label, int id, int type, )



