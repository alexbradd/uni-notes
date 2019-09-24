#include <stdio.h>
#include <stdlib.h>

int main(void){
    int input, resto;

    printf("Inserisci un intero: ");
    scanf("%d", &input);

    resto = input % 2;

    if (resto == 0)
        printf("Il numero è pari\n");
    else
        printf("Il numero è dispari\n");

    return 0;
}
