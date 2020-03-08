#include <stdio.h>
#define dimM 10

int vet[dimM]={100,101,102,103,104,105,106,107,108,109};
int A=6, i;
int *p[5], *V;

void main() {
    for (i = 0; i < 5; i++)
        p[i] = &A;

    V = vet + 1;
    p[3] = &V[5];
    p[2] = &V[A];
    p[4] = V - 1;

    for (i = 0; i < 4; i++)
        *p[i+1] = i + 5;

    for (i=0; i<dimM - 1; i++)
        printf("%d - ", *(V+i));
    printf("\n");
    for (i=0; i<5; i++)
        printf("%d - ", **(p+i));
    printf("\n");
    for (i=0; i<dimM; i++)
        printf("%d - ", vet[i]);
    printf("\n%d", A);
}

/* A    5
 * v    8   101 102 103 104 105 7   6   108 109
 * p    A   A   v 7 v 6 v 0
 * V    v 1 v 2 v 3 v 4 v 5 v 6 v 7 v 8 v 9
 */
