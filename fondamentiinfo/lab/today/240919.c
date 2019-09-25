#include <stdio.h>
#include <stdlib.h>

#define discard for (; getchar() != '\n';) ;

/* cmd args example
int main (int argc, char* argv[])
{
    printf("Arguments: %d\n", argc);
    for (int i = 0; i < argc; i++)
        printf("Argument: %s\n", argv[i]);
    return 0;
}*/
/* Es 1
int main(void)
{
    int input, resto;

    printf("Inserisci un intero: ");
    scanf("%d", &input);

    resto = input % 2;

    if (resto == 0)
        printf("Il numero è pari\n");
    else
        printf("Il numero è dispari\n");

    return 0;
}*/
/* Es 2
int main(void)
{
    char stagione;
    float temp;

    printf("Inserisci stagione: ");
    scanf("%c", &stagione);
    fflush(stdin);
    printf("Inserisci la temperatura: ");
    scanf("%f", &temp);

    switch (stagione) {
        case 'e':
            if ((temp >= 27.5) && (temp <= 32.5))
                printf("La temperatura estiva è nella media\n");
            else
                printf("La temperatura estiva non è nella media\n");
            break;
        case 'i':
            if ((temp >= 2.5) && (temp <= 7.5))
                printf("La temperatura invernale è nella media\n");
            else
                printf("La temperatura estiva non è nella media\n");
            break;
        default:
            printf("Non so che stagione sia\n");
    }
    return 0;
}*/
/* Es 3
int main(void)
{
    char g1,
         g2;

    printf("Giocatore 1? ");
    scanf("%c", &g1);
    // discard until newline
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
}*/
