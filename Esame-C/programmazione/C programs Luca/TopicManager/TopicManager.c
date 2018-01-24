#include <stdio.h>
#include <stdlib.h>
#include "TopicManager.h"

void insertPerson(persone *PP, int codice, string nome, string cognome)
{
       printf("1!\n");
    persone newPerson = malloc(sizeof(epersone));
       printf("2!\n");
    newPerson->info.Codice = codice;
     printf("3!\n");
    strcpy(newPerson->info.nome,nome);
       printf("4!\n");
    strcpy(newPerson->info.cognome,cognome);
       printf("5!\n");
    newPerson->info.iLike = NULL;
       printf("6!\n");
    newPerson->next = *PP;
       printf("7!\n");
    *PP = newPerson;
       printf("8!\n");
}

int CercaPreferenze(persone p, string s)
{
    int res=0;
    while(p !=NULL)
    {
        while(p->info.iLike!=NULL)
        {
            if(strcmp(p->info.iLike->info.nome, s)==0)
            {
                res++;
            }
            p->info.iLike = p->info.iLike->next;
        }
       p=p->next;
    }
    return res;
}
void InserisciTopic(persone p, int cp, int ct, string nt)
{
    printf("iniza!\n");
    while(p!=NULL)
    {
        printf("While!\n");
        if(p->info.Codice==cp)
        {
            printf("primo if!\n");
            if(p->info.iLike==NULL)
            {
                printf("è null!\n");
                p->info.iLike= malloc(sizeof(etopic));
                p->info.iLike->info.ID=ct;
                printf("test id: %d\n", p->info.iLike->info.ID);
                strcpy(p->info.iLike->info.nome, nt);
                return;
            }
            while(p->info.iLike!=NULL)
            {
                printf("Secondo While!\n");
                 if( p->info.iLike->info.ID > ct )
                  {
                      printf("secondo if!\n");
                      ltopic temp = malloc(sizeof(etopic));
                      temp = p->info.iLike;
                      ltopic ins = malloc(sizeof(etopic));
                      //Topic *ins=malloc(sizeof(Topic));
                      //ins = malloc(sizeof(Topic));
                      ins->info.ID=ct;
                      strcpy(ins->info.nome, nt);
                      ins->next=&temp;
                      p->info.iLike = &ins;
                      //p->info.iLike->next=&temp;
                      return;
                  }
                if(p->info.iLike->next != NULL)
                    p->info.iLike = p->info.iLike->next;
                else
                {
                    //se quello che vuoi inserire ha ct maggiore di tutti
                    //arrivi alla fine e ne aggiungi un'altro
                    printf("ct maggiore di tutti!\n");
                    etopic temp;// = malloc(sizeof(ltopic));
                    printf("dddddd!\n");
                    p->info.iLike->next = &temp;
                    printf("1!\n");
                    p->info.iLike->next->info.ID=ct;
                    printf("2!\n");
                    strcpy(p->info.iLike->next->info.nome, nt);
                    printf("3 %d !\n", p->info.iLike->next->info.ID );
                    return;
                }
            }
        }
        p = p->next;
    }

}

int CercaComune(persone p, int cp1, int cp2)
{
    int comune=0;
    Persona p1,p2;
    //cerco le due persone con quel codice
    while( p!=NULL )
    {
        printf("a\n");
        if(p->info.Codice == cp1)
        {
            p1=p->info;
        }
        else if(p->info.Codice == cp2)
        {
            p2=p->info;
        }
        p = p->next;
    }
    //prima verifico chi è più lungo
    printf("lunghezza di %d\n", p1.Codice);
    int length1=0;
    while(p1.iLike!=NULL)
    {
         length1++;
         printf(" b %s\n",p1.iLike->info.nome);
         p1.iLike = p1.iLike->next;
    }
    printf("lunghezza di %d\n", p2.Codice);
    int length2=0;
    while(p2.iLike!=NULL)
    {
         length2++;
          printf(" c %s\n",p2.iLike->info.nome);
         p2.iLike = p2.iLike->next;
    }
    if(length1<length2)
    {
        Persona temp = p1;
        p1=p2;
        p2=temp;
    }
    while(p1.iLike!=NULL)
    {
        while(p2.iLike!=NULL)
        {
            if(p1.iLike->info.ID == p2.iLike->info.ID)
                comune++;
            p2.iLike = p2.iLike->next;
        }
        p1.iLike = p1.iLike->next;
    }
    return comune;
}
void stampaTopics(ltopic pt){
    printf("Topics: ");
    while (pt != NULL)
        {
        printf(" [%d,%s] ", pt->info.ID, pt->info.nome);
        pt = pt->next;
    }
    printf("\n\n");
}

void stampaPersone(persone PP){
    while (PP != NULL){
        printf("Codice: %d\n",PP->info.Codice);
        printf("Nome: %s\n",PP->info.nome);
        printf("Cognome: %s\n",PP->info.cognome);
        stampaTopics(PP->info.iLike);
        PP = PP->next;
    }
}





