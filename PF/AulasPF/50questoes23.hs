
--1)
enumFromto1 :: Int -> Int -> [Int]
enumFromto1 x y 
    | x>y = []
    | x==y = [x]
    | otherwise = x: enumFromto1 (x+1) y



--3)
sumas :: [a] -> [a] -> [a]
sumas [] l = l 
sumas (h:t) l = h : sumas t l

--4)
eelem :: [a] -> Int -> a
eelem (h:_) 0 = h
eelem (_:t) n = eelem t (n - 1)

--5)
reverse1 :: [a] -> [a] 
reverse1 [] = []
reverse1 (h:t) = reverse1 t ++ [h]

--6)
take2 :: Int -> [a] -> [a]
take2 n [] = []
take2 n (h:t)
    | n <= 0 = []
    | otherwise = h : take2 (n-1)t

--7)
drop2 :: Int -> [a] -> [a]
drop2 n [] = []
drop2 n (h:t)
    | n <= 0 = (h:t)
    | otherwise = drop2 (n-1) t


--8)
ziip :: [a] -> [b] -> [(a,b)]
ziip [] _ = []
ziip _ [] = []
ziip (h:t) (x:xs) = (h,x) : ziip t xs

--9)
replicate3 :: Int -> a -> [a]
replicate3 0 x = []
replicate3 n x 
    | n < 0 = []
    | otherwise = (x : replicate3 (n-1) x)

--10)
intersperse2 :: a -> [a] -> [a]
intersperse2 n [] = []
intersperse2 n [h] = [h] 
intersperse2 n (h:t) = h : n : intersperse2 n t

--12)
concaat :: [[a]] -> [a] 
concaat [] = []
concaat (h:t) = h ++ concaat t

--13)
initss :: [a]  -> [[a]] 
initss [] = [[]]
initss l = initss (init l) ++ [l]

--14)
tailss :: [a] -> [[a]] 
tailss []  = [[]]
tailss l = (l: tailss ( tail l) )

--15)
headss :: [[a]] -> [a] 
headss [] = []
headss ([] : t) = headss t
headss (h:t) = (head h : headss t)

--16)
totale :: [[a]] -> Int 
totale [] = 0 
totale (h:t) = length h + totale t

--17) 
fun1 :: [(a,b,c)] -> [(a,c)]
fun1 [] = []
fun1 ((a,b,c) : t) = ((a,c) : fun1 t )


--18)
cola3 :: [(String,b,c)] -> String
cola3 [] = ""
cola3 ((a,b,c):t) = a ++ cola3 t

--19)
idadee :: Int -> Int -> [(String,Int)] -> [String]
idadee x y [] = []
idadee x y ((a,n):t) 
    | x - n <= y = ( a : idadee x y t) 
    |otherwise = idadee x y t

--20)
powerEnumFromy :: Int -> Int -> [Int]
powerEnumFromy n 1 = [1]
powerEnumFromy n m 
    | m > 1 = powerEnumFromy n (m - 1) ++ [n^(m-1)]
    | m < 1 = [] 


 -- 21) 
isPrime1 :: Int -> Bool
isPrime1 n 
     | n == 2 = True
     | n > 2 = isPrimesub n 2 
     | otherwise = error "Nao pertence ao dominio da funcao" 
     where isPrimesub :: Int -> Int -> Bool
           isPrimesub n m 
               | (m^2) > n = True
               | mod n m == 0 = False 
               | otherwise = isPrimesub n (m+1)


 --22) 
isPrefixOf1 :: Eq a => [a] -> [a] -> Bool
isPrefixOf1 [] l = True
isPrefixOf1 l [] = False
isPrefixOf1 (h:t) (h2:t2) = h == h2 && isPrefixOf1 t t2

--23) mhepy
isSuffixOf1 :: Eq a => [a] -> [a] -> Bool 
isSuffixOf1 [] l = True
isSuffixOf1 l [] = False
isSuffixOf1 (h:t) (h2:t2) = (h:t) == (h2:t2) || isSuffixOf1 (h:t) t2

--24)
isSubsequenceOf9 :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf9 _ [] = False
isSubsequenceOf9 [] _ = True
isSubsequenceOf9 (h:t) (h2:t2) = (h == h2 && isSubsequenceOf9 t t2) || isSubsequenceOf9 (h:t) t2

--25)??
elemIndicess :: Eq a => a -> [a] -> [Int] 
elemIndicess _ [] = []
elemIndicess x (h:t)
    | x == h = 0 : map (+1) (elemIndicess x t)
    | otherwise = map (+1) ( elemIndicess x t)

--26)
nubb :: Eq a => [a] -> [a]
nubb [] = []
nubb (h:t) = if h `elem` t
             then nubb t
             else (h : nubb t)

--27)
deletee :: Eq a => a -> [a] -> [a]
deletee _ [] = []
deletee x (h:t) 
     | x == h = t
     |otherwise = (h:deletee x t)

--28)
prepii :: Eq a => [a] -> [a] -> [a] 
prepii l [] = l
prepii [] l = []
prepii l (h:t) = prepii (deletee h l) t

--29)
unione :: Eq a => [a] -> [a] -> [a] 
unione l [] = l
unione (h:t) (h2:t2) 
    | elem h2 (h:t) == True = unione (h:t) t2
    | otherwise = unione (h:t) t2 ++ [h2]

--30)
intersecte :: Eq a => [a] -> [a] -> [a]
intersecte [] _ = []
intersecte (h:t) l
    | elem h l = (h : intersecte t l)
    | otherwise = intersecte t l

--31) 
inserti :: Ord a => a -> [a] -> [a]
inserti a [] = [a]
inserti x (h:t) 
    | x < h = x : h : t
    | otherwise = h : inserti x t  -- inserti 25 [1,20,30,40] = 1 : inserti 25 [20,30,40] = 1:20:inserti [30,40] =1:20:25:30:[40] = [1,20,25,30,40]


--32)
unwordss :: [String] -> String
unwordss [] = ""
unwordss (h:t) = h ++ if length (h:t) == 1
	                  then ""
	                  else " " ++ unwordss t


--33)
unliness :: [String] -> String
unliness [] = ""
unliness (h:t) = h ++ "\n" ++ unliness t


--34)pMaiore :: Ord a => [a] -> Int
--pMaiore [_] = 0

--35)
lookupp :: Eq a => a -> [(a,b)] -> Maybe b 
lookupp _ [] = Nothing
lookupp a ((e,b):t)  
	| a == e = Just b 
	| otherwise = lookupp a t 

--36)
preCrescentee :: Ord a => [a] -> [a]
preCrescentee [] = []
preCrescentee [x] = [x]
preCrescentee (h:t) | h > head t = [h] 
                    | otherwise = h:preCrescentee t


--37)
iSorto :: Ord a => [a] -> [a]
iSorto [] = []
iSorto (h:t) = inserti h (iSorto t)

--38)
menore :: String -> String -> Bool 
menore _ "" = False 
menore "" _ = True
menore (h:t) (h2:t2)
	| h < h2 = True
	| h == h2 = menore  t t2 
	| otherwise = False

--39)
--eelemMSet :: Eq a => a -> [(a,Int)] -> Bool
--eelemMSet _ [] = False
--eelemMSet a ( (x,_):xs) = a == x || eelemMSet a xs--

--40)
converteMSete :: [(a,Int)] -> [a]
converteMSete [] = []
converteMSete ((x,1):xs) = x : converteMSete xs
converteMSete ((x,n):xs) = x : converteMSete ((x,n-1) : xs)

--41)
insereMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
insereMSet x [] = [(x,1)]
insereMSet m ((x,n):xs) = if (m == x) then ((x,n+1):xs)
	                      else (x,n) : insereMSet m xs

--42)
removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet x [] = []
removeMSet m ((x,n):xs) 
| m==x = if n>1 then (x,n-1) : xs else xs
| otherwise (x,n): removeMSet m xs

--43)
constroiMSet :: Ord a => [a] -> [(a,Int)]
constroiMSet [] = []
constroiMSet (l:ls) = insereMSet l (constroiMSet ls)

--44)
partitionEithers :: [Either a b] -> ([a],[b])
partitionEithers [] = ([],[])
partitionEithers ((Left a):t) = (a : as,bs)
    where (as,bs) = partitionEithers t
partitionEithers ((Right b):t) = (as,b : bs)
    where (as,bs) = partitionEithers t

--45)
catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Just x:t) = x : catMaybes ms
catMaybes (Nothing:t) = catMaybes ms

--46)
data Movimento = Norte | Sul | Este | Oeste
    deriving Show

caminho :: (Int, Int) -> (Int, Int) -> [Movimento]
caminho (xi, yi) (xf, yf) 
    | xi < xf = Este : caminho (xi + 1, yi) (xf, yf)
    | xi > xf = Oeste : caminho (xi - 1, yi) (xf, yf)
    | yi < yf = Norte : caminho (xi, yi + 1) (xf, yf)
    | yi > yf = Sul : caminho (xi, yi - 1) (xf, yf)
    | otherwise = []