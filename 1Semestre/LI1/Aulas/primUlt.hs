primUlt :: [Int] -> (Int,Int)
primUlt l = (head l, last l)

multiplo :: Int -> Int -> Bool
multiplo x y = mod x y == 0

