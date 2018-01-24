#include <stdio.h>
#include <stdlib.h>
typedef struct elem{
    int info;
    struct elem* sx;
    struct elem* dx;
} nodo_albero;

typedef nodo_albero* albero;


int esiste_nodo_al_livello(albero T, int val, int liv)
{
    if(T!=NULL)
        return esiste_nodo_al_livelloAUX(T, val, liv, 0);
    else
        return 0;
}
int esiste_nodo_al_livelloAUX(albero T, int val, int liv, int CurrLiv)
{
    if(T!=NULL && CurrLiv <= liv)
    {
         if(liv==CurrLiv && val ==T->info)
            return 1;//true
         else
            return esiste_nodo_al_livelloAUX(T->sx, val, liv, 1) ||
                   esiste_nodo_al_livelloAUX(T->dx, val, liv, 1);
    }
    else return 0;
}

int getLiv(albero T, int v)
{
     if(T!=NULL)
        return getLivAUX(T, v, 0);
    else
        return 0;
}
int getLivAUX(albero T, int val, int CurrLiv)
{
    if(T!=NULL)
    {
         if(val ==T->info)
            return CurrLiv;
         else
            {
                CurrLiv++;
                int profSX= getLivAUX(T->sx, val, CurrLiv);
                if(profSX>0)
                    return profSX;
                else
                    getLivAUX(T->dx, val, CurrLiv);
            }
    }
    else return -1;
}


int* costruisci_livello_foglia(albero T, int v)
{
    if (1)//esiste_foglia( T,  v))
    {
        int * res = (int*)malloc(sizeof(int));
        int prof = getLiv(T, v);
        printf("\nlivello: %d\n", prof);
        *int tmp=res;
        costruisci_livello_fogliaAUX(T, prof, 0, &tmp);
        return res;
    }

}

void costruisci_livello_fogliaAUX(albero T, int prof, int Currliv, int** lst)
{
    if(T!=NULL)
    {
        int* tmp = *lst;
        if(prof == Currliv)
        {
            *tmp= Currliv;
        }
        else
        {
            Currliv++;
            costruisci_livello_fogliaAUX(T->sx, prof, Currliv, &tmp);
            costruisci_livello_fogliaAUX(T->dx, prof, Currliv, &tmp);
        }
    }
}



int main()
{
    printf("Hello world!\n");
    albero myAlbero= (albero)  malloc(sizeof(albero));
    myAlbero->info= 3;

    myAlbero->sx = (albero)malloc(sizeof(albero));
    myAlbero->sx->info=14;
    myAlbero->dx = (albero)malloc(sizeof(albero));
    myAlbero->dx->info=22;

    myAlbero->sx->sx = (albero)malloc(sizeof(albero));
    myAlbero->sx->sx->info=66;
    myAlbero->sx->sx->sx=NULL;
    myAlbero->sx->sx->dx=NULL;
    myAlbero->sx->dx = (albero)malloc(sizeof(albero));
    myAlbero->sx->dx->info=11;
    myAlbero->sx->dx->sx=NULL;
    myAlbero->sx->dx->dx=NULL;

    myAlbero->dx->dx = (albero)malloc(sizeof(albero));
    myAlbero->dx->dx->info = 45;
    myAlbero->dx->dx->sx=NULL;
    myAlbero->dx->dx->dx=NULL;
    myAlbero->dx->sx=NULL;
    printf("dase creata");
    int * p=costruisci_livello_foglia(myAlbero, 11);
    int i=0;
    while (i<4)
    {
        printf("%d ", p++);
        i++;
    }
    return 0;
}
