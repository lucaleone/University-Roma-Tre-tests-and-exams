#include <stdio.h>  /* ora puoi usare NULL */
#include <string.h>  /* ora puoi usare le funzioni sulle stringhe */
#include <stdlib.h>

typedef char stringa[30];

typedef struct elem {
    stringa nome;
    int prezzo;
} piatto;

void modifica_file(stringa n, int p, stringa nomefile)
{
    FILE *fl = fopen(nomefile, "r+b");
    if(fl==NULL)
    return;

    piatto TmpPiatto;
    int trovato =0;
    while(!trovato && !feof(fl))
    {
        fread(&TmpPiatto, sizeof(piatto), 1, fl);
        printf("nome1: %s nome2: %s\n",n, TmpPiatto.nome);
        if(!strcmp(n, TmpPiatto.nome))
        {
            printf("correggo\n");
            TmpPiatto.prezzo = p;
            fseek(fl, -sizeof(piatto),SEEK_CUR);
            fwrite(&TmpPiatto, sizeof(piatto), 1, fl);
            //fseek(fl, sizeof(piatto),SEEK_CUR);
            trovato=1;
        }
    }
    if(!trovato)
    {
        TmpPiatto.prezzo = p;
        strcpy(TmpPiatto.nome, n);
        fwrite(&TmpPiatto, sizeof(piatto), 1, fl);
    }
    fclose(fl);
}





int main()
{
    /*FILE *fl = fopen("ciao.dat", "wb+");

    piatto TmpPiatto;
    strcpy(TmpPiatto.nome, "piatto0");
    TmpPiatto.prezzo=14;
        fwrite(&TmpPiatto, sizeof(piatto), 1, fl);
    strcpy(TmpPiatto.nome, "piatto1");
    TmpPiatto.prezzo=50;
        fwrite(&TmpPiatto, sizeof(piatto), 1, fl);
    strcpy(TmpPiatto.nome, "piatto2");
    TmpPiatto.prezzo=4;
        fwrite(&TmpPiatto, sizeof(piatto), 1, fl);
    strcpy(TmpPiatto.nome, "piatto3");
    TmpPiatto.prezzo=9;
        fwrite(&TmpPiatto, sizeof(piatto), 1, fl);
    fclose(fl);
*/
    modifica_file("piatto5", 888, "ciao.dat");

   /* printf("\n\n -----------------leggo risultato---------------------\n");


    piatto TmpPiatto2;
    fl = fopen("ciao.dat", "rb+");
    fread(&TmpPiatto2, sizeof(piatto), 1,fl);
    printf("nome: %s prezzo: %d \n",TmpPiatto2.nome, TmpPiatto2.prezzo);
    fread(&TmpPiatto2, sizeof(piatto), 1,fl);
    printf("nome: %s prezzo: %d \n",TmpPiatto2.nome, TmpPiatto2.prezzo);
    fread(&TmpPiatto2, sizeof(piatto), 1,fl);
    printf("nome: %s prezzo: %d \n",TmpPiatto2.nome, TmpPiatto2.prezzo);
    fread(&TmpPiatto2, sizeof(piatto), 1,fl);
    printf("nome: %s prezzo: %d \n",TmpPiatto2.nome, TmpPiatto2.prezzo);
    fclose(fl);*/

    printf("\n\n -----------------fine---------------------\n\n\n");
    return 0;
}

/*
TEST1 (verifica con un file vuoto): FAILURE
TEST2 (verifica con un file senza il piatto): FAILURE
TEST3 (verifica con un file inesistente): SUCCESS
TEST4 (verifica con un file in presenza del piatto): SUCCESS*/




