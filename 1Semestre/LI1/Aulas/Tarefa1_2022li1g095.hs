{- |
Module      : Tarefa1_2022li1g095
Description : Validação de um mapa
Copyright   : Sara Azevedo Lopes <a104179@alunos.uminho.pt>
              Eduarda Mafalda Martins Viera <a104098@alunos.uminho.pt>

Módulo para a realização da Tarefa 1 do projeto de LI1 em 2022/23.
-}
module Tarefa1_2022li1g095 where

import LI12223


mapaValido :: Mapa -> Bool
-- testes: mapaValido (Mapa 5 [(Estrada 3, [Nenhum, Carro]), (Rio 4,[Nenhum, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Nenhum])])
mapaValido (Mapa _ []) = True
mapaValido (Mapa l ((Rio v, (o)): ys))
  | not (elem Carro o) && not (elem Arvore o) = True && mapaValido (Mapa l ys)
  | otherwise = False
mapaValido (Mapa l ((Estrada v, (o)): ys))
  | not (elem Tronco o) && not (elem Arvore o) = True && mapaValido (Mapa l ys)
  | otherwise = False
mapaValido (Mapa l ((Relva, (o)): ys))
  | not (elem Tronco o) && not (elem Carro o) = True && mapaValido (Mapa l ys)
  | otherwise = False


riosValido :: Mapa -> Bool
-- testes: riosValido (Mapa 5 [(Rio 4, [Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Tronco]), (Rio (-1),[Nenhum, Tronco]), (Rio (-2),[Tronco, Nenhum])])
riosValido (Mapa _ []) = True
riosValido (Mapa l ((Rio v1, (o1)):(Rio v2, (o2)): ys))
  | (v1 >0 && v2 <0) || (v1 <0 && v2 >0)  = True && riosValido (Mapa l ((Rio v2, (o2)): ys))
  | otherwise = False
riosValido (Mapa l ((Rio v, (o)): ys)) = riosValido (Mapa l ys)
riosValido (Mapa l ((Estrada v, (o)): ys)) = riosValido (Mapa l ys)
riosValido (Mapa l ((Relva, (o)): ys)) = riosValido (Mapa l ys)

obstaculoComprimento :: Mapa -> Bool
-- testes: obstaculoComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco,Tronco, Tronco, Tronco, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Tronco]), (Rio (-1),[Nenhum, Tronco]), (Rio (-2),[Tronco, Nenhum])])
obstaculoComprimento (Mapa _ []) = True -- Considera-se que é impossível a situação de um rio sem troncos VER!!!!!!!!!!!!!!!!
obstaculoComprimento (Mapa l ((t, (o)): ys)) 
  | (count_maxSeq Tronco o <= 5) && (count_maxSeq Carro o <= 3) && (count_maxSeq Nenhum o >= 1) = True && obstaculoComprimento (Mapa l ys)
  | otherwise = False


count_maxSeq :: Eq a => a -> [a] -> Int  --- Exemplo 
count_maxSeq f l = countmax f l 0 0
    where      
       countmax :: Eq a => a -> [a] -> Int -> Int -> Int
       countmax f [] i max = (if i > max then i else max)
       countmax f (x:xs) i max 
            | f == x = countmax f xs (i+1) max
            | otherwise = countmax f xs 0 (if i > max then i else max)

larguraComprimento :: Mapa -> Bool
-- larguraComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco,Tronco, Tronco, Tronco])])
larguraComprimento (Mapa l []) = True
larguraComprimento (Mapa l ((t, (o)): ys)) 
  | l == length o = True && larguraComprimento (Mapa l ys)
  | otherwise = False

{- terrenoValida :: Mapa -> Bool
terrenoValida (Mapa l []) = True
terrenoValida  (Mapa l ((t, (o)): ys)) 
  | (contaRios (Mapa l ((t, (o)): ys)) 0 <= 4) = True && terrenoValida (Mapa l ys)
  | otherwise = False
     where -}  
      
contaRios :: Mapa -> Int -> Int
contaRios (Mapa l []) i = i
contaRios (Mapa l ((Rio v1, (o1)):(Rio v2, (o2)): ys)) i = contaRios (Mapa l ((Rio v2, (o2)): ys)) (i+1) 
contaRios (Mapa l ((Rio v, (o)): ys)) i = i 
contaRios (Mapa l ((Estrada v, (o)): ys)) i = i
contaRios (Mapa l ((Relva, (o)): ys)) i =  i



{- data Mapa =
  Mapa Largura [(Terreno, [Obstaculo])]
  deriving (Show, Read, Eq) -}

