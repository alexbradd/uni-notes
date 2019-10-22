#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>

#define DIM0 5
#define DIM1 5
#define DIM2 4
#define DIM3 3
#define DIM4 10
#define DIM5 10
#define DIM6 3

bool verify_uniqueness(const int n, const int* arr, const int dim);

int main(void)
{
    // ### ES1 ###
    /* int arr[DIM0], n = 0, input; */
    /* printf("Numero: "); */
    /* scanf("%d", &input); */
    /* while(n < DIM0 && input != 0) { */
    /*     arr[n] = input; */
    /*     n++; */
    /*     printf("Numero: "); */
    /*     scanf("%d", &input); */
    /* } */
    /* for(int i = 0; i < n; i++) */
    /*     printf("%d ", arr[i]); */
    /* printf("\n"); */

    // ### ES2 ###
    /* int arr1[DIM1], arr2[DIM2], input, i, j; */
    /* bool unique = true, out = false; */
    /* for(i = 0; i < DIM1; i++) { */
    /*     printf("Numero array1: "); */
    /*     scanf("%d", &input); */
    /*     unique = verify_uniqueness(input, arr1, DIM1); */
    /*     if (!unique) { */
    /*         printf("Numero non unico, resiserire. "); */
    /*         i--; */
    /*     } else { */
    /*         arr1[i] = input; */
    /*     } */
    /* } */
    /* for(i = 0; i < DIM2; i++) { */
    /*     printf("Numero array2: "); */
    /*     scanf("%d", &input); */
    /*     unique = verify_uniqueness(input, arr2, DIM2); */
    /*     if (!unique) { */
    /*         printf("Numero non unico, resiserire. "); */
    /*         i--; */
    /*     } else { */
    /*         arr2[i] = input; */
    /*     } */
    /* } */
    /* printf("Array 1: "); */
    /* for(i = 0; i < DIM1; i++) */
    /*     printf("%d ", arr1[i]); */
    /* printf("\nArray 2: "); */
    /* for(i = 0; i < DIM2; i++) */
    /*     printf("%d ", arr2[i]); */
    /* printf("\nIntersezione: "); */
    /* for(i = 0; i < DIM1; i++){ */
    /*     out = false; */
    /*     for (j = 0; j < DIM2 && !out; j++) { */
    /*         if (arr1[i] == arr2[j]) { */
    /*             printf("%d ", arr1[i]); */
    /*             out = true; */
    /*         } */
    /*     } */
    /* } */
    /* printf("\n"); */

    // ### ES3 ###
    /* int matrix[DIM3][DIM3], input, fact = 2, i, j; */
    /* for(i = 0; i < DIM3; i++) { */
    /*     for(j = 0; j < DIM3; j++) { */
    /*         printf("Inserisci numero %d;%d: ", i, j); */
    /*         scanf("%d", &input); */
    /*         matrix[i][j] = input; */
    /*     } */
    /* } */
    /* for(i = 0; i < DIM3; i++) { */
    /*     for(j = 0; j < DIM3; j++) */
    /*         matrix[i][j] *= 2; */
    /* } */
    /* for(i = 0; i < DIM3; i++) { */
    /*     for(j = 0; j < DIM3; j++) */
    /*         printf("%d ", matrix[i][j]); */
    /*     printf("\n"); */
    /* } */

    // ### ES4 ###
    /* int i = 0, len = 0; */
    /* char name[DIM4 + 1]; */
    /* scanf("%10s", name); */
    /* for(i = 0; name[i] != '\0'; i++) */
    /*     len++; */
    /* printf("Lunghezza: %d (strlen: %ld)\n", len, strlen(name)); */

    // ### ES5 ###
    /* int arr1[DIM5], arr2[DIM5], arr3[DIM5], used, i; */
    /* do { */
    /*     printf("Quante celle si volgiono utilizzare? (max %d) ", DIM5); */
    /*     scanf("%d", &used); */
    /* } while (used < 1 || used > DIM5); */
    /* srand(time(NULL)); */
    /* for (i = 0; i < used; i++) { */
    /*     arr1[i] = rand() % 10; */
    /*     arr2[i] = rand() % 10; */
    /* } */
    /* for (i = 0; i < used; i++) */
    /*     arr3[i] = arr1[i] + arr2[used - 1 - i]; */
    /* for (i = 0; i < used; i++) */
    /*     printf("%d %d %d\n", arr1[i], arr2[i], arr3[i]); */

    // ### ES6 ###
    /* int matrix[DIM6][DIM6], super_matrix[DIM6*2][DIM6*2], i, j; */
    /* srand(time(NULL)); */
    /* for(i = 0; i < DIM6; i++){ */
    /*     for(j = 0; j < DIM6; j++){ */
    /*         matrix[i][j] = rand() % 10; */
    /*         super_matrix[i][j] = matrix[i][j]; */
    /*     } */
    /* } */
    /* for(i = 0; i < DIM6; i++) { */
    /*     for(j = 0; j < DIM6; j++) */
    /*         super_matrix[i][DIM6*2 - 1 - j] = matrix[i][j]; */
    /* } */
    /* for(i = 0; i < DIM6; i++) { */
    /*     for(j = 0; j < DIM6*2; j++) */
    /*         super_matrix[DIM6*2 - 1 - i][j] = super_matrix[i][j]; */
    /* } */
    /* for(i = 0; i < DIM6*2; i++) { */
    /*     for(j = 0; j < DIM6*2; j++) */
    /*         printf("%d ", super_matrix[i][j]); */
    /*     printf("\n"); */
    /* } */

    // ### ES7 ###


}

bool verify_uniqueness(const int n, const int* array, const int dim)
{
    for (int i = 0; i < dim; i++){
        if (array[i] == n)
            return false;
    }
    return true;
}
