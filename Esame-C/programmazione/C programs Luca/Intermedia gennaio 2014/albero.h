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

typedef struct riga
 {
    lista* current;
    struct riga* nextRiga;
} matrice;
void addNodo(Albero** , int );
int Altezza(Albero*);
int Foglie(Albero*);
#endif // ALBERO_H_INCLUDED
