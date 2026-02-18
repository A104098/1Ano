module Tarefa2_2022li1g095_Spec where

import LI12223
import Tarefa2_2022li1g095
import Test.HUnit

-- estendeMapa testes
t2test1 = TestCase (assertEqual "Cria uma nova linha válida no topo de um mapa" (Mapa 6 [(Estrada (-4),[Nenhum,Carro,Nenhum,Nenhum,Nenhum,Carro]),(Rio 3,[Nenhum,Tronco,Tronco,Tronco,Nenhum,Tronco]),(Estrada 2,[Carro,Carro,Nenhum,Carro,Nenhum,Nenhum]),(Relva,[Arvore,Arvore,Nenhum,Nenhum,Arvore,Nenhum])]) (estendeMapa (Mapa 6 [(Rio 3, [Nenhum, Tronco, Tronco, Tronco, Nenhum, Tronco]), (Estrada 2, [Carro, Carro, Nenhum, Carro, Nenhum, Nenhum]), (Relva, [Arvore, Arvore, Nenhum, Nenhum, Arvore, Nenhum])]) 20))
t2test2 = TestCase (assertEqual "Indica quais são os terrenos válidos seguintes" (Mapa 6 [(Relva,[Nenhum,Arvore,Nenhum,Nenhum,Nenhum,Arvore]),(Rio 3,[Nenhum,Tronco,Tronco,Tronco,Nenhum,Tronco]),(Rio (-3),[Tronco,Tronco,Nenhum,Tronco,Nenhum,Nenhum]),(Rio 1,[Tronco,Tronco,Nenhum,Nenhum,Tronco,Nenhum]),(Rio (-2),[Nenhum,Tronco,Nenhum,Nenhum,Nenhum,Tronco])]) (estendeMapa (Mapa 6 [(Rio 3, [Nenhum, Tronco, Tronco, Tronco, Nenhum, Tronco]), (Rio (-3), [Tronco, Tronco, Nenhum, Tronco, Nenhum, Nenhum]), (Rio 1, [Tronco, Tronco, Nenhum, Nenhum, Tronco, Nenhum]), (Rio (-2), [Nenhum, Tronco, Nenhum, Nenhum, Nenhum, Tronco])]) 20))
t2test3 = TestCase (assertEqual "Indica quais são os terrenos válidos seguintes" (Mapa 6 [(Relva,[Nenhum,Arvore,Nenhum,Nenhum,Nenhum,Arvore]),(Estrada 3,[Nenhum,Carro,Carro,Carro,Carro,Carro]),(Estrada (-3),[Carro,Carro,Nenhum,Carro,Nenhum,Nenhum]),(Estrada 1,[Carro,Carro,Nenhum,Nenhum,Carro,Nenhum]),(Estrada (-2),[Nenhum,Carro,Nenhum,Carro,Nenhum,Carro]),(Estrada 4,[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum])]) (estendeMapa (Mapa 6 [(Estrada 3, [Nenhum, Carro, Carro, Carro, Carro, Carro]), (Estrada (-3), [Carro, Carro, Nenhum, Carro, Nenhum, Nenhum]), (Estrada 1, [Carro, Carro, Nenhum, Nenhum, Carro, Nenhum]), (Estrada (-2), [Nenhum, Carro, Nenhum, Carro, Nenhum, Carro]), (Estrada 4, [Carro, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])]) 20))
t2test4 = TestCase (assertEqual "Indica quais são os terrenos válidos seguintes" (Mapa 6 [(Rio (-4),[Nenhum,Tronco,Nenhum,Nenhum,Nenhum,Tronco]),(Relva,[Nenhum,Nenhum,Arvore,Arvore,Arvore,Arvore]),(Relva,[Arvore,Arvore,Nenhum,Arvore,Nenhum,Nenhum]),(Relva,[Arvore,Arvore,Nenhum,Nenhum,Arvore,Nenhum]),(Relva,[Nenhum,Arvore,Nenhum,Arvore,Nenhum,Arvore]),(Relva,[Arvore,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum])]) (estendeMapa (Mapa 6 [(Relva, [Nenhum, Nenhum, Arvore, Arvore, Arvore, Arvore]), (Relva, [Arvore, Arvore, Nenhum, Arvore, Nenhum, Nenhum]), (Relva, [Arvore, Arvore, Nenhum, Nenhum, Arvore, Nenhum]), (Relva, [Nenhum, Arvore, Nenhum, Arvore, Nenhum, Arvore]), (Relva, [Arvore, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])]) 20))

testest2_2022li1g095 = TestList [
      TestLabel "Cria uma nova linha válida no topo de um mapa" t2test1,
      TestLabel "Cria uma nova linha válida no topo de um mapa" t2test2,
      TestLabel "Cria uma nova linha válida no topo de um mapa" t2test3,
      TestLabel "Cria uma nova linha válida no topo de um mapa" t2test4,
      TestLabel "Define uma velocidade para os novos terrenos gerados" t2test1A1,
      TestLabel "Define uma velocidade para os novos terrenos gerados" t2test1A2,
      TestLabel "Constrói uma alternativa" t2test2A1,
      TestLabel "Constrói uma alternativa" t2test2A2,
      TestLabel "Constrói uma lista de obstáculos" t2test3A1,
      TestLabel "Constrói uma lista de obstáculos" t2test3A2,
      TestLabel "Constrói uma lista de obstáculos" t2test3A3,
      TestLabel "Indica quais são os terrenos válidos seguintes" t2test4A1,
      TestLabel "Indica quais são os terrenos válidos seguintes" t2test4A2,
      TestLabel "Indica quais são os terrenos válidos seguintes" t2test4A3,
      TestLabel "Indica quais são os obstáculos válidos seguintes" t2test5A1,
      TestLabel "Indica quais são os obstáculos válidos seguintes" t2test5A2,
      TestLabel "Indica quais são os obstáculos válidos seguintes" t2test5A3
 ]

-- atualizaVelocidadeEArvores testes
t2test1A1 = TestCase (assertEqual "Define uma velocidade para os novos terrenos gerados" (Mapa 3 [(Rio 3,[Tronco,Nenhum,Tronco]),(Rio (-2),[Tronco,Tronco,Nenhum]),(Relva,[Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])]) (atualizaVelocidadeEArvores (Mapa 3 [(Rio 0,[Tronco,Nenhum,Tronco]), (Rio (-2),[Tronco, Tronco, Nenhum]),(Relva, [Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])]) 89))
t2test1A2 = TestCase (assertEqual "Define uma velocidade para os novos terrenos gerados" (Mapa 3 [(Estrada (-2),[Nenhum,Nenhum,Carro]),(Estrada (-2),[Carro,Carro,Nenhum]),(Relva,[Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])]) (atualizaVelocidadeEArvores (Mapa 3 [(Estrada 0,[Nenhum,Nenhum,Carro]), (Estrada (-2),[Carro, Carro, Nenhum]),(Relva, [Arvore,Arvore,Nenhum]),(Estrada 1,[Nenhum,Carro,Carro])]) 19))

-- garantePassagemEntreArvores testes
t2test2A1 = TestCase (assertEqual "Constrói uma alternativa" [Nenhum,Arvore,Nenhum] (garantePassagemEntreArvores [Arvore,Arvore,Nenhum] [Nenhum,Arvore,Arvore] 3 10))
t2test2A2 = TestCase (assertEqual "Constrói uma alternativa" [Nenhum,Arvore,Nenhum] (garantePassagemEntreArvores [Nenhum,Arvore,Nenhum] [Nenhum,Arvore,Arvore] 3 10))

-- constroiListaObstaculos
t2test3A1 = TestCase (assertEqual "Constrói uma lista de obstáculos" [Arvore,Nenhum,Nenhum] (constroiListaObstaculos 3 60 (Relva,[]) 3))
t2test3A2 = TestCase (assertEqual "Constrói uma lista de obstáculos" [Arvore,Nenhum,Nenhum,Nenhum] (constroiListaObstaculos 4 60 (Relva,[]) 4))
t2test3A3 = TestCase (assertEqual "Constrói uma lista de obstáculos" [Tronco,Nenhum,Tronco,Tronco,Nenhum,Tronco,Nenhum,Nenhum,Nenhum,Nenhum] (constroiListaObstaculos 10 60 (Rio 2,[]) 10))

-- proximosTerrenosValidos testes
t2test4A1 = TestCase (assertEqual "Indica quais são os terrenos válidos seguintes" [Estrada 0, Relva] (proximosTerrenosValidos (Mapa 3 [(Rio 3, [Nenhum, Tronco, Tronco]), (Rio 3, [Nenhum, Tronco, Nenhum]), (Rio (-3), [Tronco, Tronco, Nenhum]), (Rio (-3), [Tronco , Nenhum, Nenhum]), (Rio 3, [Nenhum, Nenhum, Tronco]), (Relva, [Arvore, Nenhum, Nenhum])])))
t2test4A2 = TestCase (assertEqual "Indica quais são os terrenos válidos seguintes" [Rio 0, Estrada 0, Relva] (proximosTerrenosValidos (Mapa 3 [(Estrada 3, [Nenhum, Tronco, Tronco]), (Rio 4, [Nenhum, Tronco, Nenhum]), (Rio (-3), [Tronco, Tronco, Nenhum]), (Rio 3, [Tronco, Nenhum, Nenhum]), (Relva, [Nenhum, Nenhum, Arvore])])))
t2test4A3 = TestCase (assertEqual "Indica quais são os terrenos válidos seguintes" [Rio 0, Estrada 0, Relva] (proximosTerrenosValidos (Mapa 3 [])))

-- proximosObstaculosValidos testes
t2test5A1 = TestCase (assertEqual "Indica quais são os obstáculos válidos seguintes" [Nenhum] (proximosObstaculosValidos 5 (Estrada 3, [Carro, Carro, Nenhum, Carro]) 1))
t2test5A2 = TestCase (assertEqual "Indica quais são os obstáculos válidos seguintes" [Nenhum, Carro] (proximosObstaculosValidos 5 (Estrada 3, [Nenhum, Carro, Nenhum, Carro]) 1))
t2test5A3 = TestCase (assertEqual "Indica quais são os obstáculos válidos seguintes" [Nenhum, Tronco] (proximosObstaculosValidos 3 (Rio 3, []) 3))

