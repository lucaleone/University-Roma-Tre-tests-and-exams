#include "Albero.h"
#include <stdio.h>
#include <stdlib.h>


//aggiunge un nodo, non aggiunge nodi uguali
void addNodo(ramo** albero, int val)
{
    ramo* temp = *albero;
    if(temp==NULL)
    {
        temp=(ramo*) malloc(sizeof(ramo));
        printf("inserisco: %d\n", val);
        temp->val=val;
        temp->left=NULL;
        temp->right=NULL;
        *albero=temp;
    }
    else
    {
        if(val>temp->val)
            addNodo(&temp->right, val);
        else if(val<temp->val)
            addNodo(&temp->left, val);
        }
}
void removeNodo(ramo** albero, int val)
{
    ramo* temp = *albero;
    if(temp==NULL)
        return;
    if(temp->val==val)
    {
        temp=NULL;
        printf("rimuovo: %d\n", val);
        *albero=temp;
    }
    else
    {
        if(val>temp->val)
        {
            if(temp->right!=NULL)
                addNodo(&temp->right, val);
        }
        else if(val<temp->val)
        {
            if(temp->left!=NULL)
                addNodo(&temp->left, val);
        }
     }
}
void removeNodi(ramo** albero, ramo* rem)
{
    if(rem!=NULL)
    {
        removeNodo(albero, rem->val);

        if(rem->left!=NULL)
            removeNodi(albero, rem->left);
        if(rem->right!=NULL)
            removeNodi(albero, rem->right);
    }
}
int profonditNodo(ramo* albero, int val, int res)
{
    if(albero==NULL)
        return  -1;
    if(albero->val==val)
    {
        printf("trovato: %d\n", val);
        return  res;
    }
    else
    {
        if(val>albero->val)
            if(albero->right!=NULL)
                return profonditNodo(albero->right, val, ++res);
        else if(val<albero->val)
            if(albero->left!=NULL)
                return profonditNodo(albero->left, val, ++res);
     }
}
void addAlbero(ramo** albero, ramo* add)
{
    if(add==NULL)
        return;
    addNodo(albero, add->val);
    if(add->left!=NULL)
        addAlbero(albero, add->left);
    if(add->right!=NULL)
        addAlbero(albero, add->right);
}
int existNodo(ramo* albero, int val)
{
    if(albero==NULL)
        return  0;
    if(albero->val==val)
    {
        printf("trovato: %d\n", val);
        return  1;
    }
    else if( (albero->right!=NULL) || (albero->left!=NULL))
    {
        if(val>albero->val)
        {
            if(albero->right!=NULL)
                return existNodo(albero->right, val);
        }
        else if(val<albero->val)
        {
            if(albero->left!=NULL)
                return existNodo(albero->left, val);
        }
     }
     else
        return 0;
}

int ProfonditaUguale(ramo* albero1, ramo* albero2, int profondita)
{
    if(profondita==0)
        return albero1->val==albero2->val;
    else
    {
        int currentprofondita =0;
        if( (albero1->right!= NULL && albero2->right!=NULL) && (albero1->left!= NULL && albero2->left!=NULL) )
        {
            currentprofondita++;
            return ( ProfonditaUgualeAUX(albero1->right,albero2->right, profondita, currentprofondita) &&
                      ProfonditaUgualeAUX(albero1->left,albero2->left, profondita, currentprofondita) );
        }
        else if ( (albero1->right== NULL && albero2->right==NULL) && (albero1->left!= NULL && albero2->left!=NULL ) )
        {
            currentprofondita++;
            return ProfonditaUgualeAUX(albero1->left,albero2->left, profondita, currentprofondita);
        }
         else if ( (albero1->right!= NULL && albero2->right!=NULL) && (albero1->left== NULL && albero2->left==NULL ) )
        {
            currentprofondita++;
            return ProfonditaUgualeAUX(albero1->right,albero2->right, profondita, currentprofondita);
        }
        else
            return 0;
    }
}
int ProfonditaUgualeAUX(ramo* albero1, ramo* albero2, int profondita, int currentprofondita)
{
    if(currentprofondita==profondita)
    {
        return albero1->val==albero2->val;
    }
    else
    {
        if( (albero1->right!= NULL && albero2->right!=NULL) && (albero1->left!= NULL && albero2->left!=NULL) )
        {
            currentprofondita++;
            return ( ProfonditaUgualeAUX(albero1->right,albero2->right, profondita, currentprofondita) &&
                      ProfonditaUgualeAUX(albero1->left,albero2->left, profondita, currentprofondita) );
        }
        else if ( (albero1->right== NULL && albero2->right==NULL) && (albero1->left!= NULL && albero2->left!=NULL ) )
        {
            currentprofondita++;
            return ProfonditaUgualeAUX(albero1->left,albero2->left, profondita, currentprofondita);
        }
         else if ( (albero1->right!= NULL && albero2->right!=NULL) && (albero1->left== NULL && albero2->left==NULL ) )
        {
            currentprofondita++;
            return ProfonditaUgualeAUX(albero1->right,albero2->right, profondita, currentprofondita);
        }
        else
            return 0;
    }
}

void StampaAlbero(ramo* albero)
{
    if(albero==NULL)
        return ;
    if(albero->left!=NULL)
        StampaAlbero(albero->left);

   printf("- %d -", albero->val);

    if(albero->right!=NULL)
         StampaAlbero(albero->right);
}
void fStampaAlbero(ramo* albero)
{
    FILE* fl= fopen("fff3.txt", "w");
    AuxfStampaAlbero(albero, fl);
    printf("File created.\n");
    fclose(fl);
}
void AuxfStampaAlbero(ramo* albero, FILE* fl)
{
    if(albero==NULL)
        return ;
    if(albero->left!=NULL)
        AuxfStampaAlbero(albero->left, fl);

   fprintf(fl,"- %d -",albero->val);

    if(albero->right!=NULL)
         AuxfStampaAlbero(albero->right, fl);
}
