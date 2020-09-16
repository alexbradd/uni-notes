#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

/* #define MAT_DIM 2 Per es 2*/
#define MAT_DIM   3
#define DIM       10
#define SOGLIA    10
#define STR_LEN   50
#define DIMV      100
#define RANGE     10

typedef float t_matrice[MAT_DIM][MAT_DIM];
typedef struct {
    int v_pari[DIM];
    int n_pari;
    int v_dispari[DIM];
    int n_dispari;
} s_risultato;

float conversione(float in);

int genera_matrice(int mat[MAT_DIM][MAT_DIM], int *sum);

void getindex(char str[STR_LEN + 1], int from, char delim, int *index);
void estrazione(char result[STR_LEN + 1], char orig[STR_LEN + 1], char delim);

void calcola(t_matrice matr_media, int matr_orig[MAT_DIM][MAT_DIM]);
float media(int matr_orig[MAT_DIM][MAT_DIM], int i, int j);
int dentro(int x, int y);

void stampavet(const int vet[DIM], int dim);
void inserisci(int vet[DIM], int pos, int val);
s_risultato analisi(int vet[DIM], int *sotto_s);

int memorizza_univ(int quantita);
// void stampavet(const int vet[DIMV], int dim);
int find_in(int vet[DIMV], int to_find, int dim);
void shift(int vet[DIMV], int from, int dim);

int memorizza_ord(int sommafinale);
void merge_sort(int vet[], int l, int r);
void merge(int vet[], int l, int m, int r);
// void stampavet(const int vet[DIMV], int dim);

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
    /* int mat[MAT_DIM][MAT_DIM], i, j; */
    /* t_matrice media; */
    /* srand(time(NULL)); */
    /* for (i = 0; i < MAT_DIM; i++) { */
    /*     for (j = 0; j < MAT_DIM; j++) { */
    /*         mat[i][j] = rand() % RANGE; */
    /*         printf("%d ", mat[i][j]); */
    /*     } */
    /*     printf("\n"); */
    /* } */
    /* printf("\n"); */
    /* calcola(media, mat); */
    /* for (i = 0; i < MAT_DIM; i++) { */
    /*     for (j = 0; j < MAT_DIM; j++) */
    /*         printf("%.2f ", media[i][j]); */
    /*     printf("\n"); */
    /* } */

    // ### ES5 ###
    /* int vet[DIM], i, sotto_s; */
    /* s_risultato ris; */

    /* srand(time(NULL)); */
    /* for (i = 0; i < DIM; i++) */
    /*     vet[i] = rand() % RANGE; */
    /* printf("Vettore orig: "); */
    /* stampavet(vet, DIM); */
    /* pritnf("\n"); */
    /* ris = analisi(vet, &sotto_s); */
    /* printf("Vettore pari: "); */
    /* stampavet(ris.v_pari, ris.n_pari); */
    /* printf("\nVettore dispari: "); */
    /* stampavet(ris.v_dispari, ris.n_dispari); */
    /* pritnf("\n"); */

    // ### ES6 ###
    /* int quanti, eliminati; */
    /* printf("Quanti? "); */
    /* scanf("%d", &quanti); */
    /* eliminati = memorizza_univ(quanti); */
    /* printf("Eliminato %d\n", eliminati); */

    // ### ES7 ###
    int max, gen;
    srand(time(NULL));
    do {
        printf("Max? ");
        scanf("%d", &max);
    } while(max <= 0);
    gen = memorizza_ord(max);
    printf("Generati %d\n", gen);
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
            mat[i][j] = rand() % RANGE;
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
int dentro(int i, int j) { return (i >= 0 && i < MAT_DIM) && (j >= 0 && j < MAT_DIM); }

void stampavet(const int vet[DIM], int n) { for(int i = 0; i < n; i++) printf("%d ", vet[i]); }
void inserisci(int vet[DIM], int pos, int val) { vet[pos] = val; }
s_risultato analisi(int vet[DIM], int *sotto_s)
{
    int i, i_p, i_d;
    s_risultato ris;
    ris.n_pari = 0;
    ris.n_dispari = 0;
    for (i = 0, i_p = 0, i_d = 0; i < DIM; i++) {
        if (vet[i] < SOGLIA) {
            (*sotto_s)++;
            if (vet[i] % 2 == 0) {
                inserisci(ris.v_pari, i_p, vet[i]);
                i_p++;
                ris.n_pari++;
            } else {
                inserisci(ris.v_dispari, i_d, vet[i]);
                i_d++;
                ris.n_dispari++;
            }
        }
    }
    return ris;
}

int memorizza_univ(int quantita)
{
    int eliminati = 0, vet[RANGE + 1], last = 0, randi, dup = 0;
    for (;quantita > 0; quantita--) {
        randi = rand() % RANGE;
        dup = find_in(vet, randi, last);
        if (dup != -1) {
            printf("Duplicato: %d@%d. Vettore originale: ", randi, dup);
            stampavet(vet, last);
            shift(vet, dup, last);
            last--;
            eliminati++;
            printf(" | Vettore pulito: ");
            stampavet(vet, last);
            printf("\n");
        }
        vet[last++] = randi;
    }
    printf("Creato vettore: ");
    stampavet(vet, last);
    printf("\n");
    return eliminati;
}
int find_in(int vet[DIMV], int to_find, int dim)
{
    for (int i = 0; i < dim; i++)
        if (vet[i] == to_find)
            return i;
    return -1;
}
void shift(int vet[DIMV], int from, int dim) { for (int i = from; i < dim - 1; i++) vet[i] = vet[i + 1]; }

int memorizza_ord(int sommafinale)
{
    int vet[DIMV], i, parzsum = 0, randi;
    for(i = 0; i < DIMV && parzsum <= sommafinale; i++) {
        randi = rand() % RANGE;
        vet[i] = randi;
        merge_sort(vet, 0, i);
        parzsum += randi;
        printf("Generato e aggiunto %d. Vettore: ", randi);
        stampavet(vet, i + 1);
        printf(" | Somma parziale: %d\n", parzsum);
    }
    printf("Generato: ");
    stampavet(vet, i);
    printf("\n");
    return i;
}
void merge_sort(int vet[], int l, int r)
{
    int m;
    if (l < r) {
        m = (l+r)/2;
        merge_sort(vet, l, m);
        merge_sort(vet, m+1, r);
        merge(vet, l, m, r);
    }
}
void merge(int vet[], int l, int m, int r)
{
    int n1 = m - l + 1,
        n2 = r - m,
        i, j, k,
        L[n1], R[n2];
    for (i = 0; i < n1; i++)
        L[i] = vet[l + i];
    for (j = 0; j < n2; j++)
        R[j] = vet[m + 1 + j];

    for (i = 0, j = 0, k = l; i < n1 && j < n2; k++) {
        if (L[i] <= R[j])
            vet[k] = L[i++];
        else
            vet[k] = R[j++];
    }
    for (; i < n1; i++, k++) vet[k] = L[i];
    for (; j < n2; j++, k++) vet[k] = R[j];
}
