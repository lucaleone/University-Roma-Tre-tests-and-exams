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
typedef struct nodo_albero* albero;
int main()
{
    printf("Hello world!\n");
    albero tmp = (albero) malloc(sizeof(albero));
    tmp->info = 5;
    tmp->dx = NULL;
    tmp->sx = NULL;
albero tmp2=NULL;
    albero_ricerca_nodo(&tmp, 3);
    printf("Hello %d\n", tmp->sx->info);
    return 0;
}


/* scrivi qui la definizione del tipo albero che rappresenta un puntatore alla struttura nodo_albero */

/* scrivi qui eventuali funzioni di appoggio */
void Add(albero* T, int value)
{
    printf("--add\n");
    albero tmpAlbero = *T;
    if(tmpAlbero==NULL)
    {
        printf("inserisco\n");
        albero tmp = (albero) malloc(sizeof(albero));
        tmp->info = value;
        tmp->dx = NULL;
        tmp->sx = NULL;
        *T = tmp;
    }
    else if(value<tmpAlbero->info)
       Add(&tmpAlbero->sx, value);
   else
       Add(&tmpAlbero->dx, value);
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



