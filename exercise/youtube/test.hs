-- import System.IO
-- import Data.List
a = 9 :: Int
sqrtOf = sqrt (fromIntegral a)

-- sorted :: [Int]
-- sorted = sort [9,13,4,5]

biggerThan5 = filter (>5) [2..10]

evensUpto20 = takeWhile (<= 20) [2,4..]

multOfList = foldl (**) 2 [2,3]

folderUse = foldl (+) 1 [2,3,4]
