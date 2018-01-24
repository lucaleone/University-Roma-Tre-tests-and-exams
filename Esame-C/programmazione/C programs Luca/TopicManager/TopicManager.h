#ifndef TOPICMANAGER_H_INCLUDED
#define TOPICMANAGER_H_INCLUDED
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

typedef char string[10];


typedef struct
{
int ID;
string nome;
}Topic;
typedef struct elem{
    Topic info;
    struct elem* next;
} etopic;

typedef etopic* ltopic;

typedef struct
{
int Codice;
string nome, cognome;
ltopic iLike;
}Persona;

typedef struct elem2{
    Persona info;
    struct elem2* next;
} epersone;

typedef epersone * persone;

int CercaPreferenze(persone, string);

void InserisciTopic(persone, int, int, string);

int CercaComune(persone, int, int);
#endif // TOPICMANAGER_H_INCLUDED
