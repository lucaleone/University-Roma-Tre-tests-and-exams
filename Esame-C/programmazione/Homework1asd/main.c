#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Hello world!\n");
    //int **mat1= {{5,8},{7,2}};
    //printf("elem: %d\n", &(&mat1[0])[0]   );
    int *mat1[]= {5,8};
    printf("elem: %d\n", (mat1[0]+1));
    //test(**mat1);
    /*int mat[3][4] =
    {
        {1,2,3,4},
        {5,6,7,8},
        {9,10,11,12}
    };*/
    //printf("max: %d\n", **mat);*/
    //valore_massimo(**mat, 3, 4);
    return 0;
}

void test (int **a)
{
    int t = a;
    printf("elem: %d\n", t);
}
/* scrivi qui il codice della funzione valore_massimo che ritorna
il valore massimo della matrice A di interi con r righe e c colonne */

int valore_massimo(int **A, int r, int c)
{
    int max = A[0][0];//&(&A[0])[0];
    int row, col;
    for (row=0; row < r; row++)
    {
        for (col=0; col < c; col++)
        {
            if(A[row][col] > max)//(&(&A[row])[col]>max)
                max = A[row][col];//&(&A[row])[col];
        }
    }
    return max;
}
