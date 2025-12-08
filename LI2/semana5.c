#include <stdio.h>

int pertence(int array[], int N, int a) {
    for (int i = 0; i < N; i++) {
        if (array[i] == a) {
            return 1;
        }
    }
    return 0;
}

void adiciona(int array[], int N, int a) {
    for (int i = 0; i < N; i++) {
        if (array[i] == -1) {
            array[i] = a;
            break;
        }   
    }
}

void ordena(int array[], int N) {
    int i, j, min_index;
    for (i = 0; i < N - 1; i++) {
        min_index = i;
        for (j = i + 1; j < N; j++) {
            if (array[j] < array[min_index]) {
                min_index = j;
            }
        }
        if (min_index != i) {
            int temp = array[i];
            array[i] = array[min_index];
            array[min_index] = temp;
        }
    }
}

int conta(int array[], int N) {
    int conta = 0;
    for (int i = 0; i < N; i++) {
        if (array[i] != -1) {
            conta++;
        }
    }
    return conta;
}

int main() {
    int nguardas;
    int nlinhas;
    if (scanf("%d", &nguardas)) {};
    if (scanf("%d", &nlinhas)) {};

    int acumulador[24][nguardas];
    for (int i = 0; i < 24; i++) {
        for (int j = 0; j < nguardas; j++) {
            acumulador[i][j] = -1;
        }
    }

    for (int i = 0; i < nlinhas; i++) {
        int codguarda;
        int h1, h2;
        if (scanf("%d", &codguarda)) {};
        if (scanf("%d", &h1)) {};
        if (scanf("%d", &h2)) {};
        for (int j = h1; j <= h2; j++) {
            if (pertence(acumulador[j], nguardas, codguarda) == 0) {
                adiciona(acumulador[j], nguardas, codguarda);
            }
        }
    }
    
    for (int i = 0; i < 24; i++) {
        ordena(acumulador[i], nguardas);
    }

    for (int i = 0; i < 24; i++) {
        if (conta(acumulador[i], nguardas) > 1) {
            printf("%d ", i);
            for (int j = 0; j < nguardas; j++) {
                if (acumulador[i][j] == -1 && j + 1 == nguardas) {
                    printf("\n");
                    continue;
                }
                if (acumulador[i][j] == -1) {
                    continue;
                }
                if (j + 1 == nguardas) {
                    printf("%d\n", acumulador[i][j]);
                } else {
                    printf("%d ", acumulador[i][j]);
                }
            }
        }
    }   
    return 0;
}
