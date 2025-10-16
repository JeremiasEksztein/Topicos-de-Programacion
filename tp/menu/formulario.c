#include "formulario.h"

int readRadioInput(char* dest, void* data);
int readChecklistInput(char* dest, void* data);
int readTextInput(char* dest, void* data);
int readDateInput(char* dest, void* data);
int readNumericInput(char* dest, void* data);
int readSubmitInput(char* dest, void* data);
int readReturnInput(char* dest, void* data);

int stepThroughForm(char* response, Input* inputs, int n, int type);
void screenRefresh(Form_t* form);

typedef struct Input{
    const char label[INPUT_LABEL_LEN];
    int id;
    int type;
    int (*ReadInput)(char* dest, void* data);
    void* data;
}Input;

typedef struct InputMetadata{
    char response[FORM_RESPONSE_LEN];
    int id;
    void* data;
    int (*ReadInput)(char* dest, void* data);
}InputMetadata;

typedef struct{
    const char title;
    InputMetadata metadatum[];
    int idAmount;
    //InputMetadata metadatum[FORM_INPUT_AMOUNT]; esto lo soluciona todo
}

typedef struct Form_t{
    const char title[FORM_TITLE_LEN];
    Input inputs[FORM_INPUT_AMOUNT];
    int ids[FORM_INPUT_AMOUNT];
    char responses[FORM_INPUT_AMOUNT][FORM_RESPONSE_LEN];
    int inputAmount;
    int responseAmount;
    int idAmount;
}Form_t;

Form_t* formInitialize(Form_t* form, const char* title)
{
    if(!form || !title){
        return NULL;
    }

    form->idAmount = 0;
    form->inputAmount = 0;
    form->responseAmount = 0;

    if(!strncpy(form->title, title, FORM_TITLE_LEN)){
        return NULL;
    }

    return form;
}

int formAddInput(Form_t* form, Input* input)
{
    if(!form || !input){
        return -1;
    }

    Input i;

    strncpy(i.label, input->label, INPUT_LABEL_LEN);
    i.id = input->id;
    i.type = input->type;
    i.data = input->data;

    //If id already exists but type is different, return error
    for(int n = 0; n < form->idAmount; n++){
        if((form->ids)[n] == i.id && (form->inputs)[n].type != i.type){
            return -1;
        }
    }

    switch(i.type){
        case INPUT_TYPE_RADIO:
            i.ReadInput = readRadioInput;
            break;
        case INPUT_TYPE_CHECKLIST:
            i.ReadInput = readChecklistInput;
            break;
        case INPUT_TYPE_TEXT:
            i.ReadInput = readTextInput;
            break;
        case INPUT_TYPE_DATE:
            i.ReadInput = readDateInput;
            break;
        case INPUT_TYPE_NUMERIC:
            i.ReadInput = readNumericInput;
            break;
        case INPUT_TYPE_SUBMIT:
            i.ReadInput = readSubmitInput;
            break;
        case INPUT_TYPE_RETURN:
            i.ReadInput = readReturnInput;
            break;
        default:    
            return -1;
    }

    (form->inputs)[form->inputAmount] = i;
    (form->ids)[form->idAmount] = i.id;

    form->inputAmount++;
    form->idAmount++;

    return 0;
}

int formDeleteInput(Form_t* form, int id, char* label)
{
    if(!form || !label){
        return -1;
    }

    Input* inputs = form->inputs;

    for(int i = 0; i < form->inputAmount; i++){
        if(inputs[i].id == id && !strncmp(inputs[i].label, label, INPUT_LABEL_LEN)){
            memmove(inputs + i, inputs + i + 1, (form->inputAmount - i) * sizeof(Input));
            form->inputAmount--;
        }
    }

    int i, n;

    for(i = 0, n = 0; i < form->idAmount; i++){
        if((form->ids)[i] == n){
            n++;
        }
    }

    if(n = 1){
        memmove((form->ids) + i , (form->ids) + i + 1, (form->idAmount - i) * sizeof(int));
    }

    return 0;
}

int formOrderInputs(Form_t* form, int* orders)
{
    if(!form || !orders){
        return -1;
    }
}

char** formAsk(Form_t* form)
{
    //Con corte de control, leemos cada input que coicide con su id

    char** responses = form->responses;
    Input* inputs = form->inputs;
    Input inputsTmp[FORM_INPUT_AMOUNT];
    int* ids = form->ids;
    int i = 0;
    int j = 0;
    int k = 0;
    int id = (form->ids)[0];
    int pastI = 0;

    while(i < form->idAmount){
    
        j = 0;
        pastI = ids[i];

        while(i < form->idAmount && pastI == id){
            inputsTmp[j] = inputs[i];
            
            i++;
            j++;

            id = ids[i];
        }

        stepThroughForm(responses[k], inputsTmp, j, inputsTmp[0].type);

        k++;
    }

    return responses;
}

void screenRefresh(Form_t* form)
{
    printf("\033[H\033[J");
    printf("+%.*s+\n", FORM_TITLE_LEN + 2, "--------------------------------");
    printf("| %s |\n", form->title);
    printf("+%.*s+\n", FORM_TITLE_LEN + 2, "--------------------------------");
    printf("\n");
}

char* formSetGetTitle(Form_t* form, char* newTitle)
{
    if(!form){
        return NULL;
    }

    char* oldTitle = form->title;

    if(newTitle){
        strncpy(form->title, newTitle, FORM_TITLE_LEN);
    }

    return oldTitle;
}

int* formGetIDs(Form_t* form)
{
    if(!form){
        return NULL;
    }

    return form->ids;
}

void formSeeSteps(Form_t* form)
{
    if(!form){
        return;
    }

    for(int i = 0; i < form->idAmount; i++){
        printf("%d\n", (form->ids)[i]);
    }
}

Input* createInput(Input* input, const char* label, int id, int type, void* data)
{
    if(!input || !label){
        return NULL;
    }

    strncpy(input->label, label, INPUT_LABEL_LEN);
    input->id = id;
    input->type = type;
    input->data = data;

    return input;
}

int stepThroughForm(char* response, Input* inputs, int j, int type)
{
    int i = 0;

    switch(type){
        case INPUT_TYPE_RADIO:
            for(; i < j; i++){
                printf("(%d) - %s\n", i + 1, inputs[i].label);
            }
            readRadioInput(response, inputs[0].data);
            break;
        case INPUT_TYPE_CHECKLIST:
            for(; i < j; i++){
                printf("[%d] - %s", i + 1, inputs[i].label);
            }
            readChecklistInput(response, inputs[0].data);
            break;
        case INPUT_TYPE_TEXT:
            for(; i < j; i++){
                printf("[%s] - ", inputs[i].label);
                readTextInput(response, inputs[0].data);
            }
            break;
        case INPUT_TYPE_DATE:
            for(; i < j; i++){
                printf("[%s] - ", inputs[i].label);
                readDateInput(response, inputs[0].data);
            }
            break;
        case INPUT_TYPE_NUMERIC:
            for(; i < j; i++){
                printf("[%s] - ", inputs[i].label);
                readNumericInput(response, inputs[0].data);
            }
            break;
        case INPUT_TYPE_SUBMIT:
            break;
        case INPUT_TYPE_RETURN:
            break;
        default:    
            return -1;
    }

    return response;
}

int readRadioInput(char* dest, void* data)
{
    puts("Seleccione UNA de las opciones");
    if(fgets(dest, 9 /*Digitos*/,  stdin)){
        dest[strcspn(dest, "\n")] = '\0';
    }
    return 0;
}

int readChecklistInput(char* dest, void* data)
{
    puts("Seleccione UNA o MAS de las opciones, separadas por comas");
    if(fgets(dest, 64 /*Digitos*/,  stdin)){
        dest[strcspn(dest, "\n")] = '\0';
    }
    return 0;
}

int readTextInput(char* dest, void* data)
{
    puts("Ingrese el texto");
    if(fgets(dest, 256 /*Digitos*/,  stdin)){
        dest[strcspn(dest, "\n")] = '\0';
    }
    return 0;
}

int readDateInput(char* dest, void* data)
{
    puts("Ingrese la fecha en formato AAAA-MM-DD");
    if(fgets(dest, 11 /*Digitos*/,  stdin)){
        dest[strcspn(dest, "\n")] = '\0';
    }
    return 0;
}

int readNumericInput(char* dest, void* data)
{
    puts("Ingrese el numero, de ser necesario con decimales, con punto");
    if(fgets(dest, 20 /*Digitos*/,  stdin)){
        dest[strcspn(dest, "\n")] = '\0';
    }
    return 0;
}
