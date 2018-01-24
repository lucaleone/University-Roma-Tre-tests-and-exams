#include <stdio.h>  /* ora puoi usare NULL */
#include <stdlib.h>  /* ora puoi usare le funzioni di allocazione dinamica della memoria */

/* scrivi qui la definizione del tipo nodo_albero che rappresenta una struttura con tre campi:
 un campo info di tipo intero, un campo sx (il puntatore al sottoalbero sinistro),
 un campo dx (un puntatore al sottoalbero destro) */
struct nodo_albero{
int info;
struct nodo_albero* sx;
struct nodo_albero* dx;
};



/* scrivi qui la definizione del tipo albero che rappresenta un puntatore alla struttura nodo_albero */

typedef struct nodo_albero* albero;
/* scrivi qui eventuali funzioni di appoggio */
void Add(albero* T, int value)
{
    albero tmpAlbero = *T;
    if(tmpAlbero==NULL)
    {
        albero tmp = (albero) malloc(sizeof(albero));
        tmp->info = value;
        tmp->dx = NULL;
        tmp->sx = NULL;
        T = &tmp;
        return;
    }
    if(value < tmpAlbero->info)
    {
        if(tmpAlbero->sx!=NULL && (value > tmpAlbero->sx->info))
        {
            albero tmp = (albero) malloc(sizeof(albero));
            tmp->info = value;
            tmp->dx = tmpAlbero->dx;
            tmp->sx = tmpAlbero;
            T = &tmp;
        }
        else
            Add(&tmpAlbero->sx, value);
    }
    else
    {
        if(tmpAlbero->dx!=NULL && (value < tmpAlbero->dx->info))
        {
            albero tmp = (albero) malloc(sizeof(albero));
            tmp->info = value;
            tmp->sx = tmpAlbero->dx;
            tmp->dx = tmpAlbero;
            T = &tmp;
        }
        else
            Add(&tmpAlbero->dx, value);
    }
}

int albero_ricerca_nodo(albero* T, int v){
  albero tmpAlbero = *T;
  while(tmpAlbero != NULL)
  {
      if (tmpAlbero->info==v)
      {
          return 1;
      }
      else
      {
          if(v > tmpAlbero->info)
            tmpAlbero=tmpAlbero->dx;
           else
            tmpAlbero=tmpAlbero->sx;
      }
  }
  Add(T,v);
  return 0;
}
