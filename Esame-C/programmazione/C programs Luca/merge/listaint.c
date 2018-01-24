#include <stdio.h>
#include <stdlib.h>
#include "listaint.h"


void mergelist(listaint l1, listaint l2)
{
     while(l1!=NULL)
     {
          if(l1!=NULL)
          {
            if(l2->info<l1->info)
            {
                listaint t =l1;
                l1=l2;
                l1->next = t;
                l2=l2->next;
            }
            else
            {
                l1=l1->next;
            }
          }
          if(l1->next==NULL)
          {
              l1->next=l2;
              return;
          }
     }
}

void cancellaAt(listaint * l1, int index)
{
    listaint temp = *l1;
    if(index==0)
    {
        temp=temp->next;
    }
    else
    {
        int countIndex =1;

        while(temp!=NULL)
        {
            if(countIndex==index)
            {

                listaint canc= temp->next;
                temp->next=temp->next->next;
                free(canc);
                return;
            }
            temp= temp->next;
            countIndex++;
        }
    }
}

int verifica(listaint l)
{
    if(l!=NULL)
    {
        int primo = l->info;
        l = l->next;
        int somma = 0;

        listaint temp =l;
        while(temp!=NULL)
        {
            somma += temp->info;
            temp = temp->next;
        }
        if(primo>somma)
        {
            if(l->next != NULL)
                return verifica(l);
            else
                return 1;
        }
    }
    return 0;
}

void stampa(listaint l)
{
    while(l!=NULL)
    {

        printf("%d ", l->info);
        l= l->next;
    }
     printf("\n");
}
void crealista(listaint * lo, int i)
{
        listaint l = malloc(sizeof(linteger));
        l->info=i;
        l->next=NULL;
        l->prev=NULL;
        l->head=l;
        *lo = l;
}
void add(listaint * l,int i)
{
    listaint temp = *l;
    while(temp!=NULL)
    {
        if(temp->next==NULL)
        {
            temp->next =  malloc(sizeof(linteger));
            temp->next->info =i;
            temp->next->prev=temp;
            temp->next->head= temp->head;
            temp->next->next=NULL;
            return;
        }
        temp=temp->next;
    }
}
