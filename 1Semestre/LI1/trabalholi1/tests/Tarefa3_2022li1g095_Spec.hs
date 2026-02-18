module Tarefa3_2022li1g095_Spec where

import LI12223
import Tarefa3_2022li1g095
import Test.HUnit

testsT3 :: Test
testsT3 = TestLabel "Testes Tarefa 3" $ test ["Teste 1" ~: 1 ~=? 1]

-- jogoTerminou (Jogo (Jogador (0,2)) (Mapa 3 [(Rio 5,[Tronco,Nenhum,Tronco]), (Relva, [Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])])) False
-- jogoTerminou (Jogo (Jogador (1,2)) (Mapa 3 [(Rio 5,[Tronco,Nenhum,Tronco]), (Relva, [Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])])) True
--Esta função procura no mapa uma posição x e y. O y corresponde ao Terreno em que o jogador está posicionado e o x à lista de obstaculos, para tratar a coordenada x foi criada a função validaObstaculo.
