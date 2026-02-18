#include <stdio.h>

int main () {
    
    int N; // nº de jogadas, variavel dada 
    int vence_i = 0;
    int vence_cmd = 0;
    int empate = 0;
    char inzel , cmd ;

    if (scanf ("%d", &N)) {};
    int i;
    for (i=0 ; i<N ; i++) {
        if (scanf (" %c %c", &inzel, &cmd)) {};
// empatam se jogarem o mesmo
        if ((inzel=='@' && cmd=='*') || (inzel=='|' && cmd=='-') || (inzel=='X' && cmd=='+')) {
            empate++ ;
        } 
// Possiblidades de jogo: ganha o robô Inzel se Inzel joga pedra e CMD joga tesoura OU se Inzel joga papel e CMD joga pedra OU se Inzel joga tesoura e CMD joga papel
        else if ((inzel=='@' && cmd=='+')||(inzel=='|' && cmd=='*')||(inzel=='X' && cmd=='-')) {
            vence_i++ ;
        }
// ganha o robô CMD nas restantes possibilidades
        else {
            vence_cmd++ ;
        }
    }

    printf ("%d %d %d\n", vence_i, vence_cmd, empate) ;
    return 0;
}