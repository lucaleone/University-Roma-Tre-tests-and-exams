#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"

int main()
{
    printf("-----Programma albero-----\n");
    ramo * myAlbero = NULL;
    addNodo(&myAlbero, 17);
    printf("Ver val: %d \n",myAlbero->val);
    //removeNodo(&myAlbero, 17);
    printf("next 2 \n");
    addNodo(&myAlbero, 2);
    printf("next 5 \n");
    addNodo(&myAlbero, 5);
    printf("next 23\n");
    addNodo(&myAlbero, 23);
    printf("next 12 \n");
    addNodo(&myAlbero, 12);
    printf("next\n");
    addNodo(&myAlbero, 37);
    addNodo(&myAlbero, 75);
    int res =profonditNodo(myAlbero, 75, 0);
    printf("Profondità: %d\n", res);
    int res2 = existNodo(myAlbero, 12);
    printf("12 esiste?: %d --\n", res2);

    ramo * myAlbero2 = NULL;
    addNodo(&myAlbero2, 3);
    addNodo(&myAlbero2, 14);
    addNodo(&myAlbero2, 1);
    addAlbero(&myAlbero, myAlbero2);
    StampaAlbero(myAlbero);
    fStampaAlbero(myAlbero);

    printf("\n\n\n\n\n\ Ora si fa sul serio:\nCreo due alberi uguali e controllo con il metodo l'ugualianza a una data profondità:");
    ramo * a1 = NULL;
    addNodo(&a1, 15);
    addNodo(&a1, 7);
    addNodo(&a1, 5);
    addNodo(&a1, 11);
    addNodo(&a1, 3);
    addNodo(&a1, 6);
    addNodo(&a1, 8);
    addNodo(&a1, 13);
    addNodo(&a1, 19);
    addNodo(&a1, 17);
    addNodo(&a1, 16);
    addNodo(&a1, 18);
    addNodo(&a1, 23);
    addNodo(&a1, 21);
    addNodo(&a1, 25);

    ramo * a2 = NULL;
    addNodo(&a2, 15);
    addNodo(&a2, 7);
    addNodo(&a2, 5);
    addNodo(&a2, 11);
    addNodo(&a2, 3);
    addNodo(&a2, 6);
    addNodo(&a2, 8);
    addNodo(&a2, 13);
    addNodo(&a2, 19);
    addNodo(&a2, 17);
    addNodo(&a2, 16);
    addNodo(&a2, 18);
    addNodo(&a2, 23);
    addNodo(&a2, 21);
    addNodo(&a2, 25);
    printf("\n\n\n\nsono uguali: %d", ProfonditaUguale(a1, a2, 2));

    return 0;
}
