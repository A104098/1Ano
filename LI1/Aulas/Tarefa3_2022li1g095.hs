{- |
Module      : Tarefa3_2022li1g095
Description : Movimentação do personagem e obstáculos
Copyright   : Sara Azevedo Lopes <a104179@alunos.uminho.pt>
              Eduarda Mafalda Martins Viera <a104098@alunos.uminho.pt>

Módulo para a realização da Tarefa 3 do projeto de LI1 em 2022/23.
-}
module Tarefa3_2022li1g095 where

import LI12223

-- animaJogo (Jogo (Jogador (0,0)) (Mapa 4 [(Rio 5,[Tronco, Nenhum, Tronco]), (Relva, [Arvore, Arvore, Nenhum])])) Parado
-- animaJogo (Jogo (Jogador (2,2)) (Mapa 4 [(Rio 5,[Tronco, Nenhum, Tronco]), (Relva, [Arvore, Arvore, Nenhum])])) (Move Direita)
-- animaJogo (Jogo (Jogador (2,2)) (Mapa 4 [(Rio 1,[Tronco, Nenhum, Tronco]), (Estrada 2, [Carro, Carro, Nenhum])])) (Move Direita)
-- (Jogo (Jogador (x, y)) (Mapa l ((Rio v,(o)): ys)))
-- Validar que coordenadas iniciais do jogador saem do MAPA !!!!!!!
animaJogo :: Jogo -> Jogada -> Jogo
animaJogo (Jogo (Jogador (x, y)) (Mapa l (ys))) p = (Jogo (moveJogador (Jogador (x, y)) p l (length ys)) (Mapa l (animaMapa ys))) -- Jogar parado
animaJogo (Jogo (Jogador (x, y)) (Mapa l (ys))) (Move d) = (Jogo (moveJogador (Jogador (x, y)) (Move d) l (length ys)) (Mapa l (animaMapa ys))) -- Jogador move-se

-- animaMapa [(Rio 1,[Tronco, Nenhum, Tronco]), (Rio 2, [Arvore, Arvore, Nenhum])]
animaMapa :: [(Terreno,[Obstaculo])] -> [(Terreno,[Obstaculo])]
animaMapa [] = []
animaMapa ((Rio v,(o)):ys) = [(Rio v,(moverObstaculos v (o)))] ++ (animaMapa ys)
animaMapa ((Estrada v,(o)):ys) = [(Estrada v,(moverObstaculos v (o)))] ++ (animaMapa ys)
animaMapa ((Relva,(o)):ys) = [(Relva,(o))] ++ (animaMapa ys)


-- 1 5
moverObstaculos :: Int -> [Obstaculo] -> [Obstaculo]
moverObstaculos n l
  | n > 0 && n < length l = drop (length l - (abs n)) l ++ take (length l - (abs n)) l
  | n > 0 && n > length l = drop (length l - (mod n (length l))) l ++ take (length l - (mod n (length l))) l
  | n < 0 && (abs n) < length l = drop (abs n) l ++ take (abs n) l
  | n < 0 && (abs n) > length l = drop (length l - (mod n (length l))) l ++ take (length l - (mod n (length l))) l
  | otherwise = l


-- moveJogador (Jogador (5,4)) (Move Baixo) 5 4
-- moveJogador (Jogador (1,1)) Parado 5 4
-- 2 4
moveJogador :: Jogador -> Jogada -> Int -> Int -> Jogador
moveJogador (Jogador (x, y)) Parado l c = (Jogador (x, y))
moveJogador (Jogador (x, y)) (Move d) l c
  | d == Cima && y>0 = Jogador (x, y - 1)
  | d == Baixo && y<(c-1) = Jogador (x, y + 1)
  | d == Direita && x < (l-1) = Jogador (x + 1, y)
  | d == Esquerda && x > 0 = Jogador (x - 1, y)
  | otherwise = (Jogador (x, y))




{- data Jogo =
  Jogo
    Jogador -- ^ o personagem do jogo
    Mapa -- ^ o mapa em que se está a jogar
  deriving (Show, Read, Eq)

newtype Jogador =
  Jogador Coordenadas
  deriving (Show, Read, Eq)

-}

{-
data Jogada
  = Parado -- ^ tipo que define a ausência de uma acção do 'Jogador'
  | Move Direcao -- ^ um movimento do jogador numa determinada 'Direcao'
  deriving (Show, Read, Eq)




-}