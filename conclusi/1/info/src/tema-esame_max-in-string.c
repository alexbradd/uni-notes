#include <stdio.h>
#include <string.h>

#define DIM 100

int main(void)
{
    int i = 0;
    char c;
    char str[DIM + 1];
    int n[10] = {0};
    int max = 0,
        num;
    // input
    while((c = getchar()) != EOF) {
        str[i] = c;
        i++;
    }
    str[i] = '\0';
    // check if empty
    if (strlen(str) == 0){
        printf("-1\n");
        return 0;
    }
    // populate n
    for (i = 0; str[i] != '\0'; i++)
        n[str[i] - '0']++;
    // eval n
    for (i = 0; i < 9; i++){
        if (n[i] > max){
            max = n[i];
            num = i;
        } else if (n[i] == max) {
            if (i > num)
                num = i;
        }

    }
    printf("\n%d\n", num);

}
