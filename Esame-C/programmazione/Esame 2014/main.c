#include <stdio.h>
#include <stdlib.h>
#include "Albero.h"


int main()
{
    printf("Hello world!\n");

    Albero *myAlbero = (Albero*)  malloc(sizeof(Albero));
    myAlbero->val= 15;

    myAlbero->left = (Albero*)malloc(sizeof(Albero));
    myAlbero->left->val=10;
    myAlbero->left->left = (Albero*)malloc(sizeof(Albero));
    myAlbero->left->left->val=8;
    myAlbero->left->left->left = (Albero*)malloc(sizeof(Albero));
    myAlbero->left->left->left->val=5;
    myAlbero->left->left->left->left=NULL;
    myAlbero->left->left->left->right=NULL;
    myAlbero->left->left->right = (Albero*)malloc(sizeof(Albero));
    myAlbero->left->left->right->val = 9;
    myAlbero->left->left->right->right=NULL;
    myAlbero->left->left->right->left=NULL;
    myAlbero->left->right=NULL;

    myAlbero->right=(Albero*)malloc(sizeof(Albero));
    myAlbero->right->val = 25;
    myAlbero->right->right=NULL;
   /* myAlbero->right->right=(Albero*)malloc(sizeof(Albero));
    myAlbero->right->right = 29;
    myAlbero->right->right->left=(Albero*)malloc(sizeof(Albero));;
        printf("5515");*/
    //myAlbero->right->right->right=NULL;
    myAlbero->right->left= (Albero*)malloc(sizeof(Albero));
    myAlbero->right->left->val = 19;
    myAlbero->right->left->left=NULL;
    myAlbero->right->left->right=NULL;

printf("dase creata");
    ModificaFile(myAlbero, "data.txt");
    printf("\n\nfine");
    return 0;
}

