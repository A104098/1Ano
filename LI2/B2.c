#include <stdio.h>

int main() {
	int c_inicial, a_andares, n_comandos;
	int i;

	if(scanf("%d", &c_inicial)){}
    if(scanf("%d",&a_andares)){}
    if(scanf("%d",&n_comandos)){}

    int linha_movimentos[n_comandos];
    
    for(i=0;i<n_comandos;i++){
    	
    	if (scanf("\n%d",&linha_movimentos[i])){}
    	
        if (linha_movimentos[i] == 1 && c_inicial != a_andares) c_inicial++;
        
    	if (linha_movimentos[i] == (-1) && c_inicial != 0) c_inicial--;
        
        }


    printf("%d\n",c_inicial);
	return 0;
}
