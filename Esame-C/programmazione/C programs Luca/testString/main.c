#include <stdio.h>
#include <stdlib.h>


char *reverseStr(char * c)
{
    int length=0;
    while(*(c+length))
        length++;

    printf("%d\n", length);
    char *res ;
    res=(char *) malloc(sizeof(char )*length);
    int i;
    for(i=0; length>0; length--, i++)
    {
        printf("%c\n", c[length-1]);
        res[i] = c[length-1];
    }
    return res;
}
int main()
{

    char *tt= "ciaoo";
    char * res ;
    res= reverseStr(tt);
    printf("string invertita:%s dada\n", res);
    return 0;
}
int strcmp(char *s, char *t)
{
    int i;
    for (i = 0; s[i] == t[i]; i++)
        if (s[i] == '\0')
            return 0;
    return s[i] - t[i];
}
