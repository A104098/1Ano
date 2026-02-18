module Aula2 where

somaValor :: [Int] -> Int -> [Int]
somaValor [] n = [] 
somaValor (x:xs) n = (x+n) : somaValor xs n
somaValor l n 
| == [] = []
| otherwise = (head 1 + n) : somaValor (tail l) n 

removeStr :: [String] -> Char -> [String]
[] _ = []
removeStr [] = []
removeStr (h:t) c 
| head h == c = removeStr t 
| otherwise = h : removeStr t c 

                                                               