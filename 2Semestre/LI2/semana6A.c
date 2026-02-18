#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Função para ordenar os caracteres de uma string
void sortString(char *str) {
    int n = strlen(str);
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (str[i] > str[j]) {
                char temp = str[i];
                str[i] = str[j];
                str[j] = temp;
            }
        }
    }
}

// Função para verificar se duas strings são anagramas
int areAnagrams(char *str1, char *str2) {
    // Ordena as strings
    sortString(str1);
    sortString(str2);

    // Compara as strings ordenadas
    return strcmp(str1, str2) == 0;
}

int main() {
    int numCases;
    scanf("%d", &numCases);

    for (int i = 0; i < numCases; i++) {
        int numCandidates;
        scanf("%d", &numCandidates);

        char villain[100];
        scanf(" %[^\n]s", villain);

        // Lê e compara os nomes dos candidatos
        int foundAnagrams = 0;
        for (int j = 0; j < numCandidates; j++) {
            char candidate[100];
            scanf(" %[^\n]s", candidate);

            if (areAnagrams(villain, candidate)) {
                printf("%d ", j + 1);
                foundAnagrams = 1;
            }
        }

        if (!foundAnagrams) {
            printf("-1\n");
        } else {
            printf("\n");
        }
    }

    return 0;
}
