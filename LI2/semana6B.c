#include <stdio.h>
#include <string.h>

int modulo(int a) {
    if (a<0) return (-a);
    else return a;
}

void ordena_cozinheiros(char name[][20], int kg[], int cm[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if ((modulo(kg[j] - 90) > modulo(kg[j + 1] - 90)) 
                || (modulo(kg[j] - 90) == modulo(kg[j + 1] - 90) && cm[j] < cm[j + 1]) 
                || (modulo(kg[j] - 90) == modulo(kg[j + 1] - 90) && cm[j] == cm[j + 1] && name[j][0] > name[j+1][0])) {
                int kgAux = kg[j];
                int cmAux = cm[j];
                char nameAux[20];
                for (int k = 0; k < 20; k++) {
                    nameAux[k] = name[j][k];
                }
                kg[j] = kg[j + 1];
                cm[j] = cm[j + 1];
                for (int k = 0; k < 20; k++) {
                    name[j][k] = name[j + 1][k];
                }
                kg[j + 1] = kgAux;
                cm[j + 1] = cmAux;
                for (int k = 0; k < 20; k++) {
                    name[j + 1][k] = nameAux[k];
                }
            }
        }
    }
}

int main() {
    int n_cozinheiros;
    if (scanf("%d",&n_cozinheiros)) {};

    char name[n_cozinheiros][20];
    int kg[n_cozinheiros];
    int cm[n_cozinheiros];

    for (int i=0; i<n_cozinheiros; i++) {
        if (scanf("%s",name[i])) {};
        if (scanf("%d",&kg[i])) {};
        if (scanf("%d",&cm[i])) {};
    }

    ordena_cozinheiros(name,kg,cm,n_cozinheiros);

    for (int i=0; i<n_cozinheiros; i++) {
        printf("%s %d %d\n",name[i],kg[i],cm[i]);
    }

    return 0;
}
