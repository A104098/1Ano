module questoes50pt2 where

--1)
enumFromTo1 :: Int -> Int -> [Int]
enumFromTo1 [] = []
enumFromTo1 x y = (x : enumFromTo1 y)