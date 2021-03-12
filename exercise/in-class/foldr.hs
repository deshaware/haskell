length1 :: [a] -> Int 
length1 = foldr (\ _ n -> 1 + n) 0

product1 :: [Int] -> Int
product1 = foldr (\ x y -> x * 2 ) 1