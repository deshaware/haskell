tuples :: [Int] -> [(Int, Int)]
tuples = zip [1..]

getCount :: [(Int, Int)] -> Int -> Int
getCount x a = length [ a | (i,j) <- x, j == a ]

-- removeAt :: [(Int, Int)] -> Int -> [Int]
-- removeAt x a = [ a | (i,j) <- x, i /= a ]

removeGreater1 :: [(Int, Int)] -> [Int]
removeGreater1 lst = [j | (i,j) <- lst, i == 1] 

nub :: [Int] -> [Int]
nub x = removeGreater1 processed 
    where
        newList = tuples x
        processed = [ (getCount newList j, j) | (i, j) <- newList]


nub2 :: (Eq a) => [a] -> [a]
nub2 [] = []
nub2 (x:xs)
    | x `elem` xs = nub2 xs
    | otherwise   = x : nub2 xs

isAsc :: [Int] -> Bool 
isAsc [] = True
isAsc [_] = True
isAsc (x:y:xs) 
    | y > x     = isAsc xs
    | otherwise = False