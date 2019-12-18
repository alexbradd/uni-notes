#include <stdio.h>
#include <stdlib.h>

#define MAX      10
#define MAX_C    14

#define EXT_DIM  4

#define SOPRA    0
#define DESTRA   1
#define SOTTO    2
#define SINISTRA 3

int leggi_file(FILE *fd, int matrice[MAX][MAX], int esterni[EXT_DIM][MAX], int *dim);

int topcolonna(int dim, int v[MAX], int mat[MAX][MAX]);
int botcolonna(int dim, int v[MAX], int mat[MAX][MAX]);
int rightriga(int dim, int v[MAX], int mat[MAX][MAX]);
int leftriga(int dim, int v[MAX], int mat[MAX][MAX]);

int checkriga(int dim, int mat[MAX][MAX]);
int checkcolonna(int dim, int mat[MAX][MAX]);

int main(void)
{
    char nome_file[MAX_C];
    int mat[MAX][MAX], esterni[EXT_DIM][MAX], dim;
    FILE *f_input;
    
    scanf("%s", nome_file);

    f_input = fopen(nome_file, "rb");

    if (!f_input) {
        printf("0\n");
        return 0;
    }

    if (leggi_file(f_input, mat, esterni, &dim) != 0) {
        printf("0\n");
        return 0;
    }
    fclose(f_input);
    
    if (dim < 1 || dim > MAX) {
        printf("0\n");
        return 0;
    }
    
    if (checkcolonna(dim, mat) != 0 || checkriga(dim, mat) != 0) {
        printf("0\n");
        return 0;
    }

    if (topcolonna(dim, esterni[SOPRA], mat) != 0) {
        printf("0\n");
        return 0;
    } else if (botcolonna(dim, esterni[SOTTO], mat) != 0) {
        printf("0\n");
        return 0;
    } else if (rightriga(dim, esterni[DESTRA], mat) != 0) {
        printf("0\n");
        return 0;
    } else if (leftriga(dim, esterni[SINISTRA], mat) != 0) {
        printf("0\n");
        return 0;
    } else
        printf("1\n");
    return 0;
}

int leggi_file(FILE *fd, int matrice[MAX][MAX], int esterni[EXT_DIM][MAX], int *dim)
{
    int i;
    fread(dim, sizeof(int), 1, fd);

    for (i = 0; i < *dim; i++)
        fread(matrice[i], sizeof(int), *dim, fd);

    for (i = 0; i < EXT_DIM; i++)
        fread(esterni[i], sizeof(int), *dim, fd);

    return 0;
}

int checkriga(int dim, int mat[MAX][MAX])
{
    int i, j, k;
    for (i = 0; i < dim; i++)
        for (j = 0; j < dim; j++)
            for (k = j + 1; k < dim; k++)
                if (mat[i][k] == mat [i][j] && mat[i][k] < 1 && mat[i][k] > dim)
                    return -i;
    return 0;
}

int checkcolonna(int dim, int mat[MAX][MAX])
{
    int i, j, k;
    for (j = 0; j < dim; j++)
        for (i = 0; i < dim; i++)
            for (k = i + 1; k < dim; k++)
                if (mat[i][j] == mat[k][j] && mat[k][j] < 1 && mat[k][j] > dim)
                    return -j;
    return 0;
}

int rightriga(int dimensione, int v[MAX], int mat[MAX][MAX]){
	int i, j, massimo, visibili=1;

    for (i = 0; i < dimensione; i++) {
        massimo = mat[i][dimensione - 1];
        for (j = dimensione-1; j >= 0; j--) {
			if (mat[i][j]>massimo){
				massimo=mat[i][j];
				visibili++;
			}
        }
        if (visibili != v[i])
            return -j;
        else
            visibili = 1;
    }
	return 0;
}

int botcolonna(int dimensione, int v[MAX], int mat[MAX][MAX]){
	int i, j, massimo, visibili=1;

	for (j=dimensione-1;j>=0;j--){
		massimo = mat[dimensione-1][j];
		for(i=dimensione-1;i>=0;i--){
			if(mat[i][j]>massimo){
				massimo=mat[i][j];
				visibili++;
			}
		}
		if (visibili!=v[dimensione - 1 -j])
            return -(dimensione - 1 -j);
		else
            visibili=1;
	}
	return 0;
}

int topcolonna(int dimensione, int v[MAX], int mat[MAX][MAX])
{
	int i, j, massimo, visibili=1;

    for (j = 0; j < dimensione; j++) {
        massimo = mat[0][j];
        for (i = 0; i < dimensione; i++) {
			if(mat[i][j]>massimo){
				massimo=mat[i][j];
				visibili++;
			}
        }
		if (visibili!=v[j])
            return -j;
		else
            visibili=1;
    }
	return 0;

}

int leftriga(int dimensione, int v[MAX], int mat[MAX][MAX]){
	int i, j, massimo, visibili=1;

	for (j=0;j<dimensione;j++){
		massimo=mat[j][0];
		for(i=0;i<dimensione;i++){
			if(mat[j][i]>massimo){
				massimo=mat[j][i];
				visibili++;
			}
		}
		if (visibili!=v[dimensione - 1 - j])
            return -(dimensione-j-1);
		else 
		    visibili=1;
	}
	return 0;
}
