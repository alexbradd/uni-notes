#include <stdio.h>

int q_comprata,
    sconto;
float prezzo;

int main(void) {
    printf("Quanto devi comprare? "); scanf("%d", &q_comprata);
    printf("Quanto costa? "); scanf("%f", &prezzo);

    // A
    /* if (q_comprata >= 50) */
    /*     sconto = 10; */
    /* if (q_comprata >= 10) */
    /*     sconto = 5; */
    /* if (q_comprata < 10) // problema per quantità negative */
    /*     sconto = 0; */
    // B OK
    /* if (q_comprata <= 9) // problema per quantità negative */
    /*     sconto = 0; */
    /* if ((q_comprata >= 10) && (q_comprata < 50)) */
    /*     sconto = 5; */
    /* if (q_comprata >= 50) */
    /*     sconto = 10; */
    // C OK
    /* if (q_comprata < 10) // problema per quantità negative */
    /*     sconto = 0; */
    /* else if ((q_comprata >= 10) && (q_comprata < 50)) */
    /*         sconto = 5; */
    /*     else */
    /*         sconto = 10; */
    // D: NO
    /* if (q_comprata >= 0) */
    /*     sconto = 0; */
    /* else if (q_comprata >= 10) */
    /*         sconto = 5; */
    /*     else if (q_comprata >= 50) */
    /*         sconto = 10; */
    /* printf("%d", sconto); */

    printf("Devi pagare %f", (prezzo * q_comprata) * (100 - sconto/100));

    return 0;
}
