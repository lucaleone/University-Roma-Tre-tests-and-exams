#ifndef LISTAALBERI_H_INCLUDED
#define LISTAALBERI_H_INCLUDED
typedef struct AlbNode
{
    ramo* albero;
    struct AlbNode* next;
}listaAlberi;

ramo* CreateAlberoFromList(listaAlberi *);
void removeNodeFromList(listaAlberi**, ramo*);
#endif // LISTAALBERI_H_INCLUDED
