#ifndef ALBERO_H_INCLUDED
#define ALBERO_H_INCLUDED
typedef struct el1{
    int info;
     struct el1* dx;
    struct el1* sx;
}Albero;
typedef struct el{
    Albero* info;
    struct el* next;
}Lista;
typedef struct el2{
    Albero* info;
    struct el2* dx;
    struct el2* sx;
}ListAlbero;
#endif // ALBERO_H_INCLUDED
