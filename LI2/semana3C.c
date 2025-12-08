#include <stdio.h>

int conta(int *altura,int a, int maximo,int b) {
    for (int m = 0; m < a; m++) {
        if (altura[m]>maximo) {
            b+=1;
            maximo=altura[m];}       
    }    

    return b;
}

int main() {
    int n;
    if (scanf("%d", &n)) {};

    int anoesvi[n];

    for (int i=0;i<n;i++) {
        int a;        
        if (scanf("%d",&a)) {};
        int altura[a];
        
        for (int j=0;j<a;j++) {
            if (scanf(" %d",&altura[j])) {};
        }

        anoesvi[i] = conta(altura,a,altura[0],1);        
    }

    for(int l=0;l<n;l++){
        printf("%d\n", anoesvi[l]);
    }

    return 0;
}