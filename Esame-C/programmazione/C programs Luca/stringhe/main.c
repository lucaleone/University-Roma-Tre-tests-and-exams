#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Hello world!\n");
    char res ='y';
    while(res=='y')
    {
        char* ins="";
        scanf(" %s",ins);
        insertString(ins);
        printf("vuoi inserire un'altra stringa\n");
        scanf(" %c",res);
    }
    return 0;
}

struct nodo
{
    char* info;
    struct nodo * next;
};

void insertString(char* s)
{

}
