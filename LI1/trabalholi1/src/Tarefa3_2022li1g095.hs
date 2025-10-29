{- |
Module      : Tarefa3_2022li1g095
Description : Movimentação do personagem e obstáculos
Copyright   : Sara Azevedo Lopes <a104179@alunos.uminho.pt>
              Eduarda Mafalda Martins Viera <a104098@alunos.uminho.pt>

Módulo para a realização da Tarefa 3 do projeto de LI1 em 2022/23.
-}
module Tarefa3_2022li1g095 where

import LI12223

{-|-A função 'animaJogo' tem como objetivo movimentar obstáculos, de acordo com a velocidade do terreno em que se encontram, e o personagem, de acordo com a jogada efetuada.
Assim, através de um jogo e de uma jogada, irá ser obtido um novo jogo com as devidas alterações, tanto da posição de jogador como dos obstáculos.
-Para a elaboração desta função foram necessárias as funções auxiliares 'animaMapa', 'moverObstaculos', 'moveJogador'e 'trataExcecoesMove', cujo propósito de cada uma será explicado ao longo deste trabalho.
-Assim, observa-se que o novo jogo obtido, respeita as regras de todas as funções auxiliares referidas.
-De seguida, irá ser demonstrado um exemplo de um jogo gerado a partir de outro e de um jogada. 

== Exemplos

>>> animaJogo (Jogo (Jogador (0,0)) (Mapa 3 [(Rio 5, [Tronco, Nenhum, Tronco]), 
                                             (Relva, [Arvore, Arvore, Nenhum]),
                                             (Estrada 1, [Nenhum, Carro, Carro])])) Parado
Jogo (Jogador (2,0)) (Mapa 3 [(Rio 5, [Nenhum, Tronco, Tronco]),
                              (Relva, [Arvore, Arvore, Nenhum]), 
                              (Estrada 1, [Carro, Nenhum, Carro])])
Como o Jogador se encontrava em cima de um tronco, apesar de a sua Jogada ter sido Parado, ele acompanhou o movimento do tronco 
até ao limite do mapa, o qual não pode exceder.

>>> animaJogo (Jogo (Jogador (0,1)) (Mapa 3 [(Rio (-1), [Nenhum, Tronco, Tronco]), 
                                             (Relva, [Nenhum, Nenhum, Arvore]), 
                                             (Estrada 1, [Carro, Nenhum, Carro])])) (Move Direita)
Jogo (Jogador (1,1)) (Mapa 3 [(Rio (-1), [Tronco, Tronco, Nenhum]),
                              (Relva, [Nenhum, Nenhum, Arvore]),
                              (Estrada 1, [Carro, Carro, Nenhum])])
Nesta situação, podemos observar que o jogador moveu-se conforme a sua jogada e que os obstáculos também foram animados.

>>> animaJogo (Jogo (Jogador (1,1)) (Mapa 3 [(Rio (-1), [Tronco, Nenhum, Tronco]), 
                                             (Relva, [Nenhum, Nenhum, Arvore]), 
                                             (Relva, [Nenhum, Arvore, Nenhum])])) (Move Baixo)
Jogo (Jogador (1,1)) (Mapa 3 [(Rio (-1),[Nenhum, Tronco, Tronco]),
                              (Relva ,[Nenhum, Nenhum, Arvore]),
                              (Relva ,[Nenhum, Arvore, Nenhum])])
Neste exemplo, o jogador manteve a sua posição, uma vez que não conseguia ir para baixo, devido à posição inferior estar ocupada 
por uma árvore.
No entanto, os obstáculos foram animados.     
                              
-}


-- animaJogo (Jogo (Jogador (0,0)) (Mapa 3 [(Rio (-1),[Tronco,Nenhum,Tronco]), (Relva, [Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])])) Parado



animaJogo :: Jogo -- ^ Jogador e mapa antes da jogada
              -> Jogada -- ^ Jogada dada como parâmetro 
               -> Jogo -- ^ Nova posição do jogador e dos obstáculos nos seus respetivos terrenos
animaJogo (Jogo (Jogador (x, y)) (Mapa l (ys))) Parado = (Jogo (moveJogador (Jogador (x, y)) Parado l (length ys) ys) (Mapa l (animaMapa ys))) -- Jogar parado
animaJogo (Jogo (Jogador (x, y)) (Mapa l (ys))) (Move d) = (Jogo (moveJogador (Jogador (x, y)) (Move d) l (length ys) ys) (Mapa l (animaMapa ys))) -- Jogador move-se

-- animaMapa [(Rio 1, [Tronco, Nenhum, Tronco]), (Rio 2, [Arvore, Arvore, Nenhum])]
{-| A função 'animaMapa' é responsável por animar os obstáculos, nos seus respetivos terrenos. 

== Exemplos

>>> animaMapa [(Rio (-1), [Tronco, Nenhum, Tronco]), 
               (Estrada 2, [Carro, Carro, Nenhum])]
[(Rio (-1), [Nenhum, Tronco, Tronco]),
 (Estrada 2, [Carro, Nenhum, Carro])]
Conforme o valor da velocidade e o seu sinal, os obstáculos movem-se em direções e distancias diferentes.

>>> animaMapa [(Relva, [Arvore, Nenhum, Arvore]), 
               (Estrada 2, [Carro, Carro, Nenhum])]
[(Relva,[Arvore,Nenhum,Arvore]),
 (Estrada 2,[Carro,Nenhum,Carro])]
 Reçalva-se que ao contrário dos troncos e dos carros, as árvores permanecem estáticas.
-}

animaMapa :: [(Terreno,[Obstaculo])] -- ^ Terrenos e os seus obstáculos por animar
               -> [(Terreno,[Obstaculo])] -- ^ Terrenos e os seus obstáculos depois de animados
animaMapa [] = []
animaMapa ((Rio v,(o)):ys) = [(Rio v,(moverObstaculos v (o)))] ++ (animaMapa ys)
animaMapa ((Estrada v,(o)):ys) = [(Estrada v,(moverObstaculos v (o)))] ++ (animaMapa ys)
animaMapa ((Relva,(o)):ys) = [(Relva,(o))] ++ (animaMapa ys)

{-| A função 'moverObstaculos' permite que numa estrada ou rio com velocidade v, os obstáculos se movam determinado valor de unidades, sendo este obtido pelo 
módulo da velocidade. Estes podem mover-se para a direita se a velocidade for positiva e para a esquerda se esta for negativa. Adicionalmente, esta função
também leva a que, quando os obstáculos de uma linha se deslocam e desaparecem por um dos lados do mapa, voltem a reaparecer pelo outro lado.

== Exemplos

>>> moverObstaculos 1 [Carro, Carro, Nenhum, Nenhum, Nenhum, Nenhum]
[Nenhum, Carro, Carro, Nenhum, Nenhum, Nenhum]
Como o módulo da velocidade é 1, então os obstáculos moveram 1 unidade e como a velocidade é positiva, o movimento efetuado é 
para a direita.

>>> moverObstaculos (-3) [Tronco, Tronco, Nenhum, Nenhum, Nenhum, Nenhum]
[Nenhum, Nenhum, Nenhum, Tronco, Tronco, Nenhum]
Como o módulo da velocidade é 3, então os obstáculos moveram 3 unidades e como a velocidade é negativa, o movimento efetuado é
para a esquerda.
-}

moverObstaculos :: Int -- ^ Velocidade 
                    -> [Obstaculo] -- ^ Lista por animar
                     -> [Obstaculo] -- ^ Lista animada
moverObstaculos n l
  | n > 0 && n < length l = drop (length l - (abs n)) l ++ take (length l - (abs n)) l
  | n > 0 && n > length l = drop (length l - (mod n (length l))) l ++ take (length l - (mod n (length l))) l
  | n < 0 && (abs n) < length l = drop (abs n) l ++ take (abs n) l
  | n < 0 && (abs n) > length l = drop (length l - (mod n (length l))) l ++ take (length l - (mod n (length l))) l
  | otherwise = l


{-| A função 'moveJogador' permite que o jogador se desloque em um mapa através das jogadas, como por exemplo, a jogada /Move Cima/ faz o jogador mover uma
unidade para cima. Adicionalmente, esta função não permite que o jogado saia do mapa através dos seus movimentos.

== Exemplos
>>> moveJogador (Jogador (1,1)) (Move Direita) 4 3 [(Rio 2, [Tronco, Nenhum, Nenhum, Tronco]), 
                                                    (Relva, [Arvore, Nenhum, Nenhum, Nenhum]), 
                                                    (Estrada (-1), [Carro, Carro, Carro, Nenhum])]
Jogador (2,1)
A jogada Move Direita fez o jogador mover 1 unidade para a direita.

>>> moveJogador (Jogador (1,0)) (Move Cima) 4 3 [(Rio 2, [Tronco, Nenhum, Nenhum, Tronco]), 
                                                 (Relva, [Arvore, Nenhum, Nenhum, Nenhum]), 
                                                 (Estrada (-1), [Carro, Carro, Carro, Nenhum])]
Jogador (1,0)  
Como o jogador já estava no limite superior do mapa, a jogada Move Cima não tem qualquer efeito.-}

moveJogador :: Jogador -- ^ Jogador e as suas coordenadas
                -> Jogada -- ^ Jogada a efetuar 
                 -> Int -- ^ Largura
                  -> Int -- ^ Comprimento
                   -> [(Terreno,[Obstaculo])] -- ^ Local onde ocorre o movimento
                    -> Jogador -- ^ Jogador e as suas novas coordenadas 
moveJogador (Jogador (x, y)) Parado l c lista = trataExcecoesMove l (Jogador (x, y)) ((!!) lista (y)) (x,y)
moveJogador (Jogador (x, y)) (Move d) l c lista
  | d == Cima && y>0  = trataExcecoesMove l (Jogador (x, y - 1)) ((!!) lista (y-1)) (x,y)
  | d == Baixo && y<(c-1) = trataExcecoesMove l (Jogador (x, y + 1)) ((!!) lista (y+1)) (x,y)
  | d == Direita && x < (l-1)  = trataExcecoesMove l (Jogador (x+1, y)) ((!!) lista (y)) (x,y)
  | d == Esquerda && x > 0  =  trataExcecoesMove l (Jogador (x-1, y)) ((!!) lista (y)) (x,y)
  | otherwise = (Jogador (x,y))


{-| Para a elaboração da função 'moveJogador', foi necessário o desenvolvimento da função auxiliar 'trataExcecoesMove'.
Esta permite o tratamento de casos particulares. Um desses casos ocorre quando um jogador acompanha o movimento de um tronco, por estar em cima dele, 
até atingir o limite da largura do mapa, tanto à direita como à esquerda. Quando o atinge, à coordenada da largura é atribuído o valor de 0 ou subtrai-se 
à largura 1 unidade, caso ele se encontre à direita ou à esquerda, respetivamente. O outro caso que esta função também trata, é quando o movimento do Jogador
o leva contra uma árvore. Quando isto ocorre, o Jogador manterá as coordenadas que já possuia antes da jogada.  

== Exemplos

>>> trataExcecoesMove 6 (Jogador(2,0)) (Rio 4, [Tronco, Tronco, Tronco, Tronco, Nenhum, Nenhum]) (0,0)
Jogador (5,0)

Nesta situação, o jogador deveria ter permanecido nas coordenadas (6,0), tal acontecimento não é permitido por esta função, pois esta impede que o Jogador saia do mapa.

>>> trataExcecoesMove 6 (Jogador(3,0)) (Relva, [Arvore, Arvore, Nenhum, Arvore, Arvore, Arvore]) (2,0)
Jogador (2,0)

Nesta situação, o jogador tentou-se mover para uma posição ocupada por uma árvore, sendo que esta função impediu que o conseguisse, mantendo o jogador na posição anterior a essa jogada.
-}

trataExcecoesMove :: Int -- ^ Largura
                      -> Jogador -- ^ Jogador e as suas coordenadas 
                       -> (Terreno,[Obstaculo]) -- ^ Local onde ocorre o movimento
                        -> Coordenadas -- ^ Posição inicial do jogador
                         -> Jogador -- ^ Jogador e as suas novas coordenadas
trataExcecoesMove l (Jogador (x, y)) (Rio v,(o)) (_,_)
  | ((!!) (o) x) == Tronco && (x+v) <= (l-1) && (x+v) >=0 = Jogador (x+v,y)
  | ((!!) (o) x) == Tronco && (x+v) >= l = (Jogador ((l-1),y))
  | ((!!) (o) x) == Tronco && (x+v) < 0 = (Jogador ((0,y)))
  | otherwise =  (Jogador (x,y))
trataExcecoesMove l (Jogador (x, y)) (Estrada _,(o)) (_,_)=  (Jogador (x,y))
trataExcecoesMove l (Jogador (x, y)) (Relva,(o)) (x1,y1)
  | ((!!) (o) x) == Arvore = (Jogador (x1,y1))
  | otherwise = (Jogador (x,y))
