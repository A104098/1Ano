int main () {
	int n;
	int vinzel = 0;
	int vcmd = 0;
	int empate = 0;
	if (scanf("%d",&n)) {};
    char inzel[n];
    char cmd[n];

	for (int i = 0; i < n; i++) {
		if (scanf(" %c %c", &inzel[i],&cmd[i])) {};
        if ((inzel[i] == '@' && cmd[i] == '+') || (inzel[i]== '|' && cmd[i] == '*') || (inzel[i]== 'X' && cmd[i] == '-')) {
            vinzel++;}
        if ((inzel[i] == '@' && cmd[i] == '-') || (inzel[i] == '|' && cmd[i] == '+') || (inzel[i] == 'X' && cmd[i] == '*')) {
            vcmd++;}
        if ((inzel[i] == '@' && cmd[i] == '*') || (inzel[i] == '|' && cmd[i] == '-') || (inzel[i] == 'X' && cmd[i] == '+')) {
            empate++;}
     }
    printf("%d %d %d\n",b,c,d);
    return 0;
}