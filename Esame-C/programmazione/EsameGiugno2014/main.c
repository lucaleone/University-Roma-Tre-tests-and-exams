#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"
int main()
{
    printf("---------------Esame giugno 2014---------------\n\n");
    Albero* myalbero=NULL;
    addNodo(&myalbero, 'k');
    addNodo(&myalbero, 'e');
    addNodo(&myalbero, 'm');
    addNodo(&myalbero, 'b');
    addNodo(&myalbero, 'f');
    addNodo(&myalbero, 'l');
    addNodo(&myalbero, 's');
    addNodo(&myalbero, 'a');
    addNodo(&myalbero, 'c');
    printf("la distanza è: %d\n",distanza(myalbero, 'l', 'k') );
    lista* list2=NULL;
    list2 = allocaLista(myalbero,'e');
    stampaLista(list2);

    creaFileCompito("distanze.dat");
    ModificaFile(myalbero,"distanze.dat");
    printf("\n\n---------------------Fine---------------------\n");
    return 0;
}
