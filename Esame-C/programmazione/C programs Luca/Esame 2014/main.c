#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"
int main()
{
    printf("inizio\n");
    Albero* myalbero=NULL;
    addNodo(&myalbero, 15);
    addNodo(&myalbero, 10);
    addNodo(&myalbero, 8);
    addNodo(&myalbero, 5);
    addNodo(&myalbero, 9);
    addNodo(&myalbero, 25);
    addNodo(&myalbero, 19);
    addNodo(&myalbero, 29);
    printf("fine inserimento\n");
    lista* l1 = AllocaLista(myalbero, 1);
    printf("fine allocalista\n");
    printLista(l1);

    Albero* myalbero2=NULL;
    addNodo(&myalbero2, 15);
    addNodo(&myalbero2, 10);
    addNodo(&myalbero2, 8);
    addNodo(&myalbero2, 5);
    addNodo(&myalbero2, 9);
    addNodo(&myalbero2, 25);
    addNodo(&myalbero2, 19);
    addNodo(&myalbero2, 29);
    addNodo(&myalbero2, 28);
    addNodo(&myalbero2, 31);
   // printf("verificalivelli: %d",verificaLivello(myalbero, myalbero2, 3));
    printf("\n\nfine Programma\n");
    ModificaFile(myalbero,"livelli.txt");
    return 0;
}

