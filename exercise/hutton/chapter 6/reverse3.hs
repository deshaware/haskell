reverse3 :: [a] -> [a]
reverse3 [] = []
reverse3 (x:xs) = reverse3 xs ++ [x]