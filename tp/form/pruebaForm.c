#include "form.h"
#include <stdio.h>

int main(void)
{
    Form_t forma;
    EntradaAtrib atribs;

    formInit(&forma, "Formulario de prueba");

    atribInit(&atribs);
    atribSet(&atribs, FORM_ATRIBUTO_MAX, 9999999.9f);
    atribSet(&atribs, FORM_ATRIBUTO_MIN, 0.0f);
    atribSet(&atribs, FORM_ATRIBUTO_LEN, 32);
    atribSet(&atribs, FORM_ATRIBUTO_VALID, 1);

    formAgregarInput(&forma, ENTRADA_TIPO_NUMERICO, "Seleccione el valor a actualizar", NULL);
    formAgregarInput(&forma, ENTRADA_TIPO_OPCIONES, "Seleccione una region del IPC", "GBA|Pampeana|Patagonia|Noreste|Noroeste|Cuyo");
    formAgregarInput(&forma, ENTRADA_TIPO_TEXTO, "Periodo inicial (AAAA - Mes)", NULL);
    formAgregarInput(&forma, ENTRADA_TIPO_TEXTO, "Periodo final (AAAA - Mes)", NULL);

    formAgregarAtrib(&forma, &atribs, 1);
    formAgregarAtrib(&forma, &atribs, 2);
    formAgregarAtrib(&forma, &atribs, 3);
    formAgregarAtrib(&forma, &atribs, 4);

    formPublicar(&forma);

    printf("Su seleccion fue: %s | %s | %s | %s\n", formRespuesta(&forma, 1), formRespuesta(&forma, 2), formRespuesta(&forma, 3), formRespuesta(&forma, 4));

    return 0;
}