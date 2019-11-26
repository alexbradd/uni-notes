#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DIM 10

struct el {
    char code;
    int quant;
    struct el *next;
};

void stampalista(struct el *lista, char label[]);
struct el *inseriscitesta(struct el *lista, char code, int quant);
struct el *inseriscicoda(struct el *lista, char code, int quant);
struct el *cercael(struct el *lista, char code);
struct el *raggruppa(struct el *lista);
struct el *filtra(struct el *lista, char code);
void dividi(struct el **lista, struct el **lista_p, struct el **lista_d);

int main (void)
{
    //### ES1 ###
    /* struct el *lista = NULL; */
    /* char code; */
    /* int quant; */

    /* srand(time(NULL)); */
    /* for (int i = 0; i < DIM; i++) { */
    /*     code = 'A' + rand() % ('Z' - 'A' + 1); */
    /*     quant = rand() % 10; */
    /*     lista = inseriscitesta(lista, code, quant); */
    /* } */
    /* stampalista(lista, "Lista 1"); */

    //### ES2 ###
    /* struct el *lista = NULL; */
    /* char code; */
    /* int quant; */

    /* srand(time(NULL)); */
    /* for (int i = 0; i < DIM; i++) { */
    /*     code = 'A' + rand() % ('Z' - 'A' + 1); */
    /*     quant = rand() % 10; */
    /*     lista = inseriscicoda(lista, code, quant); */
    /* } */
    /* stampalista(lista, "Lista 2"); */

    //### ES3 ###
    /* struct el *lista1 = NULL; */
    /* struct el *lista3 = NULL; */
    /* char code; */
    /* int quant; */

    /* srand(time(NULL)); */
    /* for (int i = 0; i < DIM; i++) { */
    /*     code = 'A' + rand() % ('Z' - 'A' + 1); */
    /*     quant = rand() % 10; */
    /*     lista1 = inseriscitesta(lista1, code, quant); */
    /* } */
    /* stampalista(lista1, "Lista 1"); */
    /* lista3 = raggruppa(lista1); */
    /* stampalista(lista3, "Lista 3"); */

    // ### ES4 ###
    /* struct el *lista1 = NULL; */
    /* char code; */
    /* int quant; */

    /* char to_r; */

    /* srand(time(NULL)); */
    /* for (int i = 0; i < DIM; i++) { */
    /*     code = 'A' + rand() % ('Z' - 'A' + 1); */
    /*     quant = rand() % 10; */
    /*     lista1 = inseriscitesta(lista1, code, quant); */
    /* } */
    /* stampalista(lista1, "Lista 1"); */
    /* printf("Codice da rimuovere? "); */
    /* to_r = getchar(); */
    /* lista1 = filtra(lista1, to_r); */
    /* stampalista(lista1, "Lista 1"); */

    //### ES5 ###

    struct el *lista1 = NULL;
    struct el *lista_p = NULL;
    struct el *lista_d = NULL;
    char code;
    int quant;

    srand(time(NULL));
    for (int i = 0; i < DIM; i++) {
        code = 'A' + rand() % ('Z' - 'A' + 1);
        quant = rand() % 10;
        lista1 = inseriscitesta(lista1, code, quant);
    }
    stampalista(lista1, "Lista 1");
    dividi(&lista1, &lista_p, &lista_d);
    stampalista(lista1, "Lista 1");
    stampalista(lista_p, "Lista pari");
    stampalista(lista_p, "Lista dispari");

    return 0;
}

void stampalista(struct el *lista, char label[])
{
    printf("%s: ", label);
    while (lista) {
        printf("[%c;%d]->", lista->code, lista->quant);
        lista = lista->next;
    }
    printf("NULL\n");
}

struct el *inseriscitesta(struct el *lista, char code, int quant)
{
    struct el *new = malloc(1 * sizeof(struct el));

    if (!new)
        return lista;

    new->code = code;
    new->quant = quant;
    new->next = lista;
    return new;
}

struct el *inseriscicoda(struct el *lista, char code, int quant)
{
    struct el *new = malloc(1 * sizeof(struct el));
    struct el *cur = lista;

    if (!new)
        return lista;

    new->code = code;
    new->quant = quant;
    new->next = NULL;
    if (!lista)
        return new;
    while(cur->next)
        cur = cur->next;
    cur->next = new;
    return lista;
}

struct el *cercael(struct el *lista, char code)
{
    struct el *cur = lista;
    while(cur) {
        if (cur->code == code)
            return cur;
        cur = cur->next;
    }
    return NULL;
}

struct el *raggruppa(struct el *lista)
{
    struct el *new = NULL;
    struct el *found_new = NULL;

    while(lista) {
        found_new = cercael(new, lista->code);
        if (found_new) {
            found_new->quant += lista->quant;
        } else {
            new = inseriscicoda(new, lista->code, lista->quant);
        }
        lista = lista->next;
    }
    return new;
}

struct el *filtra(struct el *lista, char code)
{
    struct el *prev = NULL;
    struct el *cur = lista;
    struct el *to_f = NULL;

    while(cur) {
        if (cur->code == code) {
            if (prev == NULL) { // rimozione in testa
                cur = cur->next;
                free(lista);
                lista = cur;
            } else {
                prev->next = cur->next;
                to_f = cur;
                cur = cur->next;
                free(to_f);
            }
        } else {
            prev = cur;
            cur = cur->next;
        }
    }
    return lista;
}

void dividi(struct el **lista, struct el **lista_p, struct el **lista_d)
{
    struct el *prev = NULL;
    struct el *cur = *lista;
    struct el *to_f = NULL;

    while(cur) { // rimuovi multipli 5
        if ((cur->quant % 5) == 0) {
            if (prev == NULL) { // rimozione in testa
                cur = cur->next;
                free(*lista);
                *lista = cur;
            } else {
                prev->next = cur->next;
                to_f = cur;
                cur = cur->next;
                free(to_f);
            }
        } else
            cur = cur->next;
    }

    cur = *lista;
    while(to_f) {
        to_f = cur->next;
        if ((cur->quant % 2) == 0) {
            cur->next = *lista_p;
            *lista_p = cur;
        } else {
            cur->next = *lista_d;
            *lista_d = cur;
        }
        cur = to_f;
    }
    *lista = NULL;
}
