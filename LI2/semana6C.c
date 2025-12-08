#include <stdio.h>
#include <string.h>

void ordena_pedidos(int num[], char dif[], int preco[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if ((preco[j] < preco[j + 1]) 
            || (dif[j] > dif[j + 1] && preco[j] == preco[j + 1] ) 
            || ((dif[j] == dif[j + 1]) && (preco[j] == preco[j + 1]) && (num[j] > num[j + 1]))){
                char dif_aux = dif[j];
                int preco_aux = preco[j];
                int num_aux = num[j];
                dif[j] = dif[j + 1];
                preco[j] = preco[j + 1];
                num[j]= num[j + 1];
                dif[j + 1] = dif_aux;
                preco[j + 1] = preco_aux;
                num[j + 1] = num_aux;
            }
        }
    }
}

int main() {
    int num_pedidos;
    if (scanf("%d", &num_pedidos)) {};

    int num[num_pedidos];
    char dif[num_pedidos];
    int preco[num_pedidos];

    for (int i = 0; i < num_pedidos; i++) {
        if (scanf("%d", &num[i])) {};
        if (scanf(" %c", &dif[i])) {};
        if (scanf("%d", &preco[i])) {};
    }

    ordena_pedidos(num, dif, preco, num_pedidos);

    for (int i = 0; i < num_pedidos; i++) {
        printf("%d %c %d\n", num[i], dif[i], preco[i]);
    }

    return 0;
}
