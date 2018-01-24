#include <stdio.h>
#include <stdlib.h>

typedef struct elem{
    char* nome;
    int stipendio;
    struct elem* next;
}persona;


int main()
{
    printf("\tInizio programma\n");
    persona* myp = NULL;
    addPersona(&myp, "marco", 1200);
    addPersona(&myp, "giov", 1500);
    addPersona(&myp, "giacomo", 700);//povero stagista
    addPersona(&myp, "francesco", 800);
    addPersona(&myp, "kent", 3000);
    printf("Persone create\n");
    creaFileStipendi(myp);
    leggiStipendi("stipendi.dat", 1000);
    //AlzaStipendioMinimoA("stipendi.dat", 1000);
    //scriviFile();
    printf("\n\n\tFine programma\n");
    return 0;
}

//scrive in binario diversi tipi di dato, poi li rilegge
void scriviFile()
{
    int Wvect[5] = {1,2,3,4,5};
    int Wvect2[5] = {12,1,8,7};
    int Waa = 5;
    char* Wstr = "bho non so";

    int Rvect[5];
    int Rvect2[4];
    int Raa;
    char Rstr[10];//se si fa col puntatore non funziona
    FILE *fl = fopen("dati.dat", "w+b");
    if(fl!=NULL)
    {
        //scrivo i diversi tipi di dato
        fwrite(Wvect, sizeof(int), 5, fl);
        fwrite(Wvect2, sizeof(int), 4, fl);
        fwrite(&Waa, sizeof(int), 1, fl);
        fwrite(Wstr, sizeof(char), 10, fl);
        fwrite(" joi", sizeof(char), 4, fl);


        //torno a posizione 0
        printf("Posizione prima di fseek: %d \n",ftell(fl));
        fseek(fl, -ftell(fl),SEEK_CUR); //ftell(fl) deve essere negativo per andare indietro
        printf("Posizione dopo di fseek: %d \n",ftell(fl));

        //leggo in ordine
        int n = fread(Rvect,sizeof(int),5,fl);
        int i;
        for (i=0; i<n; i++)
            printf("%d ",Rvect[i]);

        n = fread(Rvect2,sizeof(int),4,fl);
        for (i=0; i<n; i++)
            printf("%d ",Rvect2[i]);

        n = fread(&Raa,sizeof(int),1,fl);
        if(n!=0)
            printf("%d ",Raa);
        n = fread(Rstr, sizeof(char), 10, fl);
        if(n==10)
            printf("? %s",Rstr);
        fclose(fl);
    }
    else
        exit(1);
}


void addPersona(persona** list, char* nome, int stipendio)
{
    persona* mylist= *list;
    mylist= (persona*) malloc(sizeof(persona));
    mylist->nome=nome;
    mylist->stipendio= stipendio;
    mylist->next=*list;
    *list= mylist;
}

void creaFileStipendi(persona* listpers)
{
    FILE* fl = fopen("stipendi.dat", "wb");//scrivo, se gà esiste cancello e ricreo da 0
    if(fl== NULL)
        exit(1);
    while(listpers!=NULL)
    {
        printf("Pos corrente: %d\n", ftell(fl));
        fwrite(&listpers, sizeof(persona*), 1, fl);
        printf("Pos corrente: %d\n", ftell(fl));
        listpers= listpers->next;
    }
    printf("fine file: %d\n", ftell(fl));
    fclose(fl);
    printf("Creazione file completata con successo.\n");
}
void leggiStipendi(char* nomefile)
{
    FILE* fl = fopen("stipendi.dat", "rb"); //lo apro in lettura e in scrittura senza cancellare quello precedentemente scritto
    if(fl== NULL)
        exit(1);
    int n;
    persona* pp;
    while ( (n = fread(&pp, sizeof(persona*), 1, fl)) !=0)
        stampaPersona(pp);
    fclose(fl);
    printf("Lettura finita\n\n");
}
void AlzaStipendioMinimoA(char* nomefile, int minstip)
{
    persona* pp;
    FILE* fl = fopen("stipendi.dat", "r+b"); //lo apro in lettura e in scrittura senza cancellare quello precedentemente scritto
    if(fl== NULL)
        exit(1);
    int n;
    int count = 0;
    while (count <4)
    {
    n = fread(pp, sizeof(persona), 1, fl);
   /* if(n==0)//li abbiamo letti tutti
    {
        fclose(fl);
        return;
    }*/
    if(pp->stipendio<minstip)
        pp->stipendio = minstip;
    fseek(fl, -(sizeof(persona)), SEEK_CUR);
    fwrite(pp, sizeof(persona), 1, fl);
    count++;
    }
    fclose(fl);
    printf("Aumento stipendio completato con successo.\n");
}

void stampaPersona(persona* p)
{
        printf("nome: %s; stipendio: %d;\n", p->nome, p->stipendio);
}
//int fwrite(addr, int dim, int n, FILE *f);
