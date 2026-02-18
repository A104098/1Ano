#include <stdio.h>
#include <string.h>

int main() {
    int n, x;
    char notas[1001];
    scanf("%d", &n);
    while (n--) {
        scanf("%d %s", &x, notas);
        int freq[256] = {0};
        int i, j;
        for (i = 0, j = 0; j < x; j++) {
            while (notas[j] && freq[notas[j]] == 0) {
                freq[notas[j]]++;
                j++;
            }
            if (j - i == x) {
                printf("%d\n", i);
                break;
            }
            freq[notas[i]]--;
            i++;
        }
        if (j == x) {
            printf("-1\n");
        }
    }
    return 0;
}
