--Resumos


-fold(r/l)
ghci> foldr (+) 0 [1,2,3] (0-resultado da lista vazia que eu quero que dê) // 3+2=a , a+1=b, b+0=c, c=6//direita para a esquerda)//adiciona "0" ao maximo da direita
6
ghci> foldr (+) 1 [1,2,3]  (3+2=a, a+1=b , b+1=c, c+1=7)
7
ghci> foldl (+) 0 [1,2,3] (1+2=a , a+3=b , b+0=c, c=6//esquerda para a direita)/adiciona o "0" ao maximo da esquerda
6
ghci> foldl (+) 0 [-1,2,3]
4
ghci> folfl (+) 1 [-1,2,3]
5



--SEMANA 1------------------------------------------------------------------------------

-length:comprimento da lista(qualquer que sejam os elementos da lista)

-head: dá-me a head da lista (1 elemento)

-reverse:o oposto da lista//a head fica sempre no final!

-tail: dá-me a tail da lista ((h:t)=t)//retira o primeiro elemento de uma lista não vazia

-take: dá os n primeiros de uma lista//retira os elementos depois da posição n 
Exemplo
ghci> take 5 [1,2,3,4,5,6,7] (neste exemplo,n=5)
[1,2,3,4,5]

-fst: dá-me o primeiro elemento de um tuplo
Exemplo
ghci> fst(True,False)
True

-snd: dá-me o segundo elemento de um tuplo

-zip: faz uma lista de tuplos
Exemplo
ghci> zip [1,2,3] [9,8,7]
[(1,9),(2,8),(3,7)]

-Tipos básicos : Bool, Char, Integer, Int, Float, Double
--IMPORTANTE--
'a' is a Char, a single character.
['a','b','c'] is a string, a list-of-Char. This list can also be written as "abc" 

-tuplos: sequencia de elementos que podem ser de diferentes tipos// exemplo: (T1,T2,...Tn); (Char,Int,Char)=('C',2,'A');(Float,(Char,Bool),Int)=(3.5,('T', True),20)

-funções curried: recebe um argumento de cada vez. Também pode receber mais do que dois argumentos. Exemplo add::Int-> (Int -> Int) (recebe 1 argumento de cada vez); mult:: Int-> (Int->(Int->Int))

-restrições de classe:
Num a: é uma restrição de classe, onde significa o numerico a.
Exemplo
na função soma (+) 'a' + 'b' = :error..., pois não é possivel somar elementos de qualquer tipo. Para isso explicita-se que tem de ser um tipo numerico(um numero a)
Eq: Serve para quando queremos igualar/comparar algo. Têm o teste de igualdade definido. Define igualdade(==) e inequalidade (/=)
Exemplo
Eq a -> qualquer "a" na função devem ser membros da classe Eq, que pode ser evaluado como igual ou desigual.
elem :: Eq a => a -> [a] -> Bool, porque se usa a função (==) na sua implementação.
Ord: têm uma relação de ordem definida sobres os seus elementos. Permite a comparação para determinar a precis ordem de dois objetos.
Comparabilidade:
x<=y || y <= = True
Transitividade:
if x <= y && y <= z = True, then x <= z = True
Reflitividade:
x <= x = True
Antissimétrica:
if x <= y && y <= x = True, then x == y = True
max:: Ord a => a -> a -> a, porque se usa a função (<) na sua implementação

-operadores do Prelude
^: exponencial com inteiros
div: divisão inteira
mod: resto da divisão inteira
abs: módulo
**: exponencial com reais
<= ou >=
condicional: if ... then ... else ...
-função entre os seus argumentos
(sum l) `div´ (length l)



--SEMANA 2----------------------------------------------------------------------------------------------------------

chr: é uma função que dado o codigo ASCII de um caracter devolve o respetivo caracter(um bro que inventou um codigo)
Exemplo
65 - 'A'
66 - 'B'
--cagativo

-type: renomear tipos

Exemplo
type Coordenada = (Float, Float)
type String = [Char]

-usar "let...in" e "where"
Exemplo
dis:: Coordenada -> Coordenada -> Float (defnição da função que n se altera)

dis (x,y) (a,b) = sqrt ((a-x)^2+(b-y)^2)
--ou--
dis (x,y) (a,b) = let c = (a-x)^2
                      d = (b-y)^2
                  in sqrt (c+d)

--ou--
dis (x,y) (a,b) = sqrt (c+d)
  where c = (a-x)^2
        d = (b-y)^2


-data: definir novos tipos de dados
Exemplo já definidos no Prelude
data Bool(nome do construtor começa sempre com letra maiscula) = False | True 
data Maybe a = Nothing | Just a

-Maybe a : usado para lidar com exceções
Exemplo
div :: Int -> Maybe Int
div x y = if y == 2
          then Nothing
          else Just (div x y)

--ou--
div x 0 = Nothing
div x y = Just (div x y)

-funções com guardas
| n > 0 (...) -> "|" é uma expressão booleana. A equação só pode ser usada se a condição for VERDADEIRA
| otherwise -> corresponde a True
Exemplo

sinal:: Int -> Int
--assim:
sinal x = if x<0 then -1 
          else if x==0 then 0
            else 1

--ou assim:
sinal x | x<0 = -1
        | x==0 = 0
        | otherwise = 1



--SEMANA 3----------------------------------------------------------------------------------------------

-null -> testa se uma lista é vazia (dá valor de True ou False)

-"Case of" 
Exemplo
null::[a] -> Bool
--em vez de:
null [] = True
null (h:t) = False
--pode-se fazer assim:
null l = case l of
             []    -> True
            (h:t) -> False

-sum: calcula o somatório de uma lista de números
Exemplo
ghci> sum [1,2,3]
--1+2+3+0--
6

-elem: testa se é um elemento pertence a uma lista

-last: dá o ultimo elemento de uma lista não vazia (last [2,3,1,4]=4)

-init: retira o último elemento de uma lista não vazia

- ++ : junta duas listas
ghci> [1,2,3] ++ [3,2]
[1,2,3,3,2]

- !! : dá um elemento da lista numa dada posição
Exemplo
ghci> [6,4,3,1,5,7]!!2  (começa no zero!)
3

--SEMANA 4--------------------------------------------------------------------

-Tuppling: calcular varios resultados numa so travessia da lista

-zip: emparelha duas listas/ faz uma lista de tuplos, cada tuplo contem elementos, que estao na mesma posição, de ambas as listas
Exemplo
ghci> zip [1,2,3] [9,8,7]
[(1,9),(2,8),(3,7)]

-unzip: separa uma lista de pares em duas listas
Exemplo
ghci> unzip [(1,2),(2,3),(3,4)]
([1,2,3],[2,3,4])

-drop: retira os n primeiros elementos de uma lista
Exemplo
ghci> drop 2 [7,5,3]
[3]

-spliAt: parte uma lista em duas(recorre a take e drop como funções auxiliares)
Exemplo
ghci> splitAt 3 [1,2,3,4,5] (partiu a lista no elemento "3")
([1,2,3],[4,5])

-Algoritmos de organização: Insertion sort/Quick sort/Merge sort 

a) Insertion sort : apoia-se numa função auxiliar que insere um elemento numa lista já cordenada 

-insert: insere um elemento na lista de forma organizada
Exemplo
ghci> insert 7 [2,5,9]
[2,5,7,9]

-isort: organiza a lista
Exemplo
ghci> isort [5,4,3,2,1]
[1,2,3,4,5]

b) Quick sort: ver imagem nesta pasta.

--SEMANA 5--------------------------------------------------------

-Merge sort: ver imagem(n tira a head como no quick sort)

-@
Exemplo
merge :: (Ord a) => [a] -> [a] -> [a]
merge [] l = l
merge l [] = l
merge (x:xs) (y:ys) | x < y = x : merge xs (y:ys)
 | otherwise = y : merge (x:xs) ys

--ou--

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] l = l
merge l [] = l
merge a@(x:xs) b@(y:ys) | x < y = x : merge xs b
 | otherwise = y : merge a ys

-stringToInt “5247” = 5247
stringToInt :: String -> Int
stringToInt (x:xs) = aux xs (digitToInt x)
 where aux :: String -> Int -> Int
 aux (h:t) ac = aux t (ac*10 + (digitToInt h))
 aux [] ac = ac
 --como funciona?
 stringToInt “5247” = aux “247” 5
                    = aux “47” (50+2)
                    = aux “7” (520+4)
                    = aux “” (5240+7)
                    = 5247

-listas por compreensão
Exemplo
{ 2x | x ∈ {10,3,7,2} } é a mesma coisa que [ 2*x | x <- [10,3,7,2] ] (IMPORTANTE!!!!)

--SEMANA 6----------------------------------------------------------------

-Listas por compreensão
ghci> [1..5]
[1,2,3,4,5]

ghci>> ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"

-listas infinitas
Exemplo
ghci> [1..]
[1,2,3,4,5,6,7,8,9,10,11,…

ghci> [0,10..]
[0,10,20,30,40,50,60,70,80,90,100,110,120,130,…

ghci> > zip "Haskell" [0..] 
[('H',0),('a',1),('s',2),('k',3),('e',4),('l',5),('l',6)]

-map:aplica uma transformação a cada elemento da lista de entrada
ideia-> map f l = [ f x | x <- l ] (f(x), onde E l)

-filter: filtra o que queremos
Exemplo
ghci> filter (>5) [1,2,3,4,5,6,7,8]
 [6,7,8]

-Funções anónimas
\x -> x+x => recebe um número x e devolve com resultado x+xs
Exemplo
multiplosDe :: Int -> [Int] -> [Int]
multiplosDe n xs = filter (\x -> mod x n == 0) xs

--SEMANA 7----------------------------------------------------------------

-função "." : compoição de uma função => f (g x) = (f . g) x
Exemplo
ghci> (head . reverse) [1,2,3]
     = head (reverse [1,2,3])
     = head [3,2,1]
     3

-flip: troca a ordem dos argumentos de uma função => flip f x y = f y x
Exemplo
ghci> (^) 3 2
9
ghci> flip (^) 3 2
8 

-curry:y transforma uma função que recebe como argumento um par, numa função
equivalente que recebe um argumento de cada vez.
curry :: ((a,b) -> c) -> a -> b -> c
curry f x y = f (x,y)

-uncurry: transforma uma função que recebe dois argumentos (um de cada vez), numa função equivalente que recebe um par
uncurry :: (a -> b -> c) -> (a,b) -> c
uncurry f (x,y) = f x y

-zipWith: faz uma lista,cujos elementos são calculados por uma função que é aplicada a argumentos que vêm de duas listas.
Exemplo
ghci> zipWith (+) [1,2,3] [3,2,1]
[4,4,4]

ghci> zipWith div [10,20..50] [1..]
[10,10,10,10,10]

-takeWhile: dou uma condição e a função é processada até ser falsa
Exemplo
ghcitakeWhile (>3) [1,2,3,4,5] (os primeiros elementos "1,2,3" não são maiores que 3 logo a condição falho no primeiro elemento)//dá o segmento inicial da lista que satisfazem a condição
              []

ghci> takeWhile (<3) [1,2,3,4,5]
[1,2]

-dropwhile:recebe uma condição e uma lista e retorna a lista sem o segmento inicial de elementos que satisfazem a condição dada.//tira os primeiros elementos que satisfazem a condição.
ghci> dropWhile (<3) [1,2,3,4,5]
 [3,4,5]


-span:junta dropWhile e takeWhile. Isto é, a condição é aplicada logo no primeiro elemento e se satisfazer a condição, a lista é partida. Senão dá uma lista vazia.
Exemplo
ghci> span (<3) [1,2,4,5,6]
--is satisfied for the first two elements, and the result is:
([1,2], [4,5,6])

--But in this other example
span (>3) [1,2,4,5,6]
--the first element of the list already doesn't satisfy the predicate, so the first element of the returned tuple will be an empty list.

-lines:will take a single string, and return a list of strings
Exemplo
ghci> lines "aa\nbb\nbb"
["aa","bb","bb"]

-break:  é uma função do Prelude equivalente à função span invocada com a condição
negada
Exemplo
ghci> > break (>10) [3,4,5,30,8,12,9]
([3,4,5],[30,8,12,9])

-words:e parte uma string numa lista de palavras.
Exemplo
ghci> words " \nabds\tbfsas\n26egd\n\n3673qw"
[“abds","bfsas","26egd","3673qw"]

-fold(r/l)
DIFERENÇA!!!
foldr (-) 8 [4,7,3,5] = 4 – (7 – (3 – (5 - 8)))
 = 3
foldl (-) 8 [4,7,3,5] = (((8 - 4) – 7) – 3) – 5
 = -11

 foldr (+) 0 [1,2,3] == 1 + (2 + (3 + 0))) =/ foldl (+) 0 [1,2,3] = foldl (+) (0+1) [2,3]
                                                                  = foldl (+) ((0+1)+2) [3]
                                                                  = foldl (+) (((0+1)+2)+3) []
                                                                  = ((0+1)+2)+3
                                                                  = 6

-Arvóres binárias:ver imagem para entender conceito.
=> data BTree a = Empty
                | Node a (BTree a) (BTree a) --Node recebe um elemento e 2 arvores, e controi a arvore com esse elemento na raiz, uma arvore do lado esq. e outra do lado dir..
 deriving (Show)

 a) BTree definida
Empty :: BTree a
Node :: a -> (BTree a) -> (BTree a) -> (BTree a)

b)ver imagem para visualizar exemplo da uma arvore binaria.