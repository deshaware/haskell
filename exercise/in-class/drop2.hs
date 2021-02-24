drop2 :: Int -> [a] -> [a]
drop2 0 [] = []
drop2 0 (x:xs) = x:xs
drop2 n [] = []
drop2 n (x:xs) = drop2 (n-1) xs