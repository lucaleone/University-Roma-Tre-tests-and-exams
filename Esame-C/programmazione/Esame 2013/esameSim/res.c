#include "res.h"
#include <stdio.h>
#include <stdlib.h>
void printAbr(tree *abr)
{
    if (abr != NULL)
    {
        printf("(");
        printAbr(abr->sx);
        switch(abr->info)
        {
            case '+': printf(" + ");          break;
            case '-': printf(" - ");          break;
            case '*': printf(" * ");          break;
            case '/': printf(" / ");          break;
            default:  printf("%d",abr->info); break;
        }
        printAbr(abr->dx);
        printf(")");
    }
}

void createABR(expressionsList* list,  expressionsTree** exTree)
{
    expressionsList* t2=list;
    expressionsTree* t;
    printf("1\n");
    if(*exTree==NULL)
    {
        printf("2\n");
       t= malloc(sizeof(expressionsTree));
       t->info=t2->info;
       t2=t2->next;
       t->dx=NULL;
       t->sx=NULL;
    }
    else
        t=*exTree;

    while(list)
    {
        printf("3\n");
        insertTree(&t, t2->info);
        list= list->next;
    }
    *exTree= t;
}

void insertTree(expressionsTree** exTree, tree* add)
{
    expressionsTree* temp= *exTree;
    printf("4\n");
    if(resolve(temp->info)>resolve(add))
     {
         if(temp->sx!=NULL)
         {
             printf("5a\n");
             insertTree(&temp->sx,  add);
         }
         else
         {
            expressionsTree*  t = malloc(sizeof(expressionsTree));
            t->info=add;
            t->dx=NULL;
            t->sx=NULL;
            temp->sx=t;
         }
     }
     else if(resolve(temp->info)<resolve(add))
     {
         if(temp->dx!=NULL)
            insertTree(&temp->dx,  add);
         else
         {
            expressionsTree*  t= malloc(sizeof(expressionsTree));
            t->info=add;
            t->dx=NULL;
            t->sx=NULL;
            temp->dx=t;
         }
     }
     *exTree=temp;
}

int resolve(tree* t)
{
    if(t)
    {
        switch(t->info)
        {
            case '+': return (resolve(t->sx) + resolve(t->dx));
            case '-': return resolve(t->sx) - resolve(t->dx);
            case '*': return resolve(t->sx) * resolve(t->dx);
            case '/': return resolve(t->sx) / resolve(t->dx);
            default: return t->info;
        }
    }
    else
        return 0;
}
