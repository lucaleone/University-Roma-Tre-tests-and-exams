#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"

void addNodo(Albero** albero, int val)
{
    Albero* temp = *albero;
    if(temp==NULL)
    {
        temp=(Albero*) malloc(sizeof(Albero));
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

int Altezza(Albero* albero)
{
    int res =0;
    if(albero!=NULL)
    {
        res++;
        int L=0;
        int R=0;
        if(albero->left != NULL)
            L = Altezza(albero->left);
        if(albero->right != NULL)
            R = Altezza(albero->right);
        res+= maxNum(L,R);
    }
    return res;
}
int Foglie(Albero* albero)
{
    int res =0;
    if(albero!=NULL)
    {
        res=1;
        if(albero->left != NULL || albero->right != NULL)
        {
            int L=0;
            int R=0;
            if(albero->left != NULL)
                L = FoglieAUX(albero->left, res);
            if(albero->right != NULL)
                R = FoglieAUX(albero->right, res);
            res= maxNum(L,R);
        }
    }
    return res;
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

void valorizzaListaDaLista(lista** riga, lista* l )
{
    printf("\nvalorizzo una riga\n");
    lista* tmp= *riga;
    for( ; l!=NULL; l = l->next, tmp = tmp->next)
    {
        printf("- ");
        printf("a %d", tmp->val);
        tmp->val = l->val;
        printf("a ");
    }
     printf("\nfine valorizzo una riga");
}

matrice* creaMatrice(Albero* albero)
{
    int v = Altezza(albero);
    int h = Foglie(albero);
    matrice* myMat;
    if(v>0)
    {
        myMat = (matrice*) malloc(sizeof(matrice));
        myMat->nextRiga=NULL;
        int row=0;
        matrice* tmp=myMat;
        for( ; row<v ; tmp=tmp->nextRiga,row++)
        {
            printf("\n inizio riga");
            if(tmp==NULL)
            {
                tmp  = (matrice*) malloc(sizeof(matrice));
                tmp->nextRiga=NULL;
            }
            int col=0;
            printf("\n while");
            while (col<h)
            {
                  printf("\n bho");
                ListAdd(&(tmp->current), 0);
                col++;
            }
            printf("\n b");
            printf("ver: %d ", tmp->current->next->val);
            lista* l = AllocaLista(albero, row);
            valorizzaListaDaLista(&tmp->current, l);
        }
    }
    return myMat;
}


int FoglieAUX(Albero* albero, int res)
{
    if(albero!=NULL)
    {
        res+=res;
        if(albero->left != NULL || albero->right != NULL)
        {
            int L=0;
            int R=0;
            if(albero->left != NULL)
                L = FoglieAUX(albero->left, res);
            if(albero->right != NULL)
                R = FoglieAUX(albero->right, res);
            res= maxNum(L,R);
        }
    }
    return res;
}

int maxNum(int a, int b)
{
    if(a>=b)
        return a;
    else
        return b;
}

void stampaMatrice(matrice* mat)
{
    for( ; mat != NULL; mat = mat->nextRiga)
    {
        for( ; mat->current!=NULL; mat->current = mat->current->next)
            printf("[%d] ", mat->current->val);
        printf("\n");
    }
}


