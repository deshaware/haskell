
> import Prelude hiding ((^), init, (!!), (.))
> import Data.Char

> import Data.List hiding ( (!!) )

> list = [1..20]
> rev = reverse list

% > data area = Circle | Sqaure

> map2 :: (a -> b) -> [a] -> [b]
> map2 f l = [ f x | x <- l ]

Practice question 1

% > helper :: [a] -> Bool 
% > helper xs = [x | x <- xs if x == True else False] 

% by list method

% > all2            :: (a -> Bool) -> [a] -> [Bool]
% > all2 fun (x:xs) =   [ True | x <- x:xs, fun x ]


by recurrsion

% > helper :: [Bool] -> Bool 
% > helper xs =  head [ True | x <- x:xs, x]

% > allRec            :: (a -> Bool) -> [a] -> Bool
% > allRec fun []     = True
% > allRec fun x      = fun x 
% > allRec fun (x:xs) = helper [fun x : allRec (fun xs)]


insert function

> insert2        :: Ord a => a -> [a] -> [a]
> insert2 z []   = [z]
> insert2 a (x:xs) |  
>           a >= x      = x : insert2 a xs
>           | otherwise = a : (x:xs)

> isort           :: Ord a => [a] -> [a]
> isort []        = []
> isort (x:xs) = insert2 x (isort xs)

or 

> isort2        :: Ord a => [a] -> [a]
> isort2        = foldr insert [] 


> isortFoldr       :: Ord a => [a] -> [a]
> isortFoldr     = foldr insert [] 


> zip2          :: [a] -> [b] -> [(a,b)]
> zip2 _ []     = []
> zip2 [] _     = []
> zip2 (x:xs) (y:ys) = (x,y): zip2 xs ys


Multiple Recurssion

> odd2 :: [a] -> [a]
> odd2 [] = []
> odd2 (x:xs) = x : even2 xs

> even2 :: [a] -> [a]
> even2 [] = []
> even2 (_:xs) = odd2 xs

drop recrusively

> drop2        :: Eq a => a -> [a] -> [a]
> drop2 _ []   = []
> drop2 t (x:xs) | x /= t = x : drop2 t xs
>               | otherwise = drop2 t xs

drop at index

Does not work, will give it a try later

> drop3          :: Int -> [a] -> [a]
> drop3 _ []     = []
> drop3 0 xs     = xs

> drop3 n (x:y:xs) | n == 0 = y: drop3 0 xs
>                | otherwise = x: drop3 (n-1) (y:xs)

% > drop3 n (_:xs) = drop3 (n-1) xs 

> removeith     :: Int -> [a] -> [a]
> removeith n xs = [ x | (i,x) <-zip [1..] xs, i /= n ]

Exercise Chapter 6

1

> fact :: Int -> Int 
> fact 0 = 1
> fact n = n * fact (n-1)

2

> sumdown :: Int -> Int 
> sumdown 0 = 0
> sumdown n | n > 0 = n + sumdown (n-1)

3

> (^) :: Int -> Int -> Int
> _ ^ 0 = 1
> x ^ n = x * (x ^ (n-1))

> euclid :: Int -> Int -> Int
> euclid x y | x == y = y
>            | x < y = euclid x (y-x)
>            | otherwise = euclid (x-y) y

4.

> len :: [a] -> Int
> len [] = 0
> len (_:xs) = 1 + len xs

> init :: [a] -> [a]
> init lst = helper (length lst) lst 
>   where helper ::  Int -> [a] -> [a]
>         helper 1 _ = []
>         helper n (x:xs) = x: helper (n-1) xs

> and2 :: [Bool] -> Bool
> and2 lst | length lst > 0 = length [ x | x <- lst, x /= True ] == 0 | otherwise = False

Concatenate

> concat2 :: [[a]] -> [a]
> concat2 [] = []
> concat2 (x:xs) = x ++ (concat2 xs)

> concat3 :: [[a]] -> [a]
> concat3 = foldr (++) []

Replicate

> replicate2 :: Int -> a -> [a]
> replicate2 1 x = [x]
> replicate2 n x = [x] ++ replicate2 (n-1) x

!!

> (!!) :: Int -> [a] -> a

% > 0 !! [] = undefined

> 0 !! (x:xs)= x
> n !! (x:xs) | n <= len (x:xs) = ((n-1) !! xs) | otherwise = undefined

> elem2 :: Eq a => a -> [a] -> Bool
> elem2 n lst = length [ x | x <- lst, x == n] == 1

---------------------------------------------------------------------------------------------------------

Higher Order function

> add2 :: Float -> Float -> Float
> add2 = \x -> (\y -> x + y)

> filter2           :: (a -> Bool) -> [a] -> [a]
> filter2 f []      = []
> filter2 f (x:xs)  | f x = x : filter2 f xs | otherwise = filter2 f xs

> filter3           :: (a -> Bool) -> [a] -> [a]
> filter3 f lst     = [x | x <- lst, f x]

sum of the square of even integer

didn't work
% > sumsqrevn :: [Int] -> [Int]
% > sumsqrevn = helperMap helperFilt
% >           where helperFilt = filter (\x -> x `mod` 2 == 0)
% >               helperMap = map (\x -> x ** 2)

> sumsqrevn :: [Int] -> [Int]
> sumsqrevn lst = map (\x -> x ^ 2) (filter even lst)


> any2 :: Eq a => (a -> Bool) -> [a] -> Bool
> any2 f lst =  length (filter f lst) > 0


Select the elements from the list while the condition satisfies

> takeWhile2            :: Eq a => (a -> Bool) -> [a] -> [a]
> takeWhile2 f []       = []
> takeWhile2 f (x:xs)   | f x = x : takeWhile2 f xs | otherwise = takeWhile2 f []

Remove the lements from the list while they satisfy the predicate

> dropWhile2             :: Eq a => (a -> Bool) -> [a] -> [a]
> dropWhile2 f []        = []
> dropWhile2  f (x:xs)   | f x = dropWhile2 f xs | otherwise = x:xs     


Folder 

> sum2 :: [Int] -> Int
> sum2 [] = 0
> sum2 (x:xs) = x + sum2 xs

> sum3 :: Num a => [a] -> a
> sum3 = foldr (+) 0

> prod :: Num a => [a] -> a
> prod = foldr (*) 1

Composition Operator

> (.)       :: (b -> c) -> (a -> b) -> (a -> c)
> f . g    =  \x -> f ( g x)


Woth the help of the composition function, we can avoid use of paranthesis

> sumsqrevn2 :: [Int] -> Int 
> sumsqrevn2 =  sum . map (^2) . filter even 

> type Bit = Int 
> bin2int :: [Bit] -> Int
> bin2int bits = sum [w*b | (w,b) <- zip weights bits]
>               where weights = iterate (*2) 1

> int2bin :: Int -> [Bit]
> int2bin 0 = []
> int2bin n = n `mod` 2 : int2bin (n `div` 2)


Transmission 

> make8 :: [Bit] -> [Bit]
> make8 bits = take 8 (bits ++ repeat  0)

> encode :: String -> [Bit]
> encode = concat . map (make8. int2bin . ord)

Remove Duplicates

> rmdups :: Eq a => [a] -> [a]
> rmdups [] = []
> rmdups (x:xs) = x : filter (/=x) (rmdups xs)


voting result

> count :: Eq a => a -> [a] -> Int
> count x = length . filter (== x)

> result ::Ord a => [a] -> [(Int,a)]
> result lst = sort [(count v lst ,v) | v <- rmdups lst ]

> winner :: Ord a => [a] -> a
> winner = snd . last . result


> data Shape = Cicle Float | Rect Float Float

> area :: Shape -> Float
> area (Cicle r) = pi * r * r
> area (Rect x y) = x * y

new datatype

> newtype Nat = N Int
> type Nat2 = Int
> data Nat3 = N2 Int 

> data Tree a = Leaf a | Node (Tree a) a (Tree a)

> t :: Tree Int
> t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))


removes every element in the second string appeared in the first string with folder

% > rmStr :: String -> String -> String
% > rmStr a b= foldr (\x y -> [ z | z <- a, if z == x then y else x ]) [] [x | x <- b]



> rmStr2 :: String -> String -> String
> rmStr2 a b =  [x =/ y | x <- b, y <- a ]



