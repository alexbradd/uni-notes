#include <stdio.h>
#include <stdlib.h>

#define discard for (; getchar() != '\n';) ;

int main(void)
{
    char g1,
         g2;

    printf("Giocatore 1? ");
    scanf("%c", &g1);
    /* discard until newline */
    discard;
    printf("Giocatore 2? ");
    scanf("%c", &g2);

    switch (g1){
        case 'c':
            if (g2 == 'c') {
                printf("Pari\n");
            } else if (g2 == 'f') {
                printf("Vince giocatore 2\n");
            } else if (g2 == 's') {
                printf("Vince giocatore 1\n");
            } else
                printf("???\n");
            break;
        case 'f':
            if (g2 == 'c') {
                printf("Vince giocatore 1\n");
            } else if (g2 == 'f') {
                printf("Pari\n");
            } else if (g2 == 's') {
                printf("Vince giocatore 2\n");
            } else
                printf("???\n");
            break;
        case 's':
            if (g2 == 'c') {
                printf("Vince giocatore 2\n");
            } else if (g2 == 'f') {
                printf("Vince giocatore 1\n");
            } else if (g2 == 's') {
                printf("Pari\n");
            } else
                printf("???\n");
            break;
        default:
            printf("???\n");
    }
}
