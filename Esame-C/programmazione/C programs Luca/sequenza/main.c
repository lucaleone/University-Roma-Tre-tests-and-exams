#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct elem {
char abbr[2];
char *estesa;
struct elem *next;
};

struct elem* abbrs;

int main()
{

}

int control(struct elem* a, char* ab, char* est)
{
    int res = 1;
    while(a!=NULL)
    {
        if(strncmp(a->abbr,ab,2)==0 &&  strncmp(a->estesa, est,2)==0)
          {
              res=0;
              break;
          }
          else if(strncmp(a->abbr,ab,2)==0 && strncmp(a->estesa, est,2)>0)
          {
              res=2;
              break;
          }
          a=a->next;
    }
}

int main2()
{
    printf("start!\n");
    int seq[27]={1,9,1,2,1,8,2,4,6,2,7,9,4,5,8,6,3,4,7,5,3,9,6,8,3,5,7};
    int pref[9]={0};
    int i = 0 ;
    int res=1;
    while(i<27)
    {
        switch(seq[i])
        {
            case 1: pref[0]++; break;
            case 2: pref[1]++; break;
            case 3: pref[2]++; break;
            case 4: pref[3]++; break;
            case 5: pref[4]++; break;
            case 6: pref[5]++; break;
            case 7: pref[6]++; break;
            case 8: pref[7]++; break;
            case 9: pref[8]++; break;
        }
            printf("%d\n",i);
        i++;
    }

    i=0;
    while(i<9)
    {
        if(pref[i]!=3)
        {
            printf("res: %d || %d", pref[i],i);
            res=0;
            break;
        }
        i++;
    }
    printf("res: %d", res);


    return 0;
}
