#include <stdio.h>
#include <stdlib.h>

int main(void){
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
}
