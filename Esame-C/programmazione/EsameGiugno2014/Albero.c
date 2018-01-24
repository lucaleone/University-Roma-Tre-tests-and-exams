#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"
void ModificaFile(Albero* T,char* c)
{
    int count;
    do{
    FILE* fl = fopen(c,"r+b");
    if(fl==NULL)
        exit(1);
    char x, y;
    int z;
    count =0;
    while( fread(&x, sizeof(char), 1, fl) != 0  &&
           fread(&y, sizeof(char), 1, fl) != 0  &&
           fread(&z, sizeof(int), 1, fl) != 0 && count<1)
    {
        printf("Analizzo %c, %c\n", x, y);
        int dist = distanza(T, x, y);
        if(dist!=z)
        {
            printf("trovata differenza: %d-> %d\n", z, dist);
            fseek(fl, -sizeof(int), SEEK_CUR);
            fwrite(&dist, sizeof(int), 1, fl);
            fseek(fl, 0, SEEK_CUR);
            count++;
        }
    }
    fclose(fl);
    }
    while (count!=0);
    printf("Correzione file completata con successo.\n");
}


lista* allocaLista(Albero* T,char c)
{
    int trovato =0;
    while(T!=NULL && !trovato)
    {
        if(T->info == c)
            trovato=1;
        else if(c < T->info)
            T= T->left;
        else if(c > T->info)
            T= T->right;
    }
    lista* l= NULL;
    if(trovato)
    {
        if(T->left!=NULL)
            allocaListaAUX(T->left, T, c, &l);
        if(T->right!=NULL)
            allocaListaAUX(T->right, T, c, &l);
    }
    return l;
}
void allocaListaAUX(Albero* T, Albero* T2,char c, lista** l)
{
    if(T->left==NULL && T->right==NULL)
    {
        printf("Calcolo distanza da foglia %c\n",T->info);
        AddLista(l, distanza(T2, c, T->info));
    }
    else
    {
        if(T->left!=NULL)
            allocaListaAUX(T->left, T2, c, l);
        if(T->right!=NULL)
            allocaListaAUX(T->right, T2, c, l);
    }
}

void AddLista(lista** l, int i)
{
    lista* l1= (lista*) malloc(sizeof(lista));
    l1->info=i;
    l1->next=*l;
    *l=l1;
}

int distanza(Albero* T, char v1, char v2)
{
    int res = distanzaAux(T, v1, v2);
    if(res == 0)
        res = distanzaAux(T, v2, v1);
    return res;
}

int distanzaAux(Albero* T, char v1, char v2)
{
    int trovato =0;
    while(T!=NULL && !trovato)
    {
        if(T->info == v1)
            trovato=1;
        else if(v1 < T->info)
            T= T->left;
        else if(v1 > T->info)
            T= T->right;
    }
    int res=0;
    if(trovato)
    {
        while(T!=NULL)
        {
            if(T->info == v2)
                return res;
            else
            {
                res++;
                if(v2 < T->info)
                    T= T->left;
                else if(v2 > T->info)
                    T= T->right;
            }
        }
    }
    return 0;
}



//---------------testing----------------//
void addNodo(Albero** albero, char val)
{
    Albero* temp = *albero;
    if(temp==NULL)
    {
        temp=(Albero*) malloc(sizeof(Albero));
        printf("inserisco: %c\n", val);
        temp->info=val;
        temp->left=NULL;
        temp->right=NULL;
        *albero=temp;
    }
    else
    {
        if(val>temp->info)
            addNodo(&temp->right, val);
        else if(val<temp->info)
            addNodo(&temp->left, val);
        }
}
void stampaLista(lista* l)
{
    while (l!=NULL)
    {
        printf("- %d ", l->info);
        l=l->next;
    }
}
void creaFileCompito(char* c)
{
    FILE* fl = fopen(c,"wb");
    if(fl==NULL)
        exit(1);
    fwrite("a", sizeof(char), 1, fl);
    fwrite("e", sizeof(char), 1, fl);
    int dist=2;
    fwrite(&dist, sizeof(int), 1, fl);

    fwrite("k", sizeof(char), 1, fl);
    fwrite("z", sizeof(char), 1, fl);
    dist=1;
    fwrite(&dist, sizeof(int), 1, fl);

    fwrite("l", sizeof(char), 1, fl);
    fwrite("k", sizeof(char), 1, fl);
    dist=1;
    fwrite(&dist, sizeof(int), 1, fl);

    fwrite("m", sizeof(char), 1, fl);
    fwrite("c", sizeof(char), 1, fl);
    dist=0;
    fwrite(&dist, sizeof(int), 1, fl);

    fclose(fl);
    printf("Creazione file completata con successo.\n");
}
