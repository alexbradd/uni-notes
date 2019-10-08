#include <stdio.h>
#include <limits.h>

int main(void)
{
    // ### ES 1 ###
    /* int num; */

    /* printf("Inserisci in numero: "); */
    /* scanf("%d", &num); */

    /* if ((num % 2 != 0) || !(num >= 20) || !(num <= 90)) */
    /*     printf("Vero\n"); */
    /* else */
    /*     printf("Falso\n"); */
    /* return 0; */

    // ### ES2 ###
    /* int num1, num2, */
    /*     risultato, resto; */
    /* printf("Inserire primo numero: "); */
    /* scanf("%d", &num1); */
    /* getchar(); // avoid \n */
    /* printf("Inserire secondo numero: "); */
    /* scanf("%d", &num2); */

    /* risultato = (int) num1 / num2; */
    /* resto = (int) num1 % num2; */
    /* printf("%d diviso %d risulta %d con resto di %d.\n", */
    /*         num1, num2, risultato, resto); */
    /* if (resto == 0){ */
    /*     printf("Resto 0: risultato %d ", risultato); */
    /*     if (risultato % 2 == 0) */
    /*         printf("pari\n"); */
    /*     else */
    /*         printf("dispari\n"); */
    /* } */
    /* return 0; */

    // ### ES 3 ###
    /* int num, */
    /*     n, sum, min, max; */
    /* sum = 0; */
    /* min = INT_MAX; // every int is smaller */
    /* max = INT_MIN; // every int is bigger */
    /* n = 0; */
    /* do { */
    /*     printf("Inserire numero: "); */
    /*     scanf("%d", &num); */
    /*     getchar(); // get rid of \n */
    /*     if (num != 0) { */
    /*         if (num < min) */
    /*             min = num; */
    /*         if (num > max) */
    /*             max = num; */
    /*         sum += num; */
    /*         ++n; */
    /*     } */
    /* } while (num != 0); */
    /* if (n == 0) // only 0 */
    /*     printf("Nessun calcolo da inserire\n"); */
    /* else */
    /*     printf("%d numeri inseriti\nsomma = %d\nmin = %d\nmax = %d\n", */
    /*             n, sum, min, max); */
    /* return 0; */

    // ### ES 4 ###
    /* int n1, n2; */
    /* for (n1 = 1; n1 < 200; n1++){ */
    /*     n2 = n1 + 1; */
    /*     if (((n1 % 3 == 0) || (n1 % 5 == 0)) && ((n2 % 3 == 0) || (n2 % 5 == 0))) */
    /*         printf("(%d, %d)\n", n1, n2); */
    /* } */
    /* return 0; */

    // ### ES 5 ###
    /* float tempc, tempf; */
    /* for (tempc = -20; tempc <= 197; tempc += 7){ */
    /*     tempf = 32 + (tempc * (9.0/5.0)); */
    /*     printf("%7.2f C -> %7.2f F\n", tempc, tempf); */
    /*     if ((tempf - tempc) == 100) */
    /*         printf("\tDifferenza %.2f F - %.2f C = 100\n", tempf, tempc); */
    /* } */
    /* return 0; */

    // ### ES 6 ###
    /* int num1, num2; */
    /* char op; */
    /* printf("Inserisci numero: "); */
    /* scanf("%d", &num1); */
    /* getchar(); // get rid of \n */
    /* printf("Inserisci numero: "); */
    /* scanf("%d", &num2); */
    /* getchar(); // get rid of \n */
    /* printf("Inserisci operazione: "); */
    /* scanf("%c", &op); */
    /* getchar(); // get rid of \n */
    /* switch (op) { */
    /*     case '+': */
    /*         printf("%d + %d = %d", num1, num2, (num1 + num2)); */
    /*         break; */
    /*     case '-': */
    /*         printf("%d - %d = %d", num1, num2, (num1 - num2)); */
    /*         break; */
    /*     case '*': */
    /*         printf("%d * %d = %d", num1, num2, (num1 * num2)); */
    /*         break; */
    /*     case '/': */
    /*         if (num2 != 0) */
    /*             printf("%d / %d = %.2f", num1, num2, ((float) num1 / num2)); */
    /*         else */
    /*             printf("Math error"); */
    /*         break; */
    /*     case 'm': */
    /*         if (num1 < num2) */
    /*             printf("min(%d, %d) = %d", num1, num2, num1); */
    /*         else */
    /*             printf("min(%d, %d) = %d", num1, num2, num2); */
    /*         break; */
    /*     case 'M': */
    /*         if (num1 > num2) */
    /*             printf("MAX(%d, %d) = %d", num1, num2, num1); */
    /*         else */
    /*             printf("MAX(%d, %d) = %d", num1, num2, num2); */
    /*         break; */
    /*     default: */
    /*         printf("Errore: %c non è valida", op); */
    /*         return 1; */
    /* } */
    /* printf("\n"); */
    /* return 0; */

    // ### ES 7 ###
    /* int a, b, mid, x, n; */
    /* int exit = 0; */
    /* printf("Inserisci estremo 1: "); */
    /* scanf("%d", &a); */
    /* getchar(); // get rid of \n */
    /* printf("Inserisci estremo 2: "); */
    /* scanf("%d", &b); */
    /* getchar(); // get rid of \n */
    /* printf("Inserisci numero da cercare: "); */
    /* scanf("%d", &x); */
    /* getchar(); // get rid of \n */
    /* printf("Inserisci numero di tentativi: "); */
    /* scanf("%d", &n); */
    /* if ((a > b) || !((x >= a) && (x <= b)) || (n <= 0)) */
    /*     printf("Errore"); */
    /* for(int i = 1; (i <= n) && (exit == 0); i++){ */
    /*     mid = (a + b) / 2; */
    /*     printf("Tentativo %d/%d: Cerco %d in [%d, %d]\t a+b/2=%d : ", i, n, x, a, b, mid); */
    /*     if (mid == x) { */
    /*         printf("Trovato!\n"); */
    /*         exit = 1; */
    /*     } else if (x < mid){ */
    /*         printf("Non trovato -  cerco a sx\n"); */
    /*         b = mid; */
    /*     } else { */
    /*         printf("Non trovato -  cerco a dx\n"); */
    /*         a = mid; */
    /*     } */
    /* } */
    /* return 0; */
}
