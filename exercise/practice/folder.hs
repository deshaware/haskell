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


-- Define length  using folder

len :: [a] -> Int
len = foldr (\x y -> y + 1) 0

len2 :: [a] -> Int
len2 = foldl (\y x -> y + 1) 0 

minList :: [Int] -> Int
minList = foldl1 (\x y -> if x < y then x else y)


minList2 :: [Int] -> Int
minList2 = foldr1 (\x y -> if x < y then x else y)

rev :: [a] -> [a]
rev = foldl (\x y -> y:x) []


rev2 :: [a] -> [a]
rev2 = foldl (flip (:)) []