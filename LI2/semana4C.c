#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() 
{
        
int num_casos; 
int key; 
int controlo;

if (scanf("%d", &num_casos)){}; 
char frase[1000];
int res[num_casos];

for(int i = 0; i < num_casos; i++)
{

    if (scanf("%d %s", &key, frase)){};
    res[i] = -1;

    int tam = strlen(frase);

    for(int j = 0; j <= tam - key; j++) 
    
    {
    controlo = 1;
    
        for (int k = j; k < j + key; k++) 
        {
            for(int p = j; p < k; p++) 
            {
                if(frase[p] == frase[k])    
                {
                    controlo = 0;
                }
            }   
                if (controlo == 0) 
                {
                    break;
                }
        }
        
        if(controlo == 1) 
        {
            res[i] = j;
            break;
        }    
    }
}

for(int i = 0; i < num_casos; i++) 
{
    printf("%d\n", res[i]);
}

return 0;

}