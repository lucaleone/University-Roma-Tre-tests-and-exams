#include <stdio.h>
#include <stdlib.h>
#include "pagina.h"
void StampaPagine(pagina* diz)
{
    printf("\n%s", diz->parola);
    if(diz->next!=NULL)
        StampaPagine(diz->next);
}
void fStampaPagine(char* filePath, pagina* diz)
{
    FILE* fl = fopen(filePath,"w");
    fprintf(fl, "Parole dizionario:\n\n");
    while(diz!=NULL)
    {
        fprintf(fl, diz->parola);
        fprintf(fl, "\n");
        if(diz->next!=NULL)
            diz= diz->next;
        else
            break;
    }
    fclose(fl);
    printf("file creato in %s", filePath);
}

void addWords(pagina** dest, pagina* source)
{
    pagina* res=*dest;
    while(source!=NULL)
    {
        addWord(&res, source->parola);
        if(source->next!=NULL)
            source= source->next;
        else
            break;
    }
    *dest=res;
}
pagina* IncollaDizionari(pagina* diz1, pagina* diz2)
{
    pagina* res=NULL;
    while(diz1!=NULL)
    {
        addWord(&res, diz1->parola);
        if(diz1->next!=NULL)
            diz1=diz1->next;
        else
            break;
    }
    while(diz2!=NULL)
    {
        addWord(&res, diz2->parola);
        if(diz2->next!=NULL)
            diz2=diz2->next;
        else
            break;
    }
    return res;
}
//aggiunge una pagina in ordine alfabetico
void addWord(pagina** diz, char* word)
{
    printf("Aggiungo Parola....\n");
    pagina * temp= *diz;
    if(temp==NULL)
    {
         printf("lista vuota, aggiungo il primo elemento!\n");
        temp= (pagina*) malloc(sizeof(pagina*));
        temp->parola=word;
        temp->next=NULL;
        *diz=temp;
        printf("%s aggiunta\n",(*diz)->parola);
        return;
    }
    while(confrontaParole(temp->parola, word)!=-1)
    {
        if(temp->next!=NULL)
        {
            temp=temp->next;
            printf("Controllo il prossimo\n");
        }
        else
        {
          temp->next= (pagina*) malloc(sizeof(pagina*));
          temp->next->parola=word;
          temp->next->next=NULL;
          printf("%s aggiunta alla fine\n",temp->next->parola);
          return;
        }
    }
    char* tempChar=temp->parola;
    temp->parola=word;
    pagina * newPage= (pagina*) malloc(sizeof(pagina*));
    newPage->parola=tempChar;
    (newPage->next)=(temp->next);
    temp->next=newPage;
    return;
}

// <0 se viene prima;  >0 dopo
int confrontaParole(char* inserita, char* daInserire)
{
    //printf("Confronto: %s ", inserita);
    //printf("con: %s \n", daInserire);
    int i=0;
    while(*(daInserire+i))
    {
        if(*(daInserire+i)<*(inserita+i))
        {
         //   printf("%c piu piccola", *(daInserire+i) );
           // printf(" di %c ritorno -1\n", *(inserita+i));
            return -1;
        }
        else if(*(daInserire+i)>*(inserita+i))
        {
            //printf("ritorno 1\n");
            return 1;
        }
        i++;
    }
    //se sono uguali quella nuova la metto dopo
   // printf("ritorno 1 finale\n");
    return 1;
}
