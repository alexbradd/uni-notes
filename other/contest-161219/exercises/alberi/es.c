#include <stdio.h>
#include <stdlib.h>

#define MAX 10

typedef enum { FALSE, TRUE } bool_t;
typedef struct {
    int colore;
    bool_t albero;
} el;

void get_dim(int *dimensione);
void get_colore(el griglia[MAX][MAX], int dimensione);
void get_n_alberi(int *alberi, int dimensione);
void get_coordinate_alberi(el griglia[MAX][MAX], int dimensione, int alberi);

int checkGriglia(el map[MAX][MAX], int dim, int n_alberi);
int checkRiga(el map[MAX][MAX], int dim, int riga);
int checkColonna(el map[MAX][MAX], int dim, int colonna );
int checkColore(el map[MAX][MAX], int dim, int colore_da_cercare );
int checkDistanza(el map[MAX][MAX], int dim);

int main(void)
{
    int dimensione, alberi;
    el griglia[MAX][MAX];

    /* carica matrice */
    get_dim(&dimensione);
    get_colore(griglia, dimensione);
    get_n_alberi(&alberi, dimensione);
    get_coordinate_alberi(griglia, dimensione, alberi);
    /* check matrice */
    if (checkGriglia(griglia, dimensione, alberi) == 1) {
        printf("1\n");
        return 0;
    } else {
        printf("0\n");
        return 1;
    }
}

void get_dim(int *dimensione)
{
    scanf("%d", dimensione);
    if (*dimensione > 10) {
        printf("0\n");
        exit(1);
    }
    getchar();
}

void get_colore(el griglia[MAX][MAX], int dimensione)
{
    int i, j, c, c2;

    for (i = 0; i < dimensione; i++) {
        for (j  = 0; j < dimensione; j++) {
            c = getchar();
            if (c == '-') {
                c = getchar();
                if (c < '0' || c > '9') { /* errore */
                    printf("0\n");
                    exit(1);
                }
                griglia[i][j].colore = -(c - '0');
            } else if (c >= '0' && c <= '9') { /* c è un numero */
                griglia[i][j].colore = c - '0';
            } else {
                printf("0\n");
                exit(1);
            }
        }
        c = getchar();
        if (c != '\n') {
            printf("0\n");
            exit(1);
        }
    }
}

void get_n_alberi(int *alberi, int dimensione)
{
    scanf("%d", alberi);
    if (*alberi <= 0 && *alberi > dimensione * dimensione) {
        printf("0\n");
        exit(1);
    }
}

void get_coordinate_alberi(el griglia[MAX][MAX], int dimensione, int alberi)
{
    int i, j, x_albero, y_albero;
    for (i = 0; i < dimensione; i++) /* inizializza alberi */
        for (j = 0; j < dimensione; j++)
            griglia[i][j].albero = FALSE;
    for (i = 0; i < alberi; i++) {
        scanf("%d%d", &x_albero, &y_albero);
        if ((x_albero < 0 || x_albero > dimensione) &&
            (y_albero < 0 || y_albero > dimensione)) {
            printf("0\n");
            exit(1);
        }
        griglia[x_albero][y_albero].albero = TRUE;
    }
}

int checkGriglia(el map[MAX][MAX], int dim, int tot_alberi){
	int i, j=0, k, count=0, col[MAX]={10}, trovato, n_alberi=0;

	if(dim<=5)
        n_alberi=1;
	else
        n_alberi=2;

	if(checkDistanza(map, dim)!=0)
		return -4;

	if(dim>5){
		for(i=0; i<dim; i++){
			if(checkRiga(map, dim, i)!=n_alberi)
				return -1;
			if(checkColonna(map, dim, i)!=n_alberi)
				return -2;
			for(j=1; j<dim; j++){
				trovato=0;
				for(k=0; col[k]!=10; k++){
					if(map[i][j].colore == col[k])
						trovato=1;
				}
				if(trovato==0){
					if(checkColore(map, dim, map[i][j].colore) != n_alberi)
						return -3;
					else {
						col[k]=map[i][j].colore;
						count++;
					}
				}
			}
		}
	}
	return 1;
}

int checkRiga(el map[MAX][MAX], int dim, int riga)
{
    int j;
    int counter = 0;

    for(j = 0; j < dim; j++)
        if( map[riga][j].albero == TRUE )
            counter++;
    return counter;
}

int checkColonna(el map[MAX][MAX], int dim, int colonna )
{
    int i;
    int counter = 0;

    for(i = 0; i < dim; i++)
        if( map[i][colonna].albero == TRUE )
            counter++;
    return counter;
}

int checkColore(el map[MAX][MAX], int dim, int colore_da_cercare )
{
    int i, j;
    int counter = 0;
    el *temp;

    for(i = 0; i < dim; i++) {
        for(j = 0; j < dim; j++) {
            temp = &map[i][j];
            if(temp->colore == colore_da_cercare && temp->albero == TRUE)
                counter++;
        }
    }
    return counter;
}

int checkDistanza(el map[MAX][MAX], int dim)
{
    int i, j;
    for(i = 0; i < dim; i++) {
        for(j = 0; j < dim; j++) {
            if(map[i][j].albero == TRUE) {
                if(i-1 >= 0 && map[i-1][j].albero == TRUE)
                    return -1;
                else if(i+1 < dim && map[i+1][j].albero == TRUE)
                    return -1;
                else if(j-1 >= 0 && map[i][j-1].albero == TRUE)
                    return -1;
                else if(j+1 < dim && map[i][j+1].albero == TRUE)
                    return -1;
                else
                    return 0;
            }
        }
    }
    return -1;
}
