{- |
Module      : Tarefa4_2022li1g095
Description : Determinar se o jogo terminou
Copyright   : Sara Azevedo Lopes <a104179@alunos.uminho.pt>
              Eduarda Mafalda Martins Viera <a104098@alunos.uminho.pt>

Módulo para a realização da Tarefa 4 do projeto de LI1 em 2022/23.
-}
module Tarefa4_2022li1g095 where

import LI12223

{-|-A função 'jogoTerminou’ verifica se o jogador perdeu o jogo. Caso o resultado desta seja True, significa que o jogador perdeu. Se for False, então o jogador não perdeu. Esta função procura no mapa uma posição x e y. O y corresponde ao Terreno em que o jogador está posicionado e o x à lista de obstaculos, para tratar a coordenada x foi criada a função validaObstaculo.
-Para a elaboração desta função foram necessárias as funções auxiliares 'validaObstaculo', 'foraMapa', cujo propósito de cada uma será explicado ao longo deste trabalho.
-Assim, o jogador só perde, se for obtido um resultado True em cada função auxiliar, ou seja, este necessita de respeitar as condições que estas exigem. 
-Reçalva-se que, para exemplos fornecidos para as funções auxiliares, a validade de cada uma é independente das demais.
--De seguida, irá ser demonstrado um exemplo de quando o jogador perde(True) e quando não perde(False).

== Exemplo de quando o jogador perde

>>> jogoTerminou (Jogo (Jogador (1,2)) (Mapa 3 [(Rio 5,[Tronco,Nenhum,Tronco]), 
                                                (Relva, [Arvore,Arvore,Nenhum]),
                                                (Estrada 1,[Nenhum,Carro,Carro])])) 
True

Como a posição do jogador respeita todas as condições estabelecidas nas funções auxiliares, o jogador perde.

== Exemplo de quando o jogador não perde
>>> jogoTerminou (Jogo (Jogador (0,2)) (Mapa 3 [(Rio 5,[Tronco,Nenhum,Tronco]), 
                                       (Relva, [Arvore,Arvore,Nenhum]),
                                       (Estrada 1,[Nenhum,Carro,Carro])])) 
False

Como respeita todas as condições estabelecidas nas funções auxiliares, logo, o jogador perde.
Neste exemplo, não foi respeitado a auxiliar "validaObstaculo", pois o jogador não se encontra na mesma posição que o carro. Fazendo assim com que nãop perde-se por atropelamento.

-}

jogoTerminou :: Jogo -- ^ posição do jogador a ser avaliada 
  -> Bool -- ^ Validade da posição do jogador 
jogoTerminou (Jogo (Jogador (x,y)) (Mapa l ys))
    | not (foraMapa (x,y) l (length ys)) = (validaObstaculo ((!!) ys y) x) --valida se o jogador foi atropelado ou caiu ao rio se este não estiver fora do mapa
    | otherwise = True

{-| A função 'validaObstaculo' verifica se o jogador se encontra, ou não, no caso do terreno ser uma estrada, na posição de um carro. Além disso verifica ainda, no caso do terreno ser um rio, se o jogador se encontra ou não num tronco (se não se eonctrar num tronco, está na água, afogando-se). Esta função tembém verifica no caso do terreno ser na relva, se o jogador se encontra na posição de uma árvore ou não.

== Exemplo de quando o jogador se encontra na mesma posição do carro

>>> validaObstaculo (Estrada 3, [Carro,Nenhum,Carro,Nenhum]) 2
True

Esta posição do jogador é a mesma que o carro, levando ao atropelamento do jogador.

== Exemplo de quando a posição do jogador é diferente à do carro

>>> validaObstaculo (Estrada 3, [Carro,Nenhum,Carro,Nenhum]) 1
False

Neste exemplo a posição do jogador não corresponde à posição do carro, fazendo com que o jogador não seja atropelado.

== Exemplo de quando o jogador não se encontra na mesma posição que um tronco.
>>> validaObstaculo (Rio 3, [Tronco,Nenhum,Tronco,Nenhum]) 1
True

Neste exemplo, o jogador não se encontra na mesma posição que um tronco, fazendo com que o jogador se afogue e perca  o jogo.

== Exemplo de quando o jogador se encontra na mesma posição que um tronco.
>>> validaObstaculo (Rio 3, [Tronco,Nenhum,Tronco,Nenhum]) 0
False

Neste exemplo, o jogador não perde uma vez que está em cima de um tronco, não se afogando.

== Exemplo de quando o jogador se encontra na mesma posição que uma árvore

>>> validaObstaculo (Relva, [Arvore,Nenhum,Arvore,Nenhum]) 0
False

Neste exemplo, o jogador es encontra na mesma posição que uma arvore este não perde visto que apenas fica parado. Independentemente de o jogador estiver na mesma posição que uma árvore ou não, este não vai perder

-}


validaObstaculo :: (Terreno,[Obstaculo]) -- ^ escolha de terrenos e de obstaculos 
  -> Int -- ^ inteiro para ver se está na posição de algum obstáculo
   -> Bool -- ^ valida se está ou não na posição de um obstáculo
validaObstaculo (Rio v,(o)) x
  |((!!) (o) x) == Tronco = False  -- Se o Jogador se encontra fora de um troco, "morre afogado", ou seja perde o jogo. Uma das situações em que isso pode acontecer é se estiver num troco cujo movimento levou o troco a desaparecer do mapa por um wormhole
  | otherwise = True
validaObstaculo (Estrada v,(o)) x  -- Jogador parado é atropelado porque os carros movem-se, ou seja, obstaculos dos Terrenos Estrada e Relva movem-se mesmo quando o jogador fica parado, isso é garantido pela função animaJogo
  |((!!) (o) x) == Carro = True
  | otherwise = False
validaObstaculo (Relva,(o)) x
  |((!!) (o) x) == Arvore = False
  | otherwise = False

{-| A função 'foraMapa' verifica se o jogador se encontra dentro do mapa ou não. Com isto, se der True então significa que o jogador se encontra fora do mapa.

== Exemplo de quando o jogador se encontra fora do mapa
>>> foraMapa (-1,2) 1 1)
True

Neste exemplo, o jogador tem coordenadas fora do jogo fazendo assim que perca o jogo.

== Exemplo de quando o jogador se encontra dentro do jogo
>>> foraMapa (1,2) 3 3
False

Neste exemplo, o jogador não se encontra fora do mapa, fazendo com que este não perca o jogo.


-}

foraMapa :: Coordenadas -- ^ coordenadas que indicam a posição do jogador  
 -> Int -- ^ largura do mapa
  -> Int -- ^ comprimento do mapa = length [terreno]
  -> Bool -- ^ valida se está ou não dentro do mapa
foraMapa (x1,y1) l c
    | x1 > l-1 = True
    | y1 > c-1 = True
    | x1 < 0 = True   -- Também x e y menores do que zero porque existem movimentos para cima e para a esquerda além de rios com velocidade negativa, ou seja deslocam-se para a esquerda
    | y1 < 0 = True
    | otherwise = False
    | otherwise = False

