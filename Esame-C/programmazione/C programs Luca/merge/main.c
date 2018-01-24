#include <stdio.h>
#include <stdlib.h>
#include "listaint.c"

int main()
{
    printf("Hello world!\n");
    listaint lista=NULL;// = malloc(sizeof(linteger));
    crealista(&lista,1);
    printf("Creata? %d\n", lista!=NULL);
    add(&lista,4);
    add(&lista,7);
    add(&lista,13);
    add(&lista,20);
    //add(&lista,9);
  //  add(&lista,55);
    printf("ord? %d\n", verifica(lista));
    listaint lista2=NULL;// = malloc(sizeof(linteger));
    crealista(&lista2,2);
    add(&lista2,5);
    add(&lista2,8);
    add(&lista2,40);
    add(&lista2,50);

    stampa(lista);
    stampa(lista2);
  /*  cancellaAt(&lista2, 3);
    stampa(lista2);*/

    mergelist(lista, lista2);
    stampa(lista);
    return 0;
}
