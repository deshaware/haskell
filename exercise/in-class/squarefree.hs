-- Square free number 
sqfree :: [Int] 
sqfree = [ x > 1 | x <- [1..], x*x  ]