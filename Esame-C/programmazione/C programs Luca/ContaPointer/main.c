#include <stdio.h>
#include <stdlib.h>

int main()
{
    int * p = (int*)malloc(sizeof(int));
    int i=0;
    while(i<8)
    {
        printf("scrivi: %d\n", i);
        *(p+i)=i;
        i++;
    }
    i=0;
    while(i<8)
    {
         printf("val: %d\n", *(p+i));
         i++;
    }
    return 0;

}
