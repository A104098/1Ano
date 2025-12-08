#include <stdio.h>
/* 
1, 5 para cima
2,6 para baixo
3, 7 para esquerda
4, 8 para direita
*/


int main() {
    int taro;
    if (scanf("%d", &taro)) {} ;
    
    int cards[taro];
    int x=0,y=0;

    int i;
    for(i=0; i < taro; i++) {
     if(scanf("%d", &cards[i])) {};

     if (cards[i]%4 == 1) {
     	y--;
     } else if (cards[i]%4 == 2) {
     	y++;
     } else if (cards[i]%4 == 3) {
     	x--;
     } else {
     	x++;
     }


   }

    printf("%d %d\n" ,x,y);
	return 0;
}