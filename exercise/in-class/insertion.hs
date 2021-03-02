insert :: (Ord a) => a -> [a] -> [a]
insert x []     = [x]
insert x (y:ys)  
    | x <= y    = x:y:ys
    | otherwise = y: insert x ys

isort :: (Ord a) => [a] -> [a]
isort []      = []
isort (x:xs)  = insert x (isort xs)

isort1 :: (Ord a) => [a] -> [a]
isort1 []      = []
isort1 (x:xs)  = insert1 x (isort1 xs)
    where 
        insert1 x []     = [x]
        insert1 x (y:ys)  
            | x <= y    = (x:y:ys)
            | otherwise = y:(insert x ys)

msort :: (Ord a) => [a] -> [a]
msort []        = []
msort [x]       = [x]
msort xs    = merge ( msort left) (msort right)
    where
        left = take ((length xs) `div` 2) xs
        right = drop ((length xs) `div` 2) xs

merge :: (Ord a) => [a] -> [a] -> [a]
merge [] lst    = lst
merge lst []    = lst
merge (x:xs) (y:ys) 
    | x < y     = x : (merge xs (y:ys))
    | otherwise = y : (merge (x:xs) ys)
