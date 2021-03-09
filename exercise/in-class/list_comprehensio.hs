aa = [x^2 | x <- [1..4]]

firsts :: [(a,b)] -> [a]
firsts ps = [x | (x,_) <- ps]

concat2 :: [[a]] -> [a]
concat2 xss = [x | xs <- xss, x <- xs]

factors :: Int -> [Int]
factors n = [ x | x <- [1..n], n `mod` x == 0]

isprime :: Int -> Bool 
isprime n = n > 1 && ( factors n == [1,n])

primes :: [Int]
primes = [p | p <- [2..], isprime p]

firstkprimes :: Int -> [Int]
firstkprimes n = take n primes