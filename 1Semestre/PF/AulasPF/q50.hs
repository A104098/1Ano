pre2 :: [a] -> Int -> a
pre2 (h:_) 0 = h
pre2 (_:t) n = pre2 t (n - 1) 