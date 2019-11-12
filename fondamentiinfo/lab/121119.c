#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* #define MAT_DIM 2 Per es 2*/
#define MAT_DIM 3
#define STR_LEN 50

typedef float t_matrice[MAT_DIM][MAT_DIM];

float conversione(float in);
int genera_matrice(int mat[MAT_DIM][MAT_DIM], int *sum);
void getindex(char str[STR_LEN + 1], int from, char delim, int *index);
void estrazione(char result[STR_LEN + 1], char orig[STR_LEN + 1], char delim);
void calcola(t_matrice matr_media, int matr_orig[MAT_DIM][MAT_DIM]);
float media(int matr_orig[MAT_DIM][MAT_DIM], int i, int j);
int dentro(int x, int y);

int main(void)
{
    // ### ES1 ###
    /* float input; */
    /* printf("Inserisci una temperatura in F: "); */
    /* scanf("%f", &input); */
    /* printf("%.3f F = %.3f C\n", input, conversione(input)); */

    // ### ES2 ###
    /* int det, sum, mat[MAT_DIM][MAT_DIM], i, j; */
    /* det = genera_matrice(mat, &sum); */
    /* for (i = 0; i < MAT_DIM; i++) { */
    /*     for (j = 0; j < MAT_DIM; j++) */
    /*         printf("%d ", mat[i][j]); */
    /*     printf("\n"); */
    /* } */
    /* printf("Det: %d, Sum; %d\n", det, sum); */

    // ### ES3 ###
    /* int i; */
    /* char delim, str[STR_LEN + 1], splice[STR_LEN + 1], c; */
    /* printf("Inserisci 1 carattere delimitatore: "); */
    /* delim = getchar(); */
    /* for (; getchar() != '\n' && getchar() != EOF;) ; */
    /* printf("Inserisci la stringa: "); */
    /* for (i = 0; (c = getchar()) != '\n' && c != EOF && i <= STR_LEN; i++) */
    /*     str[i] = c; */
    /* str[i] = '\0'; */
    /* estrazione(splice, str, delim); */
    /* printf("Orig: \"%s\" | Splice: \"%s\" | Delim: \"%c\"\n", str, splice, delim); */

    // ### ES4 ###
    int mat[MAT_DIM][MAT_DIM], i, j;
    t_matrice media;
    srand(time(NULL));
    for (i = 0; i < MAT_DIM; i++) {
        for (j = 0; j < MAT_DIM; j++) {
            mat[i][j] = rand() % 100;
            printf("%d ", mat[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    calcola(media, mat);
    for (i = 0; i < MAT_DIM; i++) {
        for (j = 0; j < MAT_DIM; j++)
            printf("%.2f ", media[i][j]);
        printf("\n");
    }
    return 0;
}

float conversione(float in) { return ((in - 32) * 5.0 / 9.0); }
int genera_matrice(int mat[MAT_DIM][MAT_DIM], int *sum)
{
    int i, j;
    *sum = 0;
    srand(time(NULL));
    for(i = 0; i < MAT_DIM; i++) {
        for (j=0; j < MAT_DIM; j++) {
            mat[i][j] = rand() % 10;
            *sum += mat[i][j];
        }
    }
    return mat[0][0] * mat[1][1] - mat[0][1] * mat[1][0];
}
void getindex(char str[STR_LEN + 1], int from, char delim, int *index)
{
    int i;
    for (i = from; i <= STR_LEN; i++) {
        if (str[i] == delim) {
            *index = i;
            return;
        }
    }
}
void estrazione(char result[STR_LEN + 1], char orig[STR_LEN + 1], char delim)
{
    int start = -1, end = -1, i;
    getindex(orig, 0, delim, &start);
    if (start == -1) {
        result[0] = '\0';
        return;
    }
    getindex(orig, start + 1, delim, &end);
    if (end == -1) {
        result[0] = '\0';
        return;
    }
    for (i = start + 1; i < end; i++)
        result[i - start - 1] = orig[i];
    result[i - start - 1] = '\0';
}
void calcola(t_matrice mat_media, int mat_orig[MAT_DIM][MAT_DIM])
{
    int i, j;
    for (i = 0; i < MAT_DIM; i++)
        for (j = 0; j < MAT_DIM; j++)
            mat_media[i][j] = media(mat_orig, i, j);
}
float media(int mat_orig[MAT_DIM][MAT_DIM], int i, int j)
{
    int sum = 0, n = 0, off_i, off_j;
    for (off_i = -1; off_i < 2; off_i++) {
        for (off_j = -1; off_j < 2; off_j++) {
            if (!(off_i == off_j && off_i ==  0)){
                if (dentro(i - off_i, j - off_j)) {
                    sum += mat_orig[i - off_i][j - off_j];
                    n++;
                }
            }
        }
    }
    return ((float)sum) / n;
}
int dentro(int i, int j)
{ return (i >= 0 && i  < MAT_DIM) && (j >= 0 && j < MAT_DIM); }
