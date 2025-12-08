#include <stdio.h>
#include <string.h>

int main()
{
  
  char pos[8];

  if (scanf("%s", pos)){} //le a ordem pela qual vao ser ordenadas as letras

  int size = strlen(pos); //calcula o tamanho dos blocos de letras
  
  int ordem[size];

  for (int i = 0; i< size; i++) { //converte a ordem das letras para um array de inteiros
    ordem[i] = pos[i] - '0';
  } 

  char mensagem[1000];

  if(scanf("%s",mensagem)){} // le a mensagem para encriptar

  int tamanho = strlen(mensagem);

  int x = 0, y = 0;

  char novamsg[tamanho];

  for(int i = 0; i < size; i++){
    y = ordem[i]-1;
    for(int i = y; i < tamanho; i+=size){
      novamsg[x] = mensagem[i];
      x++;
    }
    }
    for(int i =0; i < tamanho; i++){
     
    printf("%c",novamsg[i]);
  }
   
    putchar('\n');

  return 0;
    }


