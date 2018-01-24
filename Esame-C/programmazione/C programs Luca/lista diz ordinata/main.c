#include <stdio.h>
#include <stdlib.h>
#include "pagina.h"

int main()
{
    printf("Hello world!\n");
    pagina *pagine1=NULL;
    pagina *pagine2=NULL;
    pagina *pagine3=NULL;
    addWord(&pagine1, "abete");
    addWord(&pagine1, "erba");
    addWord(&pagine1, "bho");
    addWord(&pagine1, "pappa");
    addWord(&pagine1, "dado");
    addWord(&pagine1, "aba");

    addWord(&pagine2, "babbo");
    addWord(&pagine2, "ebete");
    addWord(&pagine2, "ariete");
    addWord(&pagine2, "cose");
    addWord(&pagine2, "bah");

    addWord(&pagine3, "marco");
    addWord(&pagine3, "sedia");
    addWord(&pagine3, "va");
    addWord(&pagine3, "andare");
    addWord(&pagine3, "lente");
    printf("Add Finito!\n");

    printf("\nStampo dizionario:\n");
    StampaPagine(pagine1);
    printf("\nStampo dizionario:\n");
    StampaPagine(pagine2);
    pagina* diz= IncollaDizionari(pagine1, pagine2);
    printf("\nStampo dizionario:\n");
    StampaPagine(diz);
    addWords(&diz, pagine3);
    printf("\nStampo dizionario:\n");
    StampaPagine(diz);
    fStampaPagine("ciao.txt", diz);
    return 0;
}
