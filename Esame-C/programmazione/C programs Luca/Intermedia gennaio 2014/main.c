#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"

int main()
{
    printf("Hello world!\n");
    Albero* myalbero=NULL;
    addNodo(&myalbero, 15);
    addNodo(&myalbero, 10);
    addNodo(&myalbero, 8);
    addNodo(&myalbero, 5);
    addNodo(&myalbero, 9);
    addNodo(&myalbero, 25);
    addNodo(&myalbero, 19);
    addNodo(&myalbero, 29);
    int h = Altezza(myalbero);
    printf("altezza: %d",h);
    int ho = Foglie(myalbero);
    printf("larghezza: %d",ho);
    matrice* m = creaMatrice(myalbero);
    printf("mo la stampo");
    stampaMatrice(m);
    return 0;
}
