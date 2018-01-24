#ifndef RES_H_INCLUDED
#define RES_H_INCLUDED

typedef struct element
{
   int info;
   struct element *sx, *dx;
} tree;

typedef struct list
{
   tree *info;
   struct list  *next;
} expressionsList;

typedef struct element1
{
   tree *info;
   struct element1 *sx, *dx;
} expressionsTree;

void printAbr(tree *abr);
void createABR(expressionsList* list,  expressionsTree** exTree);
void insertTree(expressionsTree** exTree, tree* add);
int resolve(tree* t);

#endif // RES_H_INCLUDED
