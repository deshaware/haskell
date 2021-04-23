\CIS 623 
Spring 2021
Test 1 solution outline

Question 1
----------

1a. (15 point)

> insertLast2      :: a -> [a] -> [a]
> insertLast2 x []     = []      --1a-i1
> insertLast2 x (y:[]) = x:y:[]  --1a-i2
> insertLast2 x (y:ys) = y:insertLast2 x ys --1a-i3




1b. (5 point)

    insertLast2 1 [2,0]
={ rewrite [2,0] as 2:[0] }
   insertLast2 1 2:[0]
={ 1a-i3}
   2:insertLast2 1 [0]
={ rewrite [0] as 0:[] }
   2:insertLast2 1 0:[]
={ 1a-i2}
   2:1:0:[]
={property of (:) operator}
   [2,1,0]



Question 2
----------

> factors   :: Int -> [Int]
> factors n =  [x | x <- [1..n], n `mod` x == 0] 

> isprime   :: Int -> Bool
> isprime n = (n > 1) && (factors n == [1,n])


> gbc   :: Int -> [(Int,Int)]
> gbc n =  [ (n1,n-n1)  | n1 <-[3..n], 
>            (isprime n1) && isprime (n-n1) && even n]  
   



Question 3
----------

> part    :: [Int] -> [([Int], [Int])]
> part []  = []
> part [_]    = []
> part (x:xs) = [ (x:rs,ts) |  (rs,ts) <- part xs] ++ [([x],xs)]





Question 4
----------

> firstpos        :: (Eq a) => (a -> a) -> (a -> a) ->[a] -> Int
> firstpos f g xs =  h [ i | (i,x) <- zip [0..] xs, f x /= g x] 
>    where
>      h    :: [Int] -> Int
>      h [] = -1
>      h (x:xs) = x 




Question 5
----------

> rinsert      :: (Ord a) =>  a -> [a] -> [a]
> rinsert x []     =  [x]
> rinsert x (y:ys) = if x <= y then y : rinsert x ys 
>                   else x : y : ys


> rsort    :: (Ord a) =>  [a] -> [a]
> rsort []     =  []
> rsort (x:xs) =  rinsert x (rsort xs)



