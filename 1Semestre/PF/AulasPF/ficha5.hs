--module ficha5 where

--1.b)

zipWithe :: (a->b->c) -> [a] -> [b] -> [c]
zipWithe f (h:t) (x:xs) = f h x : zipWithe f t xs
zipWithe _ _ _ = []

--1.c)

takewhile :: (a->Bool) -> [a] -> [a]
takewhile _ [] = []
takewhile f (h:t) = if f h then h : takewhile f t 
	                else []

--1.d)
dropwhile :: (a->Bool) -> [a] -> [a]
dropwhile  _ [] = []
dropwhile f (h:t) = if f h then dropwhile f t
                    else h:t


dropwhile' :: (a -> Bool) -> [a] -> [a]
dropwhile' _ [] = []
dropwhile' f (h:t) | f h = dropwhile' f t
                   | otherwise = t

--exame recurso
--1.
replicatee :: Int -> a -> [a]
replicatee 0 _ = []
replicatee x a 
 | x < 0 = []
 | otherwise = a : replicatee (x-1) a

--2.
intersecte :: Eq a => [a] -> [a] -> [a]
intersecte [] _ = []
intersecte (h:t) l
    | h `elem` l = h : intersecte t l
    | otherwise = intersecte t l