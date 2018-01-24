#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Hello world!\n");
    return 0;
}


typedef struct integer
{
int info;
struct integer* next;
struct integer* prev;
struct integer* head;
}linteger;
