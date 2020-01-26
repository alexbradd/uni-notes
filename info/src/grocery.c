#include <stdio.h>

int q_comprata,
    sconto;
float prezzo;

int main(void) {
    printf("Quanto devi comprare? "); scanf("%d", &q_comprata);
    fflush(stdin);
    printf("Quanto costa? "); scanf("%f", &prezzo);
    //
    // B OK
    if (q_comprata <= 9) // problema per quantità negative
        sconto = 0;
    if ((q_comprata >= 10) && (q_comprata < 50))
        sconto = 5;
    if (q_comprata >= 50)
        sconto = 10;

    // 100: 95 = tot : scontato
    printf("Devi pagare: %f",
            ((prezzo * q_comprata) * (100 - sconto)) / 100.);

    return 0;
}
