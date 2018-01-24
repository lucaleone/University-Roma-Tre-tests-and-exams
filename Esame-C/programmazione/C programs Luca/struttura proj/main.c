#include <stdio.h>
#include <stdlib.h>
#include "persone.h"

int main()
{
    /*listaPersone= (persone*) malloc(sizeof(persone));
    listaPersone->mat=5553;
    listaPersone->name="test";
    listaPersone->next= NULL;*/
    listaPersone=NULL;
    addPersona(&listaPersone, "ciao", 123);
    printf(("\nadd secondo\n"));
    addPersona(&listaPersone, "alunno", 474);
   /* listaPersone->next= (persone*) malloc(sizeof(persone));
    listaPersone->next->mat=3939;
    listaPersone->next->name="boh";*/
    printPersona(listaPersone);
    printPersona(listaPersone->next);
    return 0;
}
