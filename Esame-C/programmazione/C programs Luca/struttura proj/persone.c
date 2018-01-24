#include <stdio.h>
#include <stdlib.h>
#include "persone.h"

void printPersona(persone* p)
{
    printf("\nnome: %s  ", p->name);
    printf("matricola: %d\n", p->mat);
}
void addPersona(persone** destinazione, char* name, int mat)
{
    if((*destinazione)==NULL)
    {
        printf("primo nullo");
        (*destinazione)=(persone*) malloc(sizeof(persone));
        (*destinazione)->mat = mat;
        (*destinazione)->name = name;
        (*destinazione)->next = NULL;
        return;
    }
    persone* start= (*destinazione);
    while(start->next!=NULL)
    {
        printf("while ");
        start=start->next;
    }
    start->next = (persone*) malloc(sizeof(persone));
    printf("2 ");
    start->next->mat = mat;
    printf("3 ");
    start->next->name = name;
    start->next->next = NULL;
    printf("4 ");
    printf("%s",start->next->name);
    printf(" -end- ");
}
