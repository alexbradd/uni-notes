#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define DIM_TXT 100
#define DADO 5
#define PAROLA_ND "n.d."

#define EMPTY_LIST NULL

struct s_giocatore {
    char name[DIM_TXT];
    char msg[DIM_TXT];
    struct s_giocatore *prev;
    struct s_giocatore *next;
};
typedef struct s_giocatore t_giocatore;
typedef t_giocatore *CircList;
static int LIST_SIZE = 0;

enum e_verso {orario, antiorario};

void aggiungi_giocatore(CircList *list, const char *player_name);
void rimuovi_giocatore(CircList *list, const char *player_name);
void stampa_lista(CircList list, enum e_verso verso);
void ascolta(char *parola);
int partita(CircList lista, const char *parola, enum e_verso verso);

int main(int argc, char **argv)
{
    CircList list = EMPTY_LIST;
    char parola[DIM_TXT];
    enum e_verso verso;
    int to_die, players, old_length, esito;

    if (argc < 7)
        return 1;

    strcpy(parola, argv[1]); // eval 1
    if (strcmp(argv[2], "orario") == 0) // eval 2
        verso = orario;
    else if (strcmp(argv[2], "antiorario") == 0)
        verso = antiorario;
    else
        return 1;

    players = argc - 3;
    for (int i = 3; i < argc; i++) // eval 3:
        aggiungi_giocatore(&list, argv[i]);

    srand(time(NULL));
    while (LIST_SIZE >= 2) {
        esito = partita(list, parola, verso);
        printf("---\nGiocatori (verso %d):\n", verso);
        stampa_lista(list, verso);
        if (esito == 0)
            printf("La prima e l'ultima parola combaciano!!\n");
        else
            printf("La prima e l'ultima parola non combaciano!!\n");

        do {
            old_length = LIST_SIZE;
            to_die = rand() % players;
            rimuovi_giocatore(&list, argv[3 + to_die]);
        } while (old_length == LIST_SIZE);
        if (verso == orario)
            verso = antiorario;
        else
            verso = orario;
    }
    return 0;
}

void aggiungi_giocatore(CircList *list, const char *player_name)
{
    t_giocatore *new_player = malloc(sizeof(t_giocatore));
    if (!new_player)  // Handle error
        return;
    // init player
    strcpy(new_player->name, player_name);
    strcpy(new_player->msg, PAROLA_ND);
    new_player->next = new_player;
    new_player->prev = new_player;
    // add player
    if (!*list) { // empty list
        *list = new_player;
    } else {
        new_player->prev = (*list)->prev;
        (*list)->prev->next = new_player;
        (*list)->prev = new_player;
        new_player->next = *list;
    }
    LIST_SIZE++;
}
void rimuovi_giocatore(CircList *list, const char *player_name)
{
    t_giocatore *current = *list;
    if(!*list)
        return;

    if (current->next == current->prev && current->next == *list) { // only one element
        free(current);
        *list = NULL;
        LIST_SIZE = 0;
        return;
    }
    do {
        if (strcmp(current->name, player_name) == 0) { // remove
            if (*list == current) // in case first one was removed
                *list = current->next;
            current->prev->next = current->next;
            current->next->prev = current->prev;
            free(current);
            LIST_SIZE--;
            return;
        }
        current = current->next;
    } while(current != *list);
}

void stampa_lista(CircList lista, enum e_verso verso)
{
    t_giocatore *current = lista;
    if (!lista) {
        printf("Nessun giocatore\n");
    } else {
        do {
            printf("Giocatore %s: %s\n", current->name, current->msg);
            if (verso == orario)
                current = current->next;
            else
                current = current->prev;
        } while (current != lista);
    }
}

void ascolta(char *parola)
{
    int posizione1, posizione2;
    char tmp;
    if (!parola)
        return;
    if (rand() % DADO == 0) {
        posizione1 = rand() % strlen(parola);
        posizione2 = rand() % strlen(parola);
        tmp = parola[posizione1];
        parola[posizione1] = parola[posizione2];
        parola[posizione2] = tmp;
    }
}

int partita(CircList lista, const char *parola_init, enum e_verso verso)
{
    t_giocatore *current = lista;
    char parola_cur[DIM_TXT];

    if (LIST_SIZE < 2)
        return 0;
    strcpy(parola_cur, parola_init); // do not modify caller
    // init first player
    strcpy(current->msg, parola_cur);
    if (verso == orario) // start from second
        current = current->next;
    else
        current = current->prev;

    do { // modify loop
        ascolta(parola_cur);
        memset(current->msg, '\0', sizeof(char) * DIM_TXT);  // clear buffer
        strcpy(current->msg, parola_cur);
        if (verso == orario)
            current = current->next;
        else
            current = current->prev;
    } while(current != lista);
    // test first and last msg
    if (verso == orario) {
        if(strcmp(lista->msg, lista->prev->msg) == 0)
            return 0;
        return 1;
    } else {
        if(strcmp(lista->msg, lista->next->msg) == 0)
            return 0;
        return 1;
    }
}
