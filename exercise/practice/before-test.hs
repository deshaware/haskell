remove3rd :: [Int] -> [Int]
remove3rd [x] = [x]
-- remove3rd [x:xs] = [x:xs]
-- remove3rd [x:xs:ys] = [x:xs]
-- remove3rd _ = []
-- remove3rd [x:xs:ys:zs] = remove3rd [x:xs:zs]

remove3rdListComp :: [Int] -> [Int]
remove3rdListComp xs = [ x | (x,i) <- zip xs [1..], i `mod` 4 /= 0 , i /= 1]


myCountDown :: Int -> [(Int, Int)]
myCountDown k   
        | k <= 0 = []
        | otherwise = helper k
        where 
            helper ::  Int -> [(Int, Int)]
            helper 0 = []
            helper 1 = [(0,0)] 
            helper k = (2*k - 2, k-1 ):helper (k-1)


myCountDownListComp :: Int -> [(Int, Int)]
myCountDownListComp k = [(2*(k-x)-2,(k-x)-1) | x <- [0..k], k-x > 0]

myCountDownListComp2 :: Int -> [(Int, Int)]
myCountDownListComp2 k = reverse [(2*x-2,x-1) | x <- [1..k]]


myCountDown3 :: Int -> [(Int,Int)]
myCountDown3 k = [ (2*(k-i), k-i) | i <- [1..k]]


pSums :: [Int] -> [Int]
pSums [a] = [a]
pSums (x:xs) = x:map (+ x) (pSums xs)


-- 1 generate a list of non-prime numbers
factors :: Int -> [Int]
factors k = [ x | x <- [1..k], k `mod` x == 0] 

nonPrimes :: [Int]
nonPrimes = [x | x <- [1..], length (factors x) > 2 ]

kthComposite :: Int -> Int 
kthComposite k = head [x | (i,x) <- zip [1..] nonPrimes, i == k]

altMap :: (a->b) -> (a->b) -> [a] -> [b]
altMap f g [] = []
altMap f g (x:xs) = f x : altMap g f xs

combine :: Num a => (a -> a) -> (a -> a) -> (a -> a)
combine f g x = 2 * f x + 3 * g x 

