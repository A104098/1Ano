int descodifica(char comandos[], int pos) {
    for(int i=0; comandos[i] ;i++){
        if(comandos[i] == 'C' && pos<7) pos+=3;
        if(comandos[i] == 'B' && pos>3) pos-=3;     
        if(comandos[i] == 'D' && pos % 3 != 0) pos++;
        if(comandos[i] == 'E' && pos % 3 != 1) pos--;
    }
    return pos;
}

int main() {
    int n;
    if (scanf("%d", &n)) {};
    int codigo[n];
    int pos = 5;
    
    for(int m=0; m<n; m++) {
        char comandos[19];
        if (scanf("%s", comandos)) {};
        pos = descodifica(comandos,pos);        
        codigo[m]= pos;
    }

    for(int l=0;l<n;l++){
        printf("%d", codigo[l]);
    }
    printf("\n");

    return 0;
}