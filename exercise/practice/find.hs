
drop3          :: Int -> [a] -> [a]
drop3 _ []     = []
drop3 0 xs     = xs
drop3 n (x:y:xs) | n == 0 = y: drop3 0 xs
               | otherwise = x: drop3 (n-1) (y:xs)

