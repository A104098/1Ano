
module Tarefa4_2022li1g095_Spec where

import LI12223
import Tarefa4_2022li1g095
import Test.HUnit

testsT4 :: Test
testsT4 = TestLabel "Testes Tarefa 4" $ test ["Teste 1" ~: 1 ~=? 1]

--jogoTerminou testes

t4test1 = TestCase (assertEqual "Verifica se o jogador perdeu" jogoTerminou (Jogo (Jogador (0,4)) (Mapa 3 [(Rio 5,[Tronco,Nenhum,Tronco]), (Relva, [Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])])))
t4test2 = TestCase (assertEqual "Verifica se o jogador perdeu" jogoTerminou (Jogo (Jogador (0,1)) (Mapa 2 [(Rio 3,[Nenhum,Tronco]), (Estrada 2, [Carro, Nenhum])])))
t4test3 = TestCase (assertEqual "Verifica se o jogador perdeu" jogoTerminou (Jogo (Jogador (-1,0)) (Mapa 3 [(Rio 5,[Tronco,Nenhum,Tronco]), (Relva, [Arvore,Arvore,Nenhum]),(Estrada 3,[Nenhum,Carro,Carro])])))
t4test4 = TestCase (assertEqual "Verifica se o jogador perdeu" jogoTerminou (Jogo (Jogador (0,0)) (Mapa 3 [(Rio 5,[Nenhum,Tronco,Nenhum]), (Relva, [Arvore,Nenhum,Nenhum]),(Estrada 3,[Nenhum,Carro,Carro])])))
t4test5 = TestCase (assertEqual "Verifica se o jogador perdeu" jogoTerminou (Jogo (Jogador (0,4)) (Mapa 4 [(Rio 3,[Tronco,Nenhum,Tronco,Tronco]), (Relva, [Arvore,Nenhum,Nenhum,Arvore]),(Estrada 1,[Nenhum,Carro,Carro,Nenhum])]))

--validaObstaculo testes

t4test1A1 = TestCase (assertEqual "Verifica se o jogador se afogou" validaObstaculo (Rio 2, [Tronco,Nenhum,Tronco]) 1)
t4test1A2 = TestCase (assertEqual "Verifica se o jogador se afogou" validaObstaculo (Rio 2, [Tronco,Nenhum,Tronco,Nenum,Nenhum]) 3)
t4test1A3 = TestCase (assertEqual "Verifica se o jogador foi atropelado" validaObstaculo (Estrada 3, [Carro,Nenhum,Carro,Nenhum]) 2)
t4test1A4 = TestCase (assertEqual "Verifica se o jogador foi atropelado" validaObstaculo (Estrada 2, [Nenhum,Carro,Carro,Nenhum,Carro]) 1)

--foraMapa testes
t4test2A1 = TestCase (assertEqual "Verifica se o jogador está fora do mapa" foraMapa (1,2) 1 1)
t4test2A2 = TestCase (assertEqual "Verifica se o jogador está fora do mapa" foraMapa (-1,2) 1 1)
t4test2A3 = TestCase (assertEqual "Verifica se o jogador está fora do mapa" foraMapa (4,2) 2 3)

