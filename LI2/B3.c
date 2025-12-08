#include <stdio.h>

int caminho(char movimento[], int pos) {
    for(int i=0; movimento[i] ;i++){
        if(movimento[i] == 'C' && pos<7) pos+=3;
        if(movimento[i] == 'B' && pos>3) pos-=3;     
        if(movimento[i] == 'D' && pos % 3 != 0) pos++;
        if(movimento[i] == 'E' && pos % 3 != 1) pos--;
    }
    return pos;
}

int main() {
    int n;
    if (scanf("%d", &n)) {};
    int codigo[n];
    int pos = 5;
    
    for(int m=0; m<n; m++) {
        char movimento[19];
        if (scanf("%s", movimento)) {};
        pos = caminho(movimento,pos);        
        codigo[m]= pos;
    }

    for(int l=0;l<n;l++){
        printf("%d", codigo[l]);
    }
    printf("\n");

    return 0;
}
