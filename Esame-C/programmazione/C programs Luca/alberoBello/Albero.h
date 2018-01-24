#ifndef ALBERO_H_INCLUDED
#define ALBERO_H_INCLUDED
typedef struct node
{
    int val;
    struct node* left;
    struct node* right;
}ramo;
void addNodo(ramo** , int );
void removeNodo(ramo** , int );
void removeNodi(ramo**, ramo*);
int profonditNodo(ramo*, int, int);
void addAlbero(ramo**, ramo*);
int existNodo(ramo*, int);
int ProfonditaUguale(ramo*, ramo*, int);

void StampaAlbero(ramo* );
void fStampaAlbero(ramo* albero);
#endif // ALBERO_H_INCLUDED
