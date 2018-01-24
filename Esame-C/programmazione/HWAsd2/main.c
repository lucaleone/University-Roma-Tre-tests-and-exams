#include <stdio.h>
#include <stdlib.h>
typedef struct elem{
 int info;
 struct elem *next;
}elist;

/* scrivi qui la definizione del tipo "elist" (elemento della lista) con i campi "info" (intero) e "next" (prossimo elemento) */
typedef elist* plist;
int main()
{
    printf("Hello world!\n");
    /*elist* plist;
    plist = malloc(sizeof (elist));
    plist->info=5;*/
    plist myList ;
    myList= malloc(sizeof (plist));
    myList->info=5;
    myList->next= malloc(sizeof (plist));
    myList->next->info=50;
    myList->next->next = malloc(sizeof (plist));
    myList->next->next->info=8;
    myList->next->next->next = NULL;
    printf("max: %d", valore_massimo_lista(myList));
    return 0;
}


/* scrivi qui la definizione del tipo "plist" che e' un riferimento ad un oggetto di tipo "elist" */

/* inizio funzione */

int valore_massimo_lista(plist p) {
    if(p == NULL)
       return 0;
    int max =p->info;
    p = p->next;
    while(p != NULL)
    {
        if (p->info > max)
            max = p->info;
        p= p->next;
    }
    return max;
}

int compara_array_lista(int A[], int n, plist p){

    /* Scrivi qui il codice che conta quanti elementi dell'array A lungo n siano
       presenti anche nella lista semplicemente concatenata p di interi.
       L'array A ha tutti elementi distinti, mentre la lista p potrebbe avere elementi
       duplicati. Se un elemento di A appare duplicato in p, deve essere contato una sola volta.
       Se la lista e' vuota oppure n e' zero allora ritorna zero.  */
    int sharedElements=0;
    int idx;
    for (idx=0; idx < n; idx++)
    {
        sharedElements += checkExistence(p, A[idx]);
    }
    return sharedElements;
}

int checkExistence(plist p, int elem)
{
    int res =0;
    while(p != NULL)
    {
        if (p->info == elem)
        {
            res=1;
            break;
        }
        p= p->next;
    }
    return res;
}
