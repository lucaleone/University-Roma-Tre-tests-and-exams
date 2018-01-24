#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"

int contExpr(Lista* L, int v)
{
    int x=0;
    while(L != NULL)
    {
       if( resolve(L) > v )
            x++;
        L = L->next;
    }
    return x;
}

int resolve(Albero* alb)
{
    int res = 0;
    if(alb->dx == NULL && alb->sx == NULL) //è foglia, quindi ha valore
        return alb->info;
    res = resolve(alb->sx);
    switch (alb->info)
    {
        case '+':  res + resolve(alb->dx); break;
        case '-':  res - resolve(alb->dx); break;
        case '*':  res * resolve(alb->dx); break;
        case '/':  res / resolve(alb->dx); break;
    }
    return res;
}

void createP_ABR(Lista* L, ListAlbero** LAlb)
{
    int tmp;
    while (L != NULL)
    {
        tmp= resolve(L->info);
        if(tmp%2==0)
            addAlbero(LAlb, L->info);
    }
}
void addAlbero(ListAlbero** LAlb, Albero* a)
{
    if((*LAlb)==NULL)
    {
        (*LAlb) = (ListAlbero*) malloc(sizeof(ListAlbero));
        (*LAlb)->info = a;
        (*LAlb)->dx = NULL;
        (*LAlb)->sx = NULL;
    }
    if(a->info < (*LAlb)->info)
        addAlbero((*LAlb)->sx, a);
    else if(a->info > (*LAlb)->info)
        addAlbero((*LAlb)->dx, a);
}
void createTextFile(Albero* alb)
{
    FILE* fl = fopen("formule.txt", "w");
    if(fl!=NULL)
        exit(1);
    createTextFileAUX(alb->sx, fl);
    fprintf(fl," %c",alb->info);
    createTextFileAUX(alb->dx, fl);
    fclose(fl);
}
void createTextFileAUX(Albero* alb, FILE* fl)
{
    createTextFileAUX(alb->sx, fl);
    fprintf(fl," %c",alb->info);
    createTextFileAUX(alb->dx, fl);
}


