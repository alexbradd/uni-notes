#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

#define DISCARD_CHARS while (( c = getchar() ) != '\n') {}
#define DIM_PIT 10
#define FIG_SIZE 7
#define SUP 10
#define UNTIL 7

char c;

int main(void)
{
    // ### ES1 ###
    /* int tot = 0, */
    /*     num, i; */
    /* do { */
    /*     printf("Quanti asterischi vuoi inserire? "); */
    /*     scanf("%d", &num); */
    /*     if (num > 0) { // fixes minor whitespace issue */
    /*         for (i = 0; i < num; i++) */
    /*             putchar('*'); */
    /*         putchar('\n'); */
    /*         tot += num; */
    /*         DISCARD_CHARS; */
    /*     } */
    /* } while(num != 0); */
    /* printf("Stampati %d asterischi\n", tot); */

    // ### ES2 ###
    /* int row = 1, */
    /*     column = 1, */
    /*     num = 0; */
    /* printf("    ");                                 // Start drawing header */
    /* for(int i = 1; i <= DIM_PIT; i++) */
    /*     printf("%4d ", i); */
    /* printf("\n"); */
    /* for(int i = 0; i < (5 * (DIM_PIT + 1)); i++) */
    /*     printf("-"); */
    /* printf("\n");                                   // finished header */
    /* for( ; row <= DIM_PIT; row++){                  // start drawing table */
    /*     printf("%3d|", row); */
    /*     for ( ; column <= DIM_PIT; column++){ */
    /*         num = row * column; */
    /*         if (num % 35 == 0) */
    /*             printf("%4d*", row*column); */
    /*         else */
    /*             printf("%4d ", row*column); */
    /*     } */
    /*     printf("\n"); */
    /*     column = 1; */
    /* }                                               // finished drawing table */

    // ### ES3 ###
    /* int n1, n2; */
    /* char gl1 = '-', */
    /*      gl2 = '+', */
    /*      sep = '*'; */
    /* for(int i = FIG_SIZE; i > 0; i--) { */
    /*     for (n1 = 0; n1 < (FIG_SIZE - i); n1++) */
    /*         putchar(gl1); */
    /*     putchar(sep); */
    /*     for (n2 = n1 + 1; n2 < FIG_SIZE; n2++) */
    /*         putchar(gl2); */
    /*     putchar('\n'); */
    /* } */

    // ### ES4 ###
    /* int max_tot = 20, */
    /*     max_semi = 10, */
    /*     even_uneven_diff = 2, */
    /*     evens = 0, */
    /*     unevens = 0, */
    /*     nums = 0, */
    /*     num = 0; */
    /* _Bool loop = true; */
    /* srand(time(NULL)); */
    /* while (loop) { */
    /*     if (nums >= max_tot) */
    /*         loop = false; */
    /*     if  ((nums >= max_semi) && ((evens - unevens) >= even_uneven_diff)) */
    /*         loop = false; */
    /*     if (loop) { */
    /*         num = rand() % 100; */
    /*         nums++; */
    /*         printf("Generato %2d,\tnumeri generati %3d;", num, nums); */
    /*         if (num % 2 == 0) */
    /*             evens++; */
    /*         else */
    /*             unevens++; */
    /*         printf("\ttotale di pari:%3d\ttotale di dispari:%3d\n", evens, unevens); */
    /*     } */
    /* } */

    // ### ES5 ###
    /* int num, */
    /*     sum; */
    /* _Bool even = true, */
    /*       other_even = true; */
    /* for (num = 1; num <= SUP; num++) { */
    /*     even = (num % 2 == 0); */
    /*     printf("X = %d, ", num); */
    /*     if (even) */
    /*         printf("pari,\t"); */
    /*     else */
    /*         printf("dispari,\t"); */
    /*     printf("somma = "); */
    /*     sum = 0; */
    /*     for (int i = num + 1; i < (num + UNTIL); i++) { */
    /*         other_even = (i % 2 == 0); */
    /*         if ((even && other_even) || (!even && !other_even)){ */
    /*             sum += i; */
    /*             printf("%2d", i); */
    /*             if (i < (num + UNTIL - 1)) // formatting */
    /*                 printf(" + "); */
    /*         } */
    /*     } */
    /*     printf(" = %2d\n", sum); */
    /* } */

    // ### ES6 ###



}

