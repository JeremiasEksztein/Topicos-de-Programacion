#include "form.h"

int main()
{
    Form_t* form;
    Field_t* fields[4];
    Field_t* amount;
    Field_t* periodInit;
    Field_t* periodEnd;
    Field_t* region;

    formCreate(form, "Calculadora de Monto por IPC");

    fieldCreate(amount, "Amount");
    fieldCreate(periodInit, "Date of start");
    fieldCreate(periodEnd, "Date of end");
    fieldCreate(region, "Region to evaluate");

    fieldSetType(amount, FIELD_TYPE_NUMERIC);
    fieldSetAttrib(amount, "min", "0.0");

    fieldSetType(periodInit, FIELD_TYPE_DATE);
    fieldSetAttrib(periodInit, "min", "2016/12/01");
    fieldSetAttrib(periodInit, "max", "2025/07/01");

    fieldSetType(periodEnd, FIELD_TYPE_DATE);
    fieldSetAttrib(periodInit, "min", "2016/12/01");
    fieldSetAttrib(periodInit, "max", "2025/07/01");

    fieldSetType(region, FIELD_TYPE_RADIO);
    fieldSetAttrib(region, "options", "GBA|Pampeana|Noroeste|Noreste|Cuyo|Patagonia");

    fields[0] = amount;
    fields[1] = periodInit;
    fields[2] = periodEnd;
    fields[3] = region;

    formSetFields(form, fields);

    formPost(form);

    


}