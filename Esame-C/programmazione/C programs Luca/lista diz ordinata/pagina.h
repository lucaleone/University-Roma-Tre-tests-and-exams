#ifndef PAGINA_H_INCLUDED
#define PAGINA_H_INCLUDED
typedef struct tnode
{
    char* parola;
    struct tnode *next;
}pagina;

void StampaPagine(pagina*);
void fStampaPagine(char*, pagina*);
pagina* IncollaDizionari(pagina*, pagina*);
void addWord(pagina** , char*);
void addWords(pagina** , pagina*);
int confrontaParole(char*, char*);
#endif // PAGINA_H_INCLUDED
