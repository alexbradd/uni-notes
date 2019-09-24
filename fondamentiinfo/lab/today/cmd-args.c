#include <stdio.h>

int main (int argc, char* argv[]){
    printf("Arguments: %d\n", argc);
    for (int i = 0; i < argc; i++)
        printf("Argument: %s\n", argv[i]);
    return 0;
}
