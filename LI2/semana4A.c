#include <stdio.h>
#include <string.h>

int vogal(char a) {
    if (a == 'A' || a == 'E' || a == 'I' || a == 'O' || a == 'U' || a == 'Y') {
        return 1;
    }
    return 0;
}

int alternado(char word[]) {
    int tam = strlen(word);
    for (int i = 1; i < tam; i++) {
        if (vogal(word[i]) != vogal(word[i - 1])) {
            continue;
        }
        return 1;
    }
    return 0;
}

int main() {
    int a;
    if (scanf("%d", &a)) {}
    char palavras[1000];
    char resultados[a];

    for (int i = 0; i < a; i++) {
        int r = 0;
        if (fgets(palavras, 1000, stdin)) {}
        while (palavras[0] == '\n') {
            if (fgets(palavras, 1000, stdin)) {}
        }
        char *word = strtok(palavras, " \n");

        while (word != NULL) {
            if (alternado(word) == 0) {
                r += 1;
            }
            word = strtok(NULL, " \n");
        }

        resultados[i] = r;
    }

    for (int i = 0; i < a; i++) {
        printf("%d\n", resultados[i]);
    }

    return 0;
}  
