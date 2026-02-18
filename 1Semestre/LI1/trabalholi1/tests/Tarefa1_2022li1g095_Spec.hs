module Tarefa1_2022li1g095_Spec where

import LI12223
import Tarefa1_2022li1g095
import Test.HUnit

--testsT1 :: Test
--testsT1 = TestLabel "Testes Tarefa 1" $ test ["Teste 1" ~: 1 ~=? 1]

-- mapaValido testes
t1test1 = TestCase (assertBool "Verifica se o mapa é válido" (mapaValido (Mapa 5 [(Estrada 3, [Nenhum, Carro, Carro, Carro, Nenhum]), (Rio 4, [Nenhum, Tronco, Nenhum, Nenhum, Tronco]), (Rio (-3), [Tronco, Tronco, Nenhum, Nenhum, Nenhum]), (Rio 3, [Tronco, Nenhum, Nenhum, Tronco, Tronco]), (Relva, [Nenhum, Nenhum, Arvore, Arvore, Arvore])])))
t1test2 = TestCase (assertBool "Verifica se o mapa é válido" (mapaValido (Mapa 3 [(Estrada 3, [Nenhum, Tronco, Tronco]), (Rio 4, [Nenhum, Tronco, Nenhum]), (Rio (-3), [Tronco, Tronco, Nenhum]), (Rio 3, [Tronco, Nenhum, Nenhum]), (Relva, [Nenhum, Nenhum, Arvore])])))
t1test3 = TestCase (assertBool "Verifica se o mapa é válido" (mapaValido (Mapa 3 [(Estrada 3, [Nenhum, Carro, Carro]), (Rio 4, [Nenhum, Tronco, Nenhum]), (Rio 3, [Tronco, Tronco, Nenhum]), (Rio 3, [Tronco, Nenhum, Nenhum]), (Relva, [Nenhum, Nenhum, Arvore])])))
t1test4 = TestCase (assertBool "Verifica se o mapa é válido" (mapaValido (Mapa 5 [(Estrada 3, [Nenhum, Carro, Carro, Carro, Carro]), (Rio 4, [Nenhum, Nenhum, Tronco, Tronco, Nenhum]), (Rio (-3), [Tronco, Nenhum, Tronco, Tronco, Nenhum]), (Rio 3, [Tronco, Nenhum, Tronco, Nenhum, Nenhum]), (Relva, [Nenhum, Arvore, Nenhum, Nenhum, Arvore])])))
t1test5 = TestCase (assertBool "Verifica se o mapa é válido" (mapaValido (Mapa 3 [(Estrada 3, [Nenhum, Carro]), (Rio 4, [Nenhum, Tronco, Nenhum]), (Rio (-3), [Tronco, Tronco, Nenhum]), (Rio 3, [Tronco, Nenhum, Nenhum]), (Relva, [Nenhum, Nenhum, Arvore])])))

testest1_2022li1g095 = TestList [
      TestLabel "Verifica se o mapa é válido" t1test1,
      TestLabel "Verifica se o mapa é válido" t1test2,
      TestLabel "Verifica se o mapa é válido" t1test3,
      TestLabel "Verifica se o mapa é válido" t1test4,
      TestLabel "Verifica se o mapa é válido" t1test5,
      TestLabel "Verifica se não existem obstáculos em terrenos impróprios" t1test1A1,
      TestLabel "Verifica se não existem obstáculos em terrenos impróprios" t1test1A2,
      TestLabel "Verifica se não existem obstáculos em terrenos impróprios" t1test1A3,
      TestLabel "Verifica se rios contíguos possuem direções opostas" t1test2A1, 
      TestLabel "Verifica se rios contíguos possuem direções opostas" t1test2A2,
      TestLabel "Verifica se rios contíguos possuem direções opostas" t1test2A3,
      TestLabel "Verifica se os troncos têm no máximo 5 unidades de comprimento, se os carros têm no máximo 3 unidades de comprimento e se em qualquer linha existe no mínimo um obstáculo do tipo Nenhum" t1test3A1,
      TestLabel "Verifica se os troncos têm no máximo 5 unidades de comprimento, se os carros têm no máximo 3 unidades de comprimento e se em qualquer linha existe no mínimo um obstáculo do tipo Nenhum" t1test3A2,
      TestLabel "Verifica se os troncos têm no máximo 5 unidades de comprimento, se os carros têm no máximo 3 unidades de comprimento e se em qualquer linha existe no mínimo um obstáculo do tipo Nenhum" t1test3A3,
      TestLabel "Verifica se o comprimento da lista de obstáculos de cada linha corresponde exatamente à largura do mapa" t1test4A1,
      TestLabel "Verifica se o comprimento da lista de obstáculos de cada linha corresponde exatamente à largura do mapa" t1test4A2,
      TestLabel "Verifica se o comprimento da lista de obstáculos de cada linha corresponde exatamente à largura do mapa" t1test4A3,
      TestLabel "Verifica se, contiguamente, não existem mais do que 4 rios, nem 5 estradas ou relvas" t1test5A1, 
      TestLabel "Verifica se, contiguamente, não existem mais do que 4 rios, nem 5 estradas ou relvas" t1test5A2,
      TestLabel "Verifica se, contiguamente, não existem mais do que 4 rios, nem 5 estradas ou relvas" t1test5A3

 ]

-- terrenoProprio testes
t1test1A1 = TestCase (assertBool "Verifica se não existem obstáculos em terrenos impróprios" (terrenoProprio (Mapa 5 [(Estrada 3, [Nenhum, Carro]), (Rio 4,[Nenhum, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Nenhum])])))
t1test1A2 = TestCase (assertBool "Verifica se não existem obstáculos em terrenos impróprios" (terrenoProprio (Mapa 5 [(Estrada 3, [Nenhum, Carro]), (Rio 4,[Arvore, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Nenhum])])))
t1test1A3 = TestCase (assertBool "Verifica se não existem obstáculos em terrenos impróprios" (terrenoProprio (Mapa 5 [])))

-- riosValido testes
t1test2A1 = TestCase (assertBool "Verifica se rios contíguos possuem direções opostas" (riosValido (Mapa 5 [(Rio 4, [Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Tronco]), (Rio (-1),[Nenhum, Tronco]), (Rio 2,[Tronco, Nenhum])])))
t1test2A2 = TestCase (assertBool "Verifica se rios contíguos possuem direções opostas" (riosValido (Mapa 5 [(Rio 4, [Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Tronco]), (Rio (-1),[Nenhum, Tronco]), (Rio (-2),[Tronco, Nenhum])])))
t1test2A3 = TestCase (assertBool "Verifica se rios contíguos possuem direções opostas" (riosValido (Mapa 5 [])))

-- obstaculoComprimento
t1test3A1 = TestCase (assertBool "Verifica se os troncos têm no máximo 5 unidades de comprimento, se os carros têm no máximo 3 unidades de comprimento e se em qualquer linha existe no mínimo um obstáculo do tipo Nenhum" (obstaculoComprimento (Mapa 5 [(Estrada 4, [Nenhum, Carro]), (Rio (-4), [Nenhum, Tronco, Tronco, Tronco, Tronco, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Tronco]), (Rio (-1),[Nenhum, Tronco]), (Rio (-2),[Tronco, Nenhum])])))
t1test3A2 = TestCase (assertBool "Verifica se os troncos têm no máximo 5 unidades de comprimento, se os carros têm no máximo 3 unidades de comprimento e se em qualquer linha existe no mínimo um obstáculo do tipo Nenhum" (obstaculoComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco,Tronco, Tronco, Tronco, Tronco, Tronco]), (Relva, [Nenhum, Arvore, Arvore, Tronco]), (Rio (-1),[Nenhum, Tronco]), (Rio (-2),[Tronco, Nenhum])])))
t1test3A3 = TestCase (assertBool "Verifica se os troncos têm no máximo 5 unidades de comprimento, se os carros têm no máximo 3 unidades de comprimento e se em qualquer linha existe no mínimo um obstáculo do tipo Nenhum" (obstaculoComprimento (Mapa 5 [])))

-- larguraComprimento
t1test4A1 = TestCase (assertBool "Verifica se o comprimento da lista de obstáculos de cada linha corresponde exatamente à largura do mapa" (larguraComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco,Tronco, Tronco, Tronco])])))
t1test4A2 = TestCase (assertBool "Verifica se o comprimento da lista de obstáculos de cada linha corresponde exatamente à largura do mapa" (larguraComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco,Tronco, Tronco])])))
t1test4A3 = TestCase (assertBool "Verifica se o comprimento da lista de obstáculos de cada linha corresponde exatamente à largura do mapa" (larguraComprimento (Mapa 5 [])))

-- terrenoValida
t1test5A1 = TestCase (assertBool "Verifica se, contiguamente, não existem mais do que 4 rios, nem 5 estradas ou relvas" (terrenoValida (Mapa 5 [(Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco,Tronco, Tronco]), (Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), (Rio (-4),[Nenhum, Tronco,Tronco, Tronco])])))
t1test5A2 = TestCase (assertBool "Verifica se, contiguamente, não existem mais do que 4 rios, nem 5 estradas ou relvas" (terrenoValida (Mapa 5 [(Estrada 3, [Nenhum, Carro]), (Rio 4,[Nenhum, Tronco]), (Rio 2, [Nenhum, Arvore, Arvore, Nenhum]), (Rio 2, [Nenhum, Tronco]), (Rio 4, [Tronco, Tronco, Nenhum]), (Rio 2, [Tronco, Nenhum])])))
t1test5A3 = TestCase (assertBool "Verifica se, contiguamente, não existem mais do que 4 rios, nem 5 estradas ou relvas" (terrenoValida (Mapa 5 []))) 