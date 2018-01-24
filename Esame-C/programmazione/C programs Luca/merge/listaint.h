#ifndef LISTAINT_H_INCLUDED
#define LISTAINT_H_INCLUDED
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
typedef struct integer
{
int info;
struct integer* next;
struct integer* prev;
struct integer* head;
}linteger;

typedef linteger* listaint;

void crealista(listaint*,int);
#endif
