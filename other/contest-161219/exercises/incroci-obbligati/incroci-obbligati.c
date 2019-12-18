#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define PATH_LEN 25
#define N_ROW    13
#define N_COL    9
#define HV_SEP   "---"

typedef enum {horizontal, vertical} direction_t;
typedef enum {false, true} bool_t;

void load_table(char table[N_ROW][N_COL], FILE *fd);
int find_in_direction(char table[N_ROW][N_COL], char word[], direction_t dir);
int check_str(char to_add, char str[], int *len, char target[]);

int main(void)
{
    int i,j, n_found;
	char table[N_ROW][N_COL], word[N_ROW+1], c, path[PATH_LEN];
	direction_t direction = horizontal;
	FILE *input_file;

	printf("Inserire il nome del file: ");
	scanf("%s", path);
	
	input_file = fopen(path, "rt");	
	if(!input_file){
		printf("0\n");
		return 2;
	}
	
	load_table(table, input_file);
	while(!feof(input_file)) {
	    for (i = 0; (c = getc(input_file)) != '\n' && c != EOF; i++) {
			word[i] = c;
		}
		word[i]='\0';
		
		if(strcmp(word, HV_SEP)==0)
			direction = vertical; /* invert direction */
		else {
			n_found = find_in_direction(table, word, direction);
			if(n_found != 1){
				printf("0 - %s\n", word);
				return 1;
			}
		}
	}
	
	fclose(input_file);
    printf("1\n");
	return 0;
}

void load_table(char table[N_ROW][N_COL], FILE *fd)
{	
	int i, j;
	
	for(i=0; i<N_ROW; i++){
		for(j=0; j<N_COL; j++){
    		table[i][j] = tolower(getc(fd));
		}
	}
	getc(fd); // WARN: check line endings
}

int find_in_direction(char table[N_ROW][N_COL], char word[])
{
    // TODO
}

