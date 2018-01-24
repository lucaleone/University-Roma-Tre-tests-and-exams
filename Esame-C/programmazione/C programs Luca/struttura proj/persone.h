#ifndef PERSONE_H_INCLUDED
#define PERSONE_H_INCLUDED

typedef struct tnode
{
    char* name;
    int mat;
    struct tnode * next;
} persone;

 persone * listaPersone;
void printPersona(persone*);
#endif // PERSONE_H_INCLUDED
