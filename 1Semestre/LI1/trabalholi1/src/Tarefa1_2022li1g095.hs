{- |
Module      : Tarefa1_2022li1g095
Description : Validação de um mapa
Copyright   : Sara Azevedo Lopes <a104179@alunos.uminho.pt>
              Eduarda Mafalda Martins Viera <a104098@alunos.uminho.pt>

Módulo para a realização da Tarefa 1 do projeto de LI1 em 2022/23.
-}

module Tarefa1_2022li1g095 where

import LI12223

{-|-A função 'mapaValido’ verifica a validade de um mapa. Caso o resultado desta seja True, este será válido. Se for False, então não será válido.
-Para a elaboração desta função foram necessárias as funções auxiliares 'terrenoProprio', 'riosValido', 'obstaculoComprimento', 'larguraComprimento' e 'terrenoValida', cujo propósito de cada uma será explicado ao longo deste trabalho.
-Assim, a obtenção de um mapa válido, só é possível se for obtido um resultado True em cada função auxiliar, ou seja, este necessita de respeitar as condições que estas exigem. 
-Reçalva-se que, para exemplos fornecidos para as funções auxiliares, a validade de cada uma é independente das demais.
-De seguida, irá ser demonstrado um exemplo de mapa válido, ou seja, que vai de acordo com todas auxiliares, e um mapa inválido, ou seja, que não vai de acordo com uma ou mais auxiliares.


== Exemplo de um mapa válido

>>> mapaValido (Mapa 5 [(Estrada 3, [Nenhum, Carro, Carro, Carro, Nenhum]), 
                        (Rio 4, [Nenhum, Tronco, Nenhum, Nenhum, Tronco]), 
                        (Rio (-3), [Tronco, Tronco, Nenhum, Nenhum, Nenhum]), 
                        (Rio 3, [Tronco, Nenhum, Nenhum, Tronco, Tronco]), 
                        (Relva, [Nenhum, Nenhum, Arvore, Arvore, Arvore])])))
True
Este mapa respeita todas as condições estabelecidas nas funções auxiliares, logo, o mapa é válido.

== Exemplo de um mapa inválido

>>> mapaValido (Mapa 3 [(Estrada 3, [Nenhum, Tronco, Tronco]), 
                        (Rio 4, [Nenhum, Tronco, Nenhum]), 
                        (Rio (-3), [Tronco, Tronco, Nenhum]), 
                        (Rio 3, [Tronco, Nenhum, Nenhum]), 
                        (Relva, [Nenhum, Nenhum, Arvore])])))
False
Nesta situação exemplo, não foi respeitada a auxiliar 'terrenoProprio', pois podemos observar obstáculos em terrenos impróprios. 
Por outras palavras, não deveriam existir troncos em estradas, tal acontecimento classifica o mapa como inválido.
-}

mapaValido :: Mapa -- ^ Mapa a avaliar
               -> Bool -- ^ Validade do Mapa
mapaValido (Mapa l []) = False
mapaValido (Mapa l to) = terrenoProprio (Mapa l to) &&
                         riosValido (Mapa l to) &&
                         obstaculoComprimento (Mapa l to) &&
                         larguraComprimento (Mapa l to) &&
                         terrenoValida (Mapa l to)

{-| A função 'terrenoProprio' verifica se não existem obstáculos em terrenos impróprios, e.g. troncos em estradas ou relvas, árvores em rios ou estradas, etc.

== Exemplo de um mapa com terreno válido

>>> terrenoProprio (Mapa 5 [(Estrada 3, [Nenhum, Carro]), 
                            (Rio 4,[Nenhum, Tronco]), 
                            (Relva, [Nenhum, Arvore, Arvore, Nenhum])])
True
Este mapa possui carros apenas em estradas, troncos apenas em rios e árvores apenas na relva.
Logo cada obstáculo está no respetivo terreno, o que torna o mapa válido para esta função. 

== Exemplo de um mapa com terreno inválido

>>> terrenoProprio (Mapa 5 [(Estrada 3, [Nenhum, Carro]), 
                            (Rio 4,[Arvore, Tronco]), 
                            (Relva, [Nenhum, Arvore, Arvore, Nenhum])])
False
Este mapa possui uma árvore em um rio, ou seja, um obstáculo num terreno impróprio. 
Logo, o mapa é inválido para esta função.
-}

terrenoProprio :: Mapa -- ^ Mapa a avaliar
                  -> Bool -- ^ Verificação da existência de obstáculos nos terrenos que lhes são devididamente destinados
terrenoProprio (Mapa _ []) = True
terrenoProprio (Mapa l ((Rio v, (o)): ys))
  | not (elem Carro o) && not (elem Arvore o) = True && terrenoProprio (Mapa l ys)
  | otherwise = False
terrenoProprio (Mapa l ((Estrada v, (o)): ys))
  | not (elem Tronco o) && not (elem Arvore o) = True && terrenoProprio (Mapa l ys)
  | otherwise = False
terrenoProprio (Mapa l ((Relva, (o)): ys))
  | not (elem Tronco o) && not (elem Carro o) = True && terrenoProprio (Mapa l ys)
  | otherwise = False

{-| A função 'riosValido' verifica se rios contíguos têm direcões opostas.

== Exemplo de um mapa com uma sequência de rios válida

>>> riosValido (Mapa 5 [(Rio 4, [Nenhum, Carro]), 
                        (Rio (-4),[Nenhum, Tronco]), 
                        (Relva, [Nenhum, Arvore, Arvore, Tronco]), 
                        (Rio (-1),[Nenhum, Tronco]), 
                        (Rio 2,[Tronco, Nenhum])])
True                        
Todos os rios contíguos, presentes neste mapa, possuem direções opostas. 
Logo, o mapa é válido para esta função.

== Exemplo de um mapa com uma sequência de rios válida

>>> riosValido (Mapa 5 [(Rio 4, [Nenhum, Carro]), 
                        (Rio (-4),[Nenhum, Tronco]), 
                        (Relva, [Nenhum, Arvore, Arvore, Tronco]), 
                        (Rio (-1),[Nenhum, Tronco]), 
                        (Rio (-2),[Tronco, Nenhum])])
False      
Podemos observar rios contíguos, neste mapa, com a mesma direção, pois possuem o mesmo sinal (negativo). 
Logo, o mapa é inválido para esta função.
-}

riosValido :: Mapa -- ^ Mapa a avaliar
             -> Bool -- ^ Verificação de rios contíguos possuirem sempre direções opostas.
riosValido (Mapa _ []) = True
riosValido (Mapa l ((Rio v1, (o1)):(Rio v2, (o2)): ys))
  | (v1 >0 && v2 <0) || (v1 <0 && v2 >0)  = True && riosValido (Mapa l ((Rio v2, (o2)): ys))
  | otherwise = False
riosValido (Mapa l ((Rio v, (o)): ys)) = riosValido (Mapa l ys)
riosValido (Mapa l ((Estrada v, (o)): ys)) = riosValido (Mapa l ys)
riosValido (Mapa l ((Relva, (o)): ys)) = riosValido (Mapa l ys)

{-| A função 'obstaculoComprimento' verifica se o comprimento máximo dos troncos é 5 unidades, se o comprimento máximo dos carros é 3 unidades e se em qualquer linha existe, no mínimo, um obstáculo do tipo Nenhum.

== Exemplo de um mapa com sequências de obstáculos com comprimentos adequados e que possuem o obstáculo Nenhum

>>> obstaculoComprimento (Mapa 5 [(Estrada 4, [Nenhum, Carro]), 
                                 (Rio (-4), [Nenhum, Tronco, Tronco, Tronco, Tronco, Tronco]), 
                                 (Relva, [Nenhum, Arvore, Arvore, Tronco]), 
                                 (Rio (-1),[Nenhum, Tronco]), 
                                 (Rio (-2),[Tronco, Nenhum])])
True                        
Este mapa têm sequências de obstáculos que não excedem os valores estabelecidos, tal como possui em cada linha o obstáculo Nenhum.
Logo, o mapa é válido para esta função.

== Exemplos de mapas com sequências de obstáculos com comprimentos inadequados e que não possuem o obstáculo Nenhum, respetivamente

>>> obstaculoComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro]), 
                                  (Rio (-4),[Nenhum, Tronco,Tronco, Tronco, Tronco, Tronco, Tronco]), 
                                  (Relva, [Nenhum, Arvore, Arvore, Tronco]), 
                                  (Rio (-1),[Nenhum, Tronco]), 
                                  (Rio (-2),[Tronco, Nenhum])])
False           
Este mapa possui uma sequência de troncos que ultrapassada o comprimento máximo estabelecido. 
Logo, o mapa é inválido para esta função.

>>> obstaculoComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro]), 
                                  (Rio (-4),[Nenhum, Tronco,Tronco, Tronco, Tronco, Tronco, Tronco]), 
                                  (Relva, [Nenhum, Arvore, Arvore, Tronco]), 
                                  (Rio (-1),[Nenhum, Tronco]), 
                                  (Rio (-2),[Tronco, Tronco])])
False
Este mapa possui uma sequência de obstáculos sem o obstáculo Nenhum, desrespeitando um critério estabelecido. 
Logo, o mapa é inválido para esta função.

-}

obstaculoComprimento :: Mapa -- ^ Mapa a avaliar
                      -> Bool -- ^ Verificação do comprimento máximo dos troncos e dos carros, tal como a existência de obstáculos do tipo nenhum em cada linha
obstaculoComprimento (Mapa _ []) = True 
obstaculoComprimento (Mapa l ((t, (o)): ys)) 
  | (0 < x && x <= 5) && (0 < y && y <= 3) && (count_maxSeq Nenhum o >= 1) = True && obstaculoComprimento (Mapa l ys)
  | otherwise = False 
      where x = count_maxSeq Tronco o
            y = count_maxSeq Carro o

{-| Para a elaboração da função o'bstaculoComprimento', foi necessária a elaboração de uma função euxiliar, 'count_maxSeq', que conta a maior sequência de um determiando elemento numa lista.-}
count_maxSeq :: Eq a => a -> [a] -> Int  
count_maxSeq f l = countmax f l 0 0
    where      
       countmax :: Eq a => a -> [a] -> Int -> Int -> Int
       countmax f [] i max = (if i > max then i else max)
       countmax f (x:xs) i max 
            | f == x = countmax f xs (i+1) max
            | otherwise = countmax f xs 0 (if i > max then i else max)

{-| A função 'larguraComprimento' verifica se o comprimento da lista de obstáculos de cada linha corresponde exatamente à largura do mapa.

== Exemplo de um mapa cujo comprimento da lista de obstáculos é igual à largura

>>> larguraComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), 
                                (Rio (-4),[Nenhum, Tronco,Tronco, Tronco, Tronco])])
True
Este mapa possui uma largura de 5 unidades e sequências com o mesmo número de obstáculos. 
Logo, o mapa é válido para esta função.

== Exemplo de um mapa cujo comprimento da lista de obstáculos não é igual à largura

>>> larguraComprimento (Mapa 5 [(Rio 4, [Nenhum, Carro, Nenhum, Carro]), 
                                 (Rio (-4),[Nenhum, Tronco,Tronco, Tronco])])
False
Este mapa possui uma largura de 5 unidades e um número inferior de obstáculos na mesma linha. 
Logo, o mapa é válido é inválido para esta função.
-}

larguraComprimento :: Mapa -- ^ Mapa a avaliar
                    -> Bool -- ^ Verificação do comprimento da lista de obstáculos de cada linha corresponder à largura do mapa 
larguraComprimento (Mapa l []) = True
larguraComprimento (Mapa l ((t, (o)): ys)) 
  | l == length o = True && larguraComprimento (Mapa l ys)
  | otherwise = False

{-| A função 'terrenoValida' verifica se, contiguamente, não existem mais do que 4 rios, nem 5 estradas ou relvas.

== Exemplo de um mapa com uma sequência de terrenos válida

>>> terrenoValida (Mapa 5 [(Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), 
                           (Rio (-4),[Nenhum, Tronco,Tronco, Tronco]), 
                           (Rio 4, [Nenhum, Carro, Carro, Nenhum, Carro]), 
                           (Rio (-4),[Nenhum, Tronco, Tronco, Tronco]),
                           (Estrada 2 [Carro, Carro, Carro, Nenhum])])
True
Este mapa possui uma quantidade de sequẽncias de terrenos contíguos que não excedem os valores estabelecidos. 
Logo, o mapa é válido para esta função.

== Exemplo de um mapa com uma sequência de terrenos inválida

>>> terrenoValida (Mapa 5 [(Estrada 3, [Nenhum, Carro]), 
                           (Rio 4,[Nenhum, Tronco]), 
                          (Rio 2, [Nenhum, Arvore, Arvore, Nenhum]), 
                          (Rio 2, [Nenhum, Tronco]), 
                          (Rio 4, [Tronco, Tronco, Nenhum]), 
                          (Rio 2, [Tronco, Nenhum])])
False
Este mapa possui uma quantidade de rios contíguos que excedem os valores estabelecidos. 
Logo, o mapa é inválido para esta função.
 -}

terrenoValida :: Mapa -- ^ Mapa a avaliar
                -> Bool -- ^ Verificação da não existência de mais do que 4 rios, nem 5 estradas ou relvas contíguos.
terrenoValida (Mapa l []) = True
terrenoValida  (Mapa l xs) 
  | ((contaRios (Mapa l xs) 0 0) <= 4) && ((contaEstradas (Mapa l xs) 0 0) <= 5) && ((contaRelva (Mapa l xs) 0 0) <= 5)  = True 
  | otherwise = False 
      
{-| Para a elaboração da função 'terrenoValida', foi necessário o desenvolvimento da função auxiliar 'contaRios', que conta a maior sequência de rios seguidos numa lista.-}
contaRios :: Mapa -> Int -> Int -> Int
contaRios (Mapa l []) i max = (if i > max then i else max)
contaRios (Mapa l ((Rio v1, (o1)):(Rio v2, (o2)): ys)) i max = contaRios (Mapa l ((Rio v2, (o2)): ys)) (i+1) max
contaRios (Mapa l ((Rio v, (o)): ys)) i max = contaRios (Mapa l ys) (i+1) (if (i+1) > max then (i+1) else max)
contaRios (Mapa l ((Estrada v, (o)): ys)) i max = contaRios (Mapa l ys) 0 max
contaRios (Mapa l ((Relva, (o)): ys)) i max = contaRios (Mapa l ys) 0 max

{-| Para a elaboração da função 'terrenoValida', foi necessário o desenvolvimento da função auxiliar 'contaEstradas', que conta a maior sequência de estradas seguidas numa lista.-}
contaEstradas :: Mapa -> Int -> Int -> Int
contaEstradas (Mapa l []) i max = (if i > max then i else max)
contaEstradas (Mapa l ((Estrada v1, (o1)):(Estrada v2, (o2)): ys)) i max = contaEstradas (Mapa l ((Estrada v2, (o2)): ys)) (i+1) max
contaEstradas (Mapa l ((Estrada v, (o)): ys)) i max = contaEstradas (Mapa l ys) (i+1) (if (i+1) > max then (i+1) else max)
contaEstradas (Mapa l ((Rio v, (o)): ys)) i max = contaEstradas (Mapa l ys) 0 max
contaEstradas (Mapa l ((Relva, (o)): ys)) i max = contaEstradas (Mapa l ys) 0 max

{-| Para a elaboração da função 'terrenoValida', foi necessário o desenvolvimento da função auxiliar 'contaRelva', que conta a maior sequência de relvados seguidos numa lista.-}
contaRelva :: Mapa -> Int -> Int -> Int
contaRelva (Mapa l []) i max = (if i > max then i else max)
contaRelva (Mapa l ((Relva, (o1)):(Relva, (o2)): ys)) i max = contaRelva (Mapa l ((Relva, (o2)): ys)) (i+1) max
contaRelva (Mapa l ((Relva, (o)): ys)) i max = contaRelva (Mapa l ys) (i+1) (if (i+1) > max then (i+1) else max)
contaRelva (Mapa l ((Rio v, (o)): ys)) i max = contaRelva (Mapa l ys) 0 max
contaRelva (Mapa l ((Estrada v, (o)): ys)) i max = contaRelva (Mapa l ys) 0 max




-- documentacao de n s admtir estrada sem carros