#ifndef ALBERO_H_INCLUDED
#define ALBERO_H_INCLUDED
#include "Albero.h"
typedef struct elem{
char info;
struct elem* left;
struct elem* right;
}Albero;
typedef struct elem1{
int info;
struct elem1* next;
}lista;

int distanza(Albero*, char, char);
int distanzaAux(Albero*, char, char);
lista* allocaLista(Albero*,char);
void allocaListaAUX(Albero*, Albero*,char, lista**);
void AddLista(lista**, int);
void ModificaFile(Albero*,char*);
//---------------testing----------------//
void addNodo(Albero**, char);
void stampaLista(lista*);
void creaFileCompito(char*);
#endif // ALBERO_H_INCLUDED
