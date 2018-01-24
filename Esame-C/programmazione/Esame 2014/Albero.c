#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"

int verificaLivello(Albero* t1, Albero* t2, int lev)
{
    lista * l1 = AllocaLista(t1, lev);
    lista * l2 = AllocaLista(t2, lev);
    return elementiInComune(l1, l2);
}

lista* AllocaLista(Albero* alb, int prof)
{
    printf("\nAlloca %d", prof);
    lista *res=NULL;
    if (alb!=NULL)
        AllocaListaAUX(alb, &res, prof, 0 );
    return res;
}
void AllocaListaAUX(Albero* alb, lista** res, int prof, int currentProf)
{
    if(currentProf==prof)
    {
        ListAdd(res, alb->val);
    }
    else
    {
        currentProf++;
        if(alb->left!=NULL)
            AllocaListaAUX(alb->left, res, prof, currentProf);
        if(alb->right!=NULL)
            AllocaListaAUX(alb->right, res, prof, currentProf);
    }
}
void ListAdd( lista** l, int val)
{
    lista * temp= *l;
    if(temp==NULL)
    {
        temp= (lista*) malloc(sizeof(lista));
        temp->val= val;
        temp->next = NULL;
        *l=temp;
        return;
    }
    while(temp->next!=NULL)
        temp= temp->next;
     temp->next = (lista*) malloc(sizeof(lista));
     temp->val= val;
     temp->next = NULL;
}

int elementiInComune(lista * l1, lista * l2)
{
    int res = 0;
    while ( l1 != NULL && l2 != NULL)
    {
        if(l1->val!=l2->val)
            res++;
    }
    return res;
}

int numElemInList(lista * lis)
{
    int res = 0;
    while (lis!=NULL)
    {
        res++;
        lis= lis->next;
    }
    return res;
}
void ModificaFile(Albero *T, char* nomeFile)
{
    FILE *fl = fopen(nomeFile,"r+"); //apre file
    if(fl==NULL)
    {
        printf("file non esistente!");
        return;
    }
    int i=1;
    while (!feof(fl)|| i<4)
    {
        int pos = ftell(fl);
        int prof; //prende primo char
        int num;//prende secondo
        fscanf(fl,"%d %d\n", &prof, &num);
        printf("\nposition: %d", ftell(fl));
        int numReale = (numElemInList(AllocaLista(T, prof)));
        printf("\nreale: %d", numReale);
        if(num != numReale)
        {
            printf("\n prima di spostare: %d", ftell(fl));
            fseek(fl,pos,SEEK_SET);
            printf("\n dopo: %d", ftell(fl));
            fprintf(fl,"%d %d\n", prof, numReale);
            printf("\n dopo correzione: %d", ftell(fl));
        }
        i++;
    }
}
