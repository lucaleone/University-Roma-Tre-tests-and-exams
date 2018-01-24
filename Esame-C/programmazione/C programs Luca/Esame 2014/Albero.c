#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"

int verificaLivello(Albero* t1, Albero* t2, int lev)
{
    lista * l1 = AllocaLista(t1, lev);
    lista * l2 = AllocaLista(t2, lev);
    printf("fine allocazioni\n");
    printLista(l1);
    printLista(l2);
    return elementiInComune(l1, l2);
}

lista* AllocaLista(Albero* alb, int prof)
{
    lista *res=NULL;
    if ( alb!=NULL) {
        AllocaListaAUX(alb, &res, prof, 0 );
    }
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
     temp->next->val= val;
     temp->next->next = NULL;
}
void printLista(lista* l1)
{
    lista* node;
    for(node = l1; node!=NULL; node=node->next )
        printf(" %d", node->val);
    printf("\n");
}
int elementiInComune(lista * l1, lista * l2)
{
    int res = 0;
    for (; l1 != NULL && l2 != NULL; l1 = l1->next, l2=l2->next)
    {
        if(l1->val==l2->val)
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
    int test=1;
    while (!feof(fl) && test)
    {
        int pos = ftell(fl);
        int prof; //prende primo char
        int num;//prende secondo
        fscanf(fl,"%d %d\n", &prof, &num);
        int numReale = (numElemInList(AllocaLista(T, prof)));
        printf("- ");
        if(num != numReale)
        {
            fseek(fl,pos,SEEK_SET);
            fprintf(fl,"%d %d\n", prof, numReale);
            test=0;
        }
    }
    fclose(fl);
    printf("\nfile %s modificato\n", nomeFile);
}


void addNodo(Albero** albero, int val)
{
    Albero* temp = *albero;
    if(temp==NULL)
    {
        temp=(Albero*) malloc(sizeof(Albero));
        printf("inserisco: %d\n", val);
        temp->val=val;
        temp->left=NULL;
        temp->right=NULL;
        *albero=temp;
    }
    else
    {
        if(val>temp->val)
            addNodo(&temp->right, val);
        else if(val<temp->val)
            addNodo(&temp->left, val);
        }
}
