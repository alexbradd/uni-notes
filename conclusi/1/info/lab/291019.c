#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <time.h>

char useless;
#define DISCARD() while((useless = getchar()) != '\n');

#define DIM      10
#define TXTL     20
#define C_LEN    10
#define P_MAX    15
#define NP       5
#define LP       10
#define EN_MAX   5
#define DIM_MARE 5
#define N_NAVI   5

int main(void)
{
    // ### ES1 ###
    /* int mat[DIM][DIM]; */
    /* int sums[DIM] = {0}; */
    /* int i, j, min, line; */
    /* srand(time(NULL)); */
    /* printf("Matrice:\n"); */
    /* for (i = 0; i < DIM; i++) { */
    /*     for (j = 0; j < DIM; j++) { */
    /*         mat[i][j] = rand() % 10; */
    /*         sums[i] += mat[i][j]; */
    /*         printf("%d ", mat[i][j]); */
    /*     } */
    /*     printf("\n"); */
    /* } */
    /* printf("\nSomme:\n"); */
    /* for (i =0; i < DIM; i++) */
    /*     printf("%d ", sums[i]); */
    /* min = sums[0]; */
    /* line = 1; */
    /* for (i = 0; i < DIM; i++) { */
    /*     if (sums[i] < min) { */
    /*         min = sums[i]; */
    /*         line = i + 1; */
    /*     } */
    /* } */
    /* printf("\nSomma minima: %d; riga: %d\n", min, line); */

    // ### ES2 ###
    /* struct met { int year; bool bis; int month; int day; char meteo[TXTL]; } bol; */
	/* int ggmese[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}; */
    /* int i, days = 0; */
    /* bool cont = true; */
    /* printf("Che anno? "); */
    /* scanf("%d", &bol.year); */
    /* bol.bis = (bol.year % 4 == 0 && (bol.year % 100 != 0 || bol.year % 400 == 0)); */
	/* if (bol.bis) { */
		/* printf("Anno bisestile\n"); */
		/* ggmese[1]++; */
	/* } */
    /* DISCARD(); */
    /* do { */
    /*     printf("Che mese? "); */
    /*     scanf("%d", &bol.month); */
		/* DISCARD(); */
    /* } while (bol.month < 1 || bol.month > 12); */
	/* printf("Mese %d OK\n", bol.month); */
    /* do { */
    /*     printf("Che giorno? "); */
    /*     scanf("%d", &bol.day); */
		/* DISCARD(); */
    /* } while (bol.day < 1 || bol.day > ggmese[bol.month -1]); */
	/* printf("Mese %d OK\n", bol.day); */
	/* printf("Meteo? "); */
    /* for(i = 0; i < TXTL && cont; i++) { */
    /*     bol.meteo[i] = getchar(); */
    /*     if (bol.meteo[i] == '\n') { */
    /*         bol.meteo[i] = '\0'; */
    /*         cont = false; */
    /*     } */
    /* } */
    /* bol.meteo[i] = '\0'; */
    /* for (i = 0; i < bol.month - 1; i++) */
    /*     days += ggmese[i]; */
    /* days += bol.day; */
    /* printf("Sono passati %d giorni\n", days); */
    /* printf("Bollettino meteo %d/%d/%d: %s\n", */
    /*         bol.day, bol.month, bol.year, bol.meteo); */

    // ### ES3 ###
    /* int coda[C_LEN]; */
    /* int n = 0, i, j, add; */
    /* srand(time(NULL)); */
    /* for (i = 1; i <= P_MAX; i++) { */
    /*     add = rand() % 2; */
    /*     if (add == 1) { */
    /*         printf("%-10s", "Aggiungo!"); */
    /*         coda[n] = rand() % 10; */
    /*         n++; */
    /*     } else { */
    /*         printf("%-10s", "Rimuovo!"); */
    /*         for (j = 1; j < n; j++) */
    /*             coda[j-1] = coda[j]; */
    /*         if (n > 0) */
    /*             n--; */
    /*     } */
    /*     printf("Stato coda passaggio %2d: ", i); */
    /*     for (j = 0; j < n; j++) */
    /*         printf("%d ", coda[j]); */
    /*     if (n == 0) printf("\n\tQueue vuota!"); */
    /*     printf("\n"); */
    /* } */

    // ### ES4 ###
    /* char parole[NP][LP] = {"cane", "gatto", "gallo", "rana", "ibis"}, */
    /*      input[LP]; */
    /* struct { char parola[LP]; int usati[LP]; char anagramma[LP]; } an; */
    /* int cur = 0, new = 0, wlen, i; */
    /* bool cont = true; */
    /* srand(time(NULL)); */
    /* strcpy(an.parola, parole[rand() % NP]); */
    /* for (int i = 0; i < LP; i++) an.usati[i] = 0; */
    /* wlen = strlen(an.parola); */
    /* while(cont) { */
    /*     new = rand() % wlen; */
    /*     if (an.usati[new] == 0) { */
    /*         an.anagramma[new] = an.parola[cur]; */
    /*         cur++; */
    /*         an.usati[new] = 1; */
    /*     } */
    /*     if (cur == wlen) */
    /*         cont = false; */
    /* } */
    /* an.anagramma[cur] = '\0'; */
    /* printf("Anagramma di %s? ", an.anagramma); */
    /* for(i = 0; i < LP && */
    /*         ((input[i] = getchar()) != '\n' && input[i] != EOF); i++) ; */
    /* input[i] = '\0'; */
    /* if (strcmp(an.parola, input) == 0) */
    /*     printf("Hai indovinato!!\n"); */
    /* else */
    /*     printf("Non hai indovinato!!\n"); */

    // ### ES5 ###
    typedef struct { int x; int y; int en; } nave_t;
    int mare[DIM_MARE][DIM_MARE],
        i, j, u_x, u_y;
    nave_t navi[N_NAVI];
    bool done = false;
    srand(time(NULL));
    for (i = 0; i < DIM_MARE; i++)
        for (j = 0; j < DIM_MARE; j++)
            mare[i][j] = -1;
    for (i = 0; i < N_NAVI; i++) {
        navi[i].x = rand() % DIM_MARE;
        navi[i].y = rand() % DIM_MARE;
        navi[i].en = rand() % EN_MAX;
        if (mare[navi[i].x][navi[i].y] != -1)
            i--;
        else
            mare[navi[i].x][navi[i].y] = i;
    }
    for (i = 0; !done; i++) {
        u_x = rand() % DIM_MARE;
        u_y = rand() % DIM_MARE;
        if (mare[u_x][u_y] == -1) {
            printf("Acqua!\n");
        } else {
            if (navi[mare[u_x][u_y]].en <= 0) {
                mare[u_x][u_y] = -1;
                printf("Nave affondata in (%d;%d)\n", u_x, u_y);
            } else {
                navi[mare[u_x][u_y]].en--;
                printf("Nave colpita in (%d;%d)\n", u_x, u_y);
            }
        }
        done = true;
        for (j = 0; j < N_NAVI; j++)
            if (navi[j].en != 0)
                done = false;
    }
    printf("Affondato tutte le navi in %d colpi\n", i);
    return 0;
}
