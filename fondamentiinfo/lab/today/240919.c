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
    return 0;
}*/
/* Es 4
int main(void)
{
	int input;
    printf("Numero? ");
    scanf("%d", &input);
    
    printf("Tabellina del numero %d:\n", input);
    for (int i = 0; i <= 10; i++)
    	printf("%d x %d = %d; ", input, i, (input * i));
    	
    printf("\n");
    return 0;
	
}*/
/* Es 5
int main(void)
{
	int input1 = 0, 
		input2 = 0,
		n = 0, 
		sum = 0;
	float avg = 0;
	
	printf("Numero 1? ");
    scanf("%d", &input1);
    discard;
	printf("Numero 2? ");
    scanf("%d", &input2);
    
    avg = (input1 + input2) / 2;
    while ((n + input1) <= input2){
    	sum += input1 + n; // prima dell'incremento sennò salta un numero
    	++n;
    }
    
    printf("Intervallo [%d, %d]: n = %d; somma = %d; media = %f\n", 
    		input1, input2, n, sum, avg);
    return 0;
}*/
