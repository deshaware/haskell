dummy1 :: [Bool] -> [Bool]
dummy1 x = x

nums :: [[Int]] -> [Int]
takes :: [Int] -> [Int]
takes x = x
nums (x:xs) = takes x
