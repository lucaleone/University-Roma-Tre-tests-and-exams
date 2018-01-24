#include <stdio.h>
#include <stdlib.h>
#include "res.h"




int main()
{
    printf("Hello world!\n");
    tree* root1= malloc(sizeof(tree));
    root1->info='+';
    root1->sx = malloc(sizeof(tree));
    root1->sx->info='-';
    root1->sx->sx = malloc(sizeof(tree));
    root1->sx->sx->info=2;
     root1->sx->sx->dx=NULL;
    root1->sx->sx->sx=NULL;
    root1->sx->dx = malloc(sizeof(tree));
    root1->sx->dx->info='*';
    root1->sx->dx->sx = malloc(sizeof(tree));
    root1->sx->dx->sx->info=3;
     root1->sx->dx->sx->dx=NULL;
    root1->sx->dx->sx->sx=NULL;
    root1->sx->dx->dx = malloc(sizeof(tree));
    root1->sx->dx->dx->info=4;
     root1->sx->dx->dx->dx=NULL;
    root1->sx->dx->dx->sx=NULL;
    root1->dx = malloc(sizeof(tree));
    root1->dx->info=5;
    root1->dx->dx=NULL;
    root1->dx->sx=NULL;

    tree* root2= malloc(sizeof(tree));
    root2->info='+';
    root2->sx = malloc(sizeof(tree));
    root2->sx->info=3;
    root2->sx->dx=NULL;
    root2->sx->sx=NULL;
    root2->dx = malloc(sizeof(tree));
    root2->dx->info=5;
    root2->dx->dx=NULL;
    root2->dx->sx=NULL;

    expressionsList* list=malloc(sizeof(expressionsList));
    list->info=root1;
    list->next=malloc(sizeof(expressionsList));
    list->next->info=root2;
    list->next->next=NULL;
    printf("Creo l'albero di alberi..\n");
    expressionsTree* exTree=NULL;
    createABR(list, &exTree);
    printf("Stampa...\n");
    printAbr(exTree->info);
    printf("\n");
    printAbr(exTree->dx->info);
    return 0;
}

