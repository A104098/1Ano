--module questoes50pt2 where
import Data.Char

retorna2 :: Eq a => [a] -> [a] -> [a] 
retorna2 l [] = l
retorna2 [] l = []
retorna2 l (h:t) = retorna2 (apaga h l) t

apaga :: Eq a => a -> [a] -> [a]
apaga _ [] = []
apaga a (h:t) 
 | a == h = t 
 |otherwise = h : apaga a t  

--2.a)

removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet b [] = []
removeMSet b ((h,c):t)
 | b == h = if c == 1 then t else (h,c-1) : t
 | otherwise = (h,c) : removeMSet b t

--ficha 2: entender "filter"

--a)
soDigitios :: [Char] -> [Char]
soDigitios = filter (`elem` ['0'..'9']) 


--b)
minusculas :: [Char] -> Int
minusculas [] = 0
minusculas (c:t) = if c `elem` ['a'..'z'] then 1 + minusculas t 
                                          else minusculas t 

--c)
nums :: String -> [Int]
nums [] = []
nums (h:t) = if isDigit h == True then digitToInt h : nums t else nums t
 --isDigit ve se é digito // digitToInt transforma Char em Int.

--prontos para de engonhar e faz as 50 perguntas
--2.
enumFromThenTo1 :: Int -> Int -> Int -> [Int]
enumFromThenTo1 a b c 
 | b-a < c-b = a : enumFromThenTo1 b (b+(b-a)) c 
 | b-a > c-b = a : enumFromThenTo1 b (b+(c-b)) c
 | otherwise = []

--3.
sumas :: [a] -> [a] -> [a]
sumas [] l = l
sumas [] [] = []
sumas (h:t) l = h : sumas t l

--4.
posititi :: [a] -> Int -> a
posititi (h:t) 0 = h 
posititi (h:t) x = posititi t (x-1)

--5.
reverso :: [a] -> [a]
reverso [] = []
reverso l = last l : reverso (init l)

--6.
takethemmf :: Int -> [a] -> [a] 
takethemmf x [] = []
takethemmf x (h:t)
 | x < 0 = []
 | x == 0 = []
 |otherwise = h : takethemmf (x-1) t 

--36.
preCrescente :: Ord a => [a] -> [a]
preCrescente [] = []
preCrescente [a] = [a]
preCrescente (h:c:t) = if c >= h then h : preCrescente (c:t)
                       else [h]

--33.
unliness :: [String] -> String 
unliness [] = ""
unliness (h:t) = h ++ "\n" ++ unliness t 

--40.
converteMSet :: [(a,Int)] -> [a]
converteMSet [] = []
converteMSet ((a,b):t)
 | b==1 = a : converteMSet t  
 | otherwise = a : converteMSet ((a,b-1) : t)

--arvores binarias

data BTree a = Empty | Node a (BTree a) (BTree a) deriving Show
--altura :: BTree a -> Int 
--altura Empty = 0
--altura Node a b c = (1 + altura b) (1 + altura c) 


contaNodos :: BTree a -> Int 
contaNodos Empty = 0
contaNodos a b c = 1 + contaNodos b + contaNodos c