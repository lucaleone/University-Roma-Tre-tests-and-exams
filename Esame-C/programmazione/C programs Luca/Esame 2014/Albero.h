#ifndef ALBERO_H_INCLUDED
#define ALBERO_H_INCLUDED

typedef struct node {
    int val;
    struct node* left;
    struct node* right;
} Albero;

typedef struct item {
    int val;
    struct item* next;
} lista;


lista* AllocaLista(Albero* , int );
void ListAdd( lista** , int );
int elementiInComune(lista * , lista * );
int numElemInList(lista * );
void printLista(lista* );
void addNodo(Albero** , int );
#endif // ALBERO_H_INCLUDED
