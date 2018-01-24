#include <stdio.h>  /* ora puoi usare NULL */
#include <stdlib.h>  /* ora puoi usare le funzioni di allocazione dinamica della memoria */
/* scrivi qui la definizione del tipo nodo_albero che rappresenta una struttura con tre campi: primo campo ha nome info ed è di tipo intero, secondo campo ha nome sx (un puntatore al sottoalbero sinistro), terzo campo ha nome dx (un puntatore al sottoalbero destro) */
struct nodo_albero{
int info;
struct nodo_albero* sx;
struct nodo_albero* dx;
};

/* scrivi qui la definizione del tipo albero che rappresenta un puntatore alla struttura nodo_albero */
typedef struct nodo_albero* albero;
void albero_camminoAUX(albero T, int v, int **cammino)
{
    if(T != NULL)
    {
        printf("Non è nullo\n");
        int*tmp = *cammino;
        if (tmp == NULL)
        {
            printf("CREO\n");
            tmp = (int*)malloc(sizeof(int));
            *cammino=tmp;
        }
        *tmp = T->info;
        printf("Aggiungo elemento: %d al puntatore\n", *tmp);
        if(T->info == v  )
        {
            if(T->dx || T->sx)
                *cammino = NULL;
        }
        else
        {
            printf("cerco nei figli\n");
            tmp++;
            if(T->info < v && T->dx!=NULL)//destra
            {
                printf("Figlio destro\n");
                albero_camminoAUX(T->dx, v, &tmp);
                if(tmp==NULL)
                    *cammino = NULL;
            }
            else if(T->info > v && T->sx!=NULL)
            {
                printf("Figlio sinistro\n");
                albero_camminoAUX(T->sx, v, &tmp);
                if(tmp==NULL)
                    *cammino = NULL;
            }
            else // non esiste
                *cammino = NULL;
        }
    }
}

int* albero_cammino(albero T, int v)
{
    int *cammino = NULL;
    if(T != NULL)
    {
        printf("Non è nullo\n");
        //cammino = (int*)malloc(sizeof(int));
        printf("Chiamo aux\n");
        albero_camminoAUX(T, v, &cammino);

    }
    return cammino;
}

int main()
{
    printf("----------Inizio-----------------\n\n");
   albero tmp = (albero) malloc(sizeof(albero));
   tmp->info =15;
   tmp->dx=NULL;
   tmp->sx=(albero) malloc(sizeof(albero));
   tmp->sx->info =9;
   tmp->sx->sx=NULL;
   tmp->sx->dx=NULL;
   printf("Chiamo albero_cammino\n");
   int * res =albero_cammino(tmp, 9);
   printf("---fine metodo------\n");
   if(res==NULL)
    printf("\EEEEEEE");
   if(res!=NULL)
   {
       printf("\nvedo res");
       int i = 0;
       while(i<3)
       {
            printf("Val: %d\n", *(res+i));
            i++;
       }
   }
   printf("\n-------------fine------\n");
   return 0;
}







/* scrivi qui eventuali funzioni di appoggio */



/* INIZIO FUNZIONE */
/* Si consideri un albero binario di ricerca T e un intero v (si ricorda che rispetto ad ogni nodo,
       il figlio sinistro avrà un valore minore rispetto al padre, il figlio destro avrà un valore maggiore
        rispetto al padre): allocare dinamicamente un array A di interi contenente i valori info dei nodi
        del cammino dalla radice di T alla foglia di T contenente il valore v. Alla fine restituire l'array A così costruito.
         Se l'albero T è vuoto, oppure non esiste una foglia in T contenente il valore v allora restituire NULL.
          Se l'albero T non presenta alcuna foglia contenente v, ma presenta un nodo intermedio con il valore v,
           la funzione deve restituire NULL */
