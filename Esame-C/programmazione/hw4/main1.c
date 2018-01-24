#include <stdio.h>
#include <stdlib.h>
#define MAX(a,b) (((a)>(b))?(a):(b))



/* scrivi qui la definizione del tipo nodo_albero che rappresenta una struttura con tre campi:
un campo info di tipo intero, un campo sx (il puntatore al sottoalbero sinistro),
un campo dx (un puntatore al sottoalbero destro) */

typedef struct elem{
int info;
struct elem* sx;
struct elem* dx;
};



/* scrivi qui la definizione del tipo albero che rappresenta un puntatore alla struttura nodo_albero */
typedef struct elem* albero;


/* scrivi qui eventuali funzioni di appoggio */


int NumeroFoglie(albero T)
{
    int res =0;
    if(T != NULL)
    {
        res+=NumeroFoglie(T->sx)+ NumeroFoglie(T->dx);
        if(res==0)
            res++;
    }
    return res;
}
int AltezzaAlbero(albero T)
{
    if(T!=NULL)
        return 1 + MAX(AltezzaAlbero(T->sx), AltezzaAlbero(T->dx));
    else
        return -1;
}
int albero_altezza_foglie(albero T)
{
    /* Si consideri un albero binario T di interi. La funzione albero_altezza_foglie deve ritornare un booleano:
     1 (true) se l'altezza di T è pari al numero di foglie di T, 0 (false) altrimenti.
     Si ricorda che in un albero binario vuoto l'altezza è pari a -1 mentre il numero di foglie è pari a 0;
      quindi se T è vuoto allora la funzione albero_altezza_foglie deve ritornare 0.*/
    int numFoglie = NumeroFoglie(T);
    int altezza = AltezzaAlbero(T);
    return (numFoglie == altezza);
}
