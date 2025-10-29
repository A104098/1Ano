perimetro :: Double -> Double
perimetro r = 2*pi*r

multiplo :: Int -> Int -> Bool
multiplo x y = if mod x y == 0 then True
	else False

primUlt:: [Int] -> (Int,Int)
primUlt l = (head l, last l)

max2 :: (Int,Int) -> Int
max2 x y = if (x > y) then x && if (x < y) then y
