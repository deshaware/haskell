non prime number

% > f[a]ctors :: Int -> [Int]
% > factors x = [k | k <- [1..x]][x]
% > prime :: Int -> [Int]
% > prime x = [l | k <- [2..x], l <- [2..k], k `mod` l /= 0  ]

> newFst :: [a] -> [a]
> newFst [] = []
> newFst (x:xs) = [x]

> reverse2 :: [a] -> [a]
> reverse2 [] = []
> reverse2 (x:xs) = reverse xs ++ [x]

> reverse3 :: [a] -> [a]
> reverse3 (x:xs) = [x | x <- reverse3 xs]

> transfer2 :: ([a], [a]) -> ([a], [a])
> transfer2 ([], ys) = ([], ys)
> transfer2 (x:xs, ys) = transfer2 (xs, x:ys)

> reverse4 :: [a] -> [a]
> reverse4 xs = snd ( transfer2 (xs, []) )

Drop odd 

> dropodd :: [a] -> [a]
> dropodd [] = []
> dropodd [_] = []
> dropodd (x:y:ys) = y : dropodd ys

> dropodd2 :: [a] -> [a]
> dropodd2 xs = [ y | (x,y) <- zip [1..] xs, even x  ]

Get Key Value

> getkeyvalue :: Eq a => [(a,b)] -> a -> [b]
> getkeyvalue [] x = []
> getkeyvalue ((x,y):xs) a | x == a = [y] | otherwise = getkeyvalue xs a

Insertion Sort

> insert :: Ord a => a -> [a] -> [a]
> insert x [] = [x]
> insert x (y:ys) | x <= y = x : y : ys | otherwise = y: insert x ys

> isort :: Ord a => [a] -> [a]
> isort [] = []
> isort (x:xs) = insert x (isort xs)

> isort2 :: Ord a => [a] -> [a]
> isort2 = foldr insert []


> percent :: Int -> Int -> Float
> percent n m = (fromIntegral n / fromIntegral m) * 100

> count :: Eq a => a -> [a] -> Int
> count x c [] = 0
> count a (x:xs) | a == x 

