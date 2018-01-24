#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Student{
    char Matricola[5];
    int *Voti;
    int VotiSize;
 };

typedef struct StudentList{
    struct Student info;
    struct StudentList *next;
 };

int main()
{
    struct StudentList MyStudentList;

    printf("================================\n");
    printf("Benvenuto in Student Manager\n");
    printf("================================\n\n");
    CreaStudenti(&MyStudentList);
    printf("Studenti creati\n");
    int media;
    media = mediaVotiStudente(&MyStudentList, "55555");
    printf("Media voti di 55555: %d", media);

    char finito;
    printf("\n---------------------------\nfinito?");
    scanf(" %c", &finito);
    return 0;
}
struct StudentList CreaStudenti(struct StudentList *s)
{
    printf("Inserisci nuovo studente:\n");
    printf("Inserisci matricola:\n");
    scanf("%s",&s->info.Matricola);
    printf("Inserire voto? y/n\n");
    char res;
    scanf(" %c", &res);
    s->info.Voti = calloc(0, sizeof(int));
    while(res=='y')
    {
        s->info.VotiSize++;
        printf("Inserisci voto:\n");
        int i;
        scanf(" %d",&i);
        s->info.Voti = realloc(s->info.Voti,s->info.VotiSize*sizeof(int));
        s->info.Voti[s->info.VotiSize-1]=i;
        printf("Inserire altro voto? y/n\n");
        scanf(" %c", &res);
    }
    struct  Student next;
    s->next = &next;
    char newStud;
     printf("\nInserire altro Studente? y/n\n");
    scanf(" %c", &newStud);
    if( newStud == 'y' )
        CreaStudenti(&s->next);
}

int mediaVotiStudente(struct StudentList *students, char matricola[5])
{
    //ricerca l'elemento che ha matricola uguale all'argomento
    int result=0;
    if(strcmp(&students->info.Matricola, matricola))
    {
        result = media(&students->info.Voti,students->info.VotiSize);
    }
    else
    {
        if(students->next != NULL)
          result = mediaVotiStudente(&students->next, matricola);
    }
    return result;
}

 int media(int *voti, int sizeMedia)
    {
        int somma=0;
        int i;
        while (voti!=NULL)
        {
            printf("\n bla");
            somma += voti[i];
        }
       // printf("somma: %d || num: %d",&somma,&votiSize);
        int med= somma/2;
        return med;
    }
