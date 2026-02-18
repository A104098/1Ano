{- |
Module      : Tarefa2_2022li1g095
Description : Geração contínua de um mapa
Copyright   : Sara Azevedo Lopes <a104179@alunos.uminho.pt>
              Eduarda Mafalda Martins Viera <a104098@alunos.uminho.pt>

Módulo para a realização da Tarefa 2 do projeto de LI1 em 2022/23.
-}
module Tarefa2_2022li1g095 where

import LI12223
import Tarefa1_2022li1g095
import System.Random
import Data.List

{-|-A função 'estendeMapa' cria uma nova linha válida no topo de um mapa. 
-Para a elaboração desta função foram necessárias as funções auxiliares 'atualizatualizaVelocidadeEArvoresaVelocidade', 'constroiListaObstaculos', 'proximosTerrenosValidos', 'proximosObstaculosValidos' e 'validaInicioLista', cujo propósito de cada uma será explicado ao longo deste trabalho.
-Assim, observa-se que o novo mapa obtido, respeita as regras de todas as funções auxiliares referidas.
-De seguida, irá ser demonstrado um exemplo de um mapa que foi amplificado, de acordo com as funções auxiliares.

== Propriedade
prop> Assume-se que o mapa fornecido como parâmetro é valido.

prop> Esta função não permite casos em que a passagem do jogador entre árvores seja impossível. Ou seja, entre 2 linhas contíguas de relva garante-se sempre
uma alternativa de passagem.

== Exemplo de um mapa, ao qual foi acrescentada uma linha

>>> estendeMapa (Mapa 6 [(Rio 3, [Nenhum, Tronco, Tronco, Tronco, Nenhum, Tronco]), 
                         (Estrada 2, [Carro, Carro, Nenhum, Carro, Nenhum, Nenhum]), 
                         (Relva, [Arvore, Arvore, Nenhum, Nenhum, Arvore, Nenhum])]) 20
Mapa 6 [(Estrada (-4), [Nenhum, Carro, Nenhum, Nenhum, Nenhum, Carro]),
        (Rio 3, [Nenhum, Tronco, Tronco, Tronco, Nenhum, Tronco]),
        (Estrada 2, [Carro, Carro, Nenhum, Carro, Nenhum, Nenhum]),
        (Relva, [Arvore, Arvore, Nenhum, Nenhum, Arvore, Nenhum])]
-}

estendeMapa :: Mapa -- ^ Mapa ao qual se vai acrescentar uma linha
               -> Int -- ^ Inteiro aleatório que fornece pseudo-aleatoriedade à geração da nova linha
                -> Mapa -- ^ Mapa gerado
estendeMapa (Mapa l xs) al = atualizaVelocidadeEArvores (Mapa l ([(t,(o))]++xs)) al 
   where pt = proximosTerrenosValidos (Mapa l xs)
         t = if length(pt) == 3 then ((!!) pt (fst $ randomR (0,2) (mkStdGen al))) else ((!!) pt (fst $ randomR (0,1) (mkStdGen al)))
         o = constroiListaObstaculos l al (t,[]) l
         

{-| A função 'atualizaVelocidadeEArvores' permite que seja definida uma velocidade para os novos terrenos gerados.

== Propriedades
prop> Convencionou-se, valores de velocidade compreendidos entre -5 e 5, excepto 0. 
Para isto, utilizou-se o parâmetro de entrada da função principal 'estendemapa' para gerar números aleatórios no gerador /mkStdGen/. 
De seguida, recorreu-se à função /randomR/ para garantir um intervalo de valores desejados.
Foi necessário recorrer a este gerador, tal como à função referida para que a função 'atualizaVelocidadeEArvores' consiga fornecer alguma pseudo-aleatoriedade.

prop> Para rios contíguos atribui-se velocidades com sinais opostos, com o objetivo destes possuirem direções opostas.

prop> No caso do terreno ser relva, a velocidade não é atualizada.

== Exemplo
>>> atualizaVelocidadeEArvores (Mapa 3 [(Rio 0,[Tronco,Nenhum,Tronco]), 
                                (Rio (-2),[Tronco, Tronco, Nenhum]),
                                (Relva, [Arvore,Arvore,Nenhum]),
                                (Estrada 1,[Nenhum,Carro,Carro])]) 89)
Mapa 3 [(Rio 3, [Tronco, Nenhum, Tronco]),
        (Rio (-2), [Tronco, Tronco, Nenhum]),
        (Relva, [Arvore, Arvore, Nenhum]),
        (Estrada 1, [Nenhum, Carro, Carro])]
Como podemos observar, ao rio, que não possuia velocidade, foi atribuida uma velocidade aleatória, compreendida entre -5 a 5, sendo
esse valor 3.
-}

atualizaVelocidadeEArvores :: Mapa -- ^ Mapa com um terreno com uma velocidade por atribuir
                               -> Int -- ^ Inteiro aleatório que fornece pseudo-aleatoriedade à geração da nova linha
                                -> Mapa -- ^ Mapa gerado com a velocidade atualizada
atualizaVelocidadeEArvores (Mapa l ((Rio v1, (o1)):[])) al = (Mapa l ((Rio (randomRExcetoNum al (-5) 5 0), (o1)):[]))
atualizaVelocidadeEArvores (Mapa l ((Estrada v1, (o1)):[])) al = (Mapa l ((Estrada (randomRExcetoNum al (-5) 5 0), (o1)):[]))
atualizaVelocidadeEArvores (Mapa l ((Relva, (o1)): [])) al = (Mapa l ((Relva, (o1)):[])) 
atualizaVelocidadeEArvores (Mapa l ((Rio v1, (o1)): (Rio v2, (o2)): ys)) al 
  | v2 < 0 = (Mapa l ((Rio (fst $ randomR (1,5) (mkStdGen (al))), (o1)): (Rio v2, (o2)): ys))  
  | v2 >= 0 = (Mapa l ((Rio (fst $ randomR (-5,-1) (mkStdGen (al))), (o1)): (Rio v2, (o2)): ys))  
atualizaVelocidadeEArvores (Mapa l ((Rio v1, (o1)): (Estrada v2, (o2)): ys)) al = (Mapa l ((Rio (randomRExcetoNum al (-5) 5 0), (o1)): (Estrada v2, (o2)): ys)) 
atualizaVelocidadeEArvores (Mapa l ((Rio v1, (o1)): (Relva, (o2)): ys)) al = (Mapa l ((Rio (randomRExcetoNum al (-5) 5 0), (o1)): (Relva, (o2)): ys))
atualizaVelocidadeEArvores (Mapa l ((Estrada v, (o)): ys)) al = (Mapa l ((Estrada (randomRExcetoNum al (-5) 5 0), (o)): ys))  
atualizaVelocidadeEArvores (Mapa l ((Relva, (o1)):(Relva, (o2)):ys)) al = (Mapa l ((Relva, (garantePassagemEntreArvores o1 o2 l al)):(Relva, (o2)):ys)) -- No caso do Tereno ser Relva não atualiza a velocidade mas verifica se existe caminho de passagem, senão acerta abre uma abertura
atualizaVelocidadeEArvores (Mapa l ((Relva, (o1)):(Estrada v, (o2)):ys)) al = (Mapa l ((Relva, (o1)) :(Estrada v, (o2)):ys))
atualizaVelocidadeEArvores (Mapa l ((Relva, (o1)):(Rio v, (o2)):ys)) al = (Mapa l ((Relva, (o1)):(Rio v, (o2)):ys))

{-| Para a elaboração da função 'atualizaVelocidadeEArvores' foi necessário o desenvolvimento da função auxiliar 'garantePassagemEntreArvores'.
Esta permite a construção de uma nova linha que garanta a passagem do jogador num terreno com relva. Caso seja possível o jogador atravessar os terrenos
com relva, então a função manterá a lista dada como parâmetro.

== Exemplo

>>> garantePassagemEntreArvores [Arvore,Arvore,Nenhum] 
                                [Nenhum,Arvore,Arvore] 3 10
[Nenhum,Arvore,Nenhum]
Nesta situação, como a passagem era impossível, esta função reconstruiu a primeira linha e forneceu uma alternativa para esta.
-}

garantePassagemEntreArvores :: [Obstaculo] -- ^ Primeira linha de obstáculos
                                -> [Obstaculo] -- ^ Segunda linha de obstáculos
                                 -> Int -- ^ Largura do mapa
                                  -> Int -- ^ Inteiro aleatório que fornece pseudo-aleatoriedade à geração da nova lista
                                   -> [Obstaculo] -- ^ Lista final
garantePassagemEntreArvores [][] _ _ = []
garantePassagemEntreArvores xs ys l al
 | not (validaPassagemEntreArvores xs ys) = garantePassagemEntreArvores (constroiListaObstaculos l al (Relva,[]) l) ys l (al+100)
 | otherwise = xs

{-| Para a elaboração da função 'garantePassagemEntreArvores' foi necessário o desenvolvimento da função auxiliar 'validaPassagemEntreArvores'.
Esta recebe 2 listas de obstáculos do terreno relva e avalia se existe uma passagem possível para o Jogador.

== Exemplos

>>> validaPassagemEntreArvores [Arvore,Arvore,Nenhum] [Nenhum,Arvore,Arvore]
False
Nesta situação, não existe passagem.

>>> validaPassagemEntreArvores [Nenhum,Arvore,Nenhum] [Nenhum,Arvore,Arvore]
True
Nesta situação, existe passagem.
-}

validaPassagemEntreArvores:: [Obstaculo] -- ^ Primeira lista de obstáculos da relva
                              -> [Obstaculo] -- ^ Segunda lista de obstáculos da relva
                               -> Bool -- ^ Valida a passagem
validaPassagemEntreArvores [] [] = False 
validaPassagemEntreArvores (x:xs) (y:ys)
  | (x == Nenhum && y == Nenhum) = True
  | (x == Arvore && y == Arvore) = False || (validaPassagemEntreArvores xs ys)
  | (x == Nenhum && y == Arvore) = False || (validaPassagemEntreArvores xs ys)
  | (x == Arvore && y == Nenhum) = False || (validaPassagemEntreArvores xs ys)


{-| Para a elaboração da função 'atualizaVelocidadeEArvores', foi necessária a formulação da função auxiliar 'randomRExcetoNum'. 
Esta calcula um número aleatório entre um intervalo, excluindo o número passado como parâmetro.
No caso do cálculo da velocidade em ros e estradas pretende-se excluir o número 0 do intervalo -5 e 5.
Para que isto seja possível, utilizou-se a função /randomR/, que caso o resultado obtido seja 0, esta é invocada novamente somando 100 ao parâmetro do gerador mkStdGen. -}
randomRExcetoNum :: Int -> Int -> Int -> Int -> Int
randomRExcetoNum al x y n
  | (fst $ randomR (x,y) (mkStdGen (al))) == n = (randomRExcetoNum (al+100) x y n)
  | otherwise = (fst $ randomR (x,y) (mkStdGen (al)))

{-| A função 'constroiListaObstaculos' tem como onjetivo gerar uma nova lista válida de obstáculos, indo de acordo com a primeira tarefa.

== Exemplo 

>>> constroiListaObstaculos 3 60 (Relva, []) 3
[Arvore,Nenhum,Nenhum]

 -}

constroiListaObstaculos :: Int -- ^ Largura
                            -> Int -- ^ Inteiro aleatório que fornece pseudo-aleatoriedade à geração da nova linha
                             -> (Terreno, [Obstaculo]) -- ^ Terreno da linha a construir
                              -> Int -- ^ Condição de paragem
                               -> [Obstaculo] -- ^ Lista de obstáculos gerada
constroiListaObstaculos l al (Rio _,(o)) 0 = acertaInicioListaRio (o)
constroiListaObstaculos l al (Estrada _,(o)) 0 = acertaInicioListaEstrada (o)
constroiListaObstaculos l al (Relva,(o)) 0 = (o)
constroiListaObstaculos l al (t,(o)) i = constroiListaObstaculos l (al+100) (t,po) (i-1) ++ o
    where po = (if length aux == 2 then [(!!) aux (fst $ randomR (0,1) (mkStdGen (al)))] else aux)
          aux = (proximosObstaculosValidos l (t, (o)) i)

{-| A função 'proximosTerrenosValidos' fornece uma lista de possibilidades de terrenos válidos que podem surgir. 

== Propriedades
prop> Definiu-se que a velocidade dos terrenos gerados é 0, pois esta função auxiliar não é responsável por gerar velocidades.
prop> Definiu-se que, contiguamente, não devem existir mais do que 4 rios, nem 5 estradas ou relvas, respeitando a primeira tarefa.

== Exemplos de terrenos válidos que podem surgir

>>> proximosTerrenosValidos (Mapa 3 [(Estrada 3, [Nenhum, Tronco, Tronco]), 
                                     (Rio 4, [Nenhum, Tronco, Nenhum]), 
                                     (Rio (-3), [Tronco, Tronco, Nenhum]), 
                                     (Rio 3, [Tronco, Nenhum, Nenhum]), 
                                     (Relva, [Nenhum, Nenhum, Arvore])])
[Rio 0, Estrada 0, Relva]

>>> proximosTerrenosValidos (Mapa 3 [(Rio 3, [Nenhum, Tronco, Tronco]), 
                                     (Rio 3, [Nenhum, Tronco, Nenhum]), 
                                     (Rio (-3), [Tronco, Tronco, Nenhum]), 
                                     (Rio (-3), [Tronco , Nenhum, Nenhum]), 
                                     (Rio 3, [Nenhum, Nenhum, Tronco]), 
                                     (Relva, [Arvore, Nenhum, Nenhum])])
[Estrada 0, Relva]
-}

proximosTerrenosValidos :: Mapa -- ^ Mapa ao qual podem ser adicionados terrenos
                          -> [Terreno] -- ^ Lista de possíveis terrenos válidos a acrescentar ao topo do mapa
proximosTerrenosValidos (Mapa _ []) = [Rio 0, Estrada 0, Relva]
proximosTerrenosValidos (Mapa _ ((Rio _, _):(Rio _, _): (Rio _, _): (Rio _, _): ys)) = [Estrada 0, Relva]
proximosTerrenosValidos (Mapa _ ((Estrada _, _):(Estrada _, _): (Estrada _, _): (Estrada _, _): (Estrada _, _): ys)) = [Rio 0, Relva]
proximosTerrenosValidos (Mapa _ ((Relva, _):(Relva, _): (Relva, _): (Relva, _): (Relva , _):ys)) = [Estrada 0, Rio 0]
proximosTerrenosValidos (Mapa _ _) = [Rio 0, Estrada 0, Relva]

{-| A função 'proximosObstaculosValidos' fornece uma lista de possibilidades de obstáculos válidos que podem surgir. 

== Propriedade
prop> Pressupõe-se que os obstáculos são acrescentados no início da lista de obstáculos, ou seja, à esquerda.

prop> Não são geradas listas de obstáculos totalmente preenchidas por arvores, troncos, carros ou por nenhum.

prop> Se um tronco está a atrevessar um wormhole e o seu comprimento já for máximo, não se pode acrescer mais unidades do tipo tronco ao início da lista, apesar do tronco não aprensetar as 5 unidades juntas.

prop> O comprimento de uma sequência de árvores não é validado por esta função.

== Exemplos de obstáculos válidos que podem surgir

>>> proximosObstaculosValidos 5 (Estrada 3, [Carro, Carro, Nenhum, Carro])
[Nenhum]

>>> proximosObstaculosValidos 5 (Estrada 3, [Nenhum, Carro, Nenhum, Carro])
[Nenhum, Carro]
-}

proximosObstaculosValidos :: Int -- ^ Largura do mapa
                            -> (Terreno, [Obstaculo]) -- ^ Linha incompleta do mapa
                             -> Int -- ^ Posicação da lista em construção
                              -> [Obstaculo] -- ^ Lista de obstáculos válidos para continuar uma dada linha do mapa
proximosObstaculosValidos l (Rio _, (o)) i 
  | (i == 1 && not (elem Tronco (o))) = [Tronco]  
  | (i == 1 && not (elem Nenhum (o))) = [Nenhum]
  | ((i >= 1) && (l > length (o)) && (validaInicioLista Tronco 4 (o))) = [Nenhum,Tronco] 
  | otherwise = [Nenhum]                                                                      
proximosObstaculosValidos l (Estrada _, (o)) i
  | (i == 1 && not (elem Carro (o))) = [Carro]
  | (i == 1 && not (elem Nenhum (o))) = [Nenhum]
  | ((i>=1) && (l > length (o)) && (validaInicioLista Carro 2 (o))) = [Nenhum, Carro]  
  | otherwise = [Nenhum]
proximosObstaculosValidos l (Relva, (o)) i  
  | (i == 1 && not (elem Arvore (o))) = [Arvore]
  | (i == 1 && not (elem Nenhum (o))) = [Nenhum]
  | ((i>=1) && (l > length (o))) = [Nenhum, Arvore]    

{-| Para a elaboração da função 'proximosObstaculosValidos', foi necessário o desenvolvimento da função auxiliar 'validaInicioLista'.
Esta permite, na construção de uma lista da direita para a esquerda, impedir situações em que sequências seguidas excedam o comprimento máximo definido para os carros e para os troncos.-}

validaInicioLista :: Obstaculo -> Int -> [Obstaculo] -> Bool
validaInicioLista o i [] = True
validaInicioLista o i (x:xs)
  | (o == x) && (i>0) = True && validaInicioLista o (i-1) xs
  | (o /= x) && (i>0) = True
  | otherwise = False

{-| Para a elaboração da função 'constroiListaObstaculos', foi necessário o desenvolvimento da função auxiliar 'acertaInicioListaRio'.
Esta permite na construção de uma lista, da direita para a esquerda, impedir que troncos, de comprimento máximo, ao atravessar /wormholes/ aumentem o seu tamanho.-}

acertaInicioListaRio :: [Obstaculo] -> [Obstaculo]
acertaInicioListaRio (h:t) 
  | (isPrefixOf [Tronco] (h:t)) && (isSuffixOf [Tronco,Tronco,Tronco,Tronco,Tronco] (h:t)) = [Nenhum]++t
  | (isPrefixOf [Tronco,Tronco] (h:t)) && (isSuffixOf [Tronco,Tronco,Tronco,Tronco] (h:t)) = [Nenhum]++t 
  | (isPrefixOf [Tronco,Tronco,Tronco](h:t)) && (isSuffixOf [Tronco,Tronco,Tronco] (h:t)) = [Nenhum]++t
  | (isPrefixOf [Tronco,Tronco,Tronco, Tronco] (h:t)) && (isSuffixOf [Tronco,Tronco] (h:t)) = [Nenhum]++t
  | (isPrefixOf [Tronco,Tronco,Tronco, Tronco, Tronco] (h:t)) && (isSuffixOf [Tronco] (h:t)) = [Nenhum]++t
  | otherwise = (h:t)

{-| Para a elaboração da função 'constroiListaObstaculos', foi necessário o desenvolvimento da função auxiliar 'acertaInicioListaEstrada'.
Esta permite na construção de uma lista, da direita para a esquerda, impedir que carros, de comprimento máximo, ao atravessar /wormholes/ aumentem o seu tamanho.-}

acertaInicioListaEstrada :: [Obstaculo] -> [Obstaculo]
acertaInicioListaEstrada (h:t) 
  | (isPrefixOf [Carro] (h:t)) && (isSuffixOf [Carro,Carro,Carro] (h:t)) = [Nenhum]++t
  | (isPrefixOf [Carro,Carro] (h:t)) && (isSuffixOf [Carro,Carro] (h:t)) = [Nenhum]++t 
  | (isPrefixOf [Carro,Carro,Carro](h:t)) && (isSuffixOf [Carro] (h:t)) = [Nenhum]++t
  | otherwise = (h:t)