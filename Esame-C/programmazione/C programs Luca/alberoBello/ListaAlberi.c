#include "Albero.h"
#include "ListaAlberi.h"
#include <stdio.h>
#include <stdlib.h>

ramo* CreateAlberoFromList(listaAlberi * lista)
{
    ramo* alb =NULL;
    while(lista!=NULL)
    {
        addAlbero(&alb, lista->albero);
        if(lista->next != NULL)
            lista = lista->next;
    }
    return alb;
}
//rimuove i nodi di rem da tutti gli alberi di lista
void removeNodeFromList(listaAlberi** lista, ramo* rem)
{
    listaAlberi* temp =*lista;
    while(temp!=NULL)
    {
        removeNodi(&(temp->albero), rem);
        if(temp->next != NULL)
            temp = temp->next;
    }
}

