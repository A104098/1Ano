#include <stdio.h>
#include <string.h>

char caracter_repetido(char word[]){
    char caracter;
    int tamanho = strlen(word);
    for(int i = 0;i<tamanho;i++){
        caracter = word[i];
        for(int j=i;word[j]!= '\0';j++){
            if (caracter == word[j+1]) {
                return(caracter);}
        }
    }
  return 0;
}        

int main(){
    int numero_linhas;
    char word[1000];
    
    if (scanf("%d\n",&numero_linhas)) {}
    char final[numero_linhas];

        
  for(int n=0;n<numero_linhas;n++){
        if (scanf("%s",word)) {}
        final[n] = caracter_repetido(word);
  }
  for(int i=0;i<numero_linhas;i++){
     printf("%c",final[i]);
    }
     printf("\n");
         return 0;
}
