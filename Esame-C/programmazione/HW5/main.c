#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Hello world!\n");
    return 0;
}

/* scrivi qui la definizione del tipo nodo_albero che rappresenta una struttura con tre campi: primo campo ha nome info ed è di tipo intero, secondo campo ha nome sx (un puntatore al sottoalbero sinistro), terzo campo ha nome dx (un puntatore al sottoalbero destro) */
struct nodo_albero{
int info;
struct nodo_albero* sx;
struct nodo_albero* dx;
};

/* scrivi qui la definizione del tipo albero che rappresenta un puntatore alla struttura nodo_albero */
typedef struct nodo_albero* albero;

/* INIZIO FUNZIONE */

int albero_pieno(albero T)
{
    /* Dato un un albero binario T di interi, la funzione albero_pieno deve ritornare un booleano: 1 se l'albero T è "pieno", 0 altrimenti. Un albero binario “pieno” è un albero binario in cui tutti i nodi hanno esattamente 0 o 2 figli, e nessun nodo ha 1 figlio. Se l'albero T è vuoto la funzione deve ritornare 1.*/
    if(T==NULL)
        return 1;
    else
    {
        return ((T->sx!=NULL && T->dx !=NULL) || (T->sx==NULL && T->dx ==NULL)) && albero_pieno(T->sx) && albero_pieno(T->dx) ;
    }
}
int StessaAltezzaFoglie(albero T, int k)
{
    if(T->sx==NULL && T->dx ==NULL)
        return k;
    else
    {
        k++;
        return StessaAltezzaFoglie(T->sx, k) == StessaAltezzaFoglie(T->dx, k)
    }
}


int larghezza_albero(albero T)
{
    /* Dato un un albero binario T di interi, la funzione larghezza_albero deve ritornare la larghezza di T;
     la larghezza di un albero binario è il numero massimo di nodi che stanno tutti al medesimo livello.
      Nel caso in cui T sia vuoto la funzione ritornerà 0.*/
    if(T!=NULL && T->sx==NULL && T->dx ==NULL)
        return 1;
    return larghezza_alberoAUX(T);
}
int larghezza_alberoAUX(albero T)
{
    if(T!=NULL)
    {
        int prossimaLarghezza = larghezza_alberoAUX(T->sx) +larghezza_alberoAUX(T->dx);
        int larghezzaCorrente =0;
        if(T->sx!=NULL)
            larghezzaCorrente++;
        if(T->dx!=NULL)
            larghezzaCorrente++;
         return larghezzaCorrente>prossimaLarghezza?larghezzaCorrente:prossimaLarghezza;
    }
    else
        return 0;
}


