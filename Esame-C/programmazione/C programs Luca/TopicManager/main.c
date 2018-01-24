#include <stdio.h>
#include <stdlib.h>
#include "TopicManager.h"
int main()
{
    printf("Hello world!\n");

    // Allocazione e inizializzzione della lista di persone
    persone PP = NULL;
    printf("inizio crea persona!\n");
    // creazione di persona
    insertPerson(&PP, 4, "Nicola", "Bianchi");
        InserisciTopic(PP, 4, 23, "Cinema");
        printf("seconto topic!\n");
        InserisciTopic(PP, 4, 22, "Pittura");
        InserisciTopic(PP, 4, 7, "Web");
 stampaPersone(PP);

    // creazione di persona
    insertPerson(&PP, 3, "Andrea", "Neri");
        InserisciTopic(PP, 3, 41, "Scultura");
        InserisciTopic(PP, 3, 23, "Cinema");

    // creazione di persona
    insertPerson(&PP, 2, "Lorena", "Verdi");
        InserisciTopic(PP, 2, 31, "Giornalismo");
        InserisciTopic(PP, 2, 22, "Pittura");

    // creazione di persona
    insertPerson(&PP, 1, "Mario", "Rossi");
        InserisciTopic(PP, 1, 23, "Cinema");
        InserisciTopic(PP, 1, 22, "Pittura");
        InserisciTopic(PP, 1, 21, "Sport");



    printf("ho finito!\n");
    int res= CercaComune(PP, 4,2);
    printf("2 e 3 hanno in comune: %d\n", res);
    return 0;
}
