
Using library functions, define a function halve :: [a] -> ([a],[a]) that splits an evenlengthed
list into two halves. For example:
 halve [1,2,3,4,5,6]
([1,2,3],[4,5,6])

> halve :: [a] -> ([a],[a])
> halve x = splitAt meu x
>   where 
>   meu = length  x `div` 2


> third :: [a] -> a
> third x = head ( tail (tail x ))

> third1 :: [a] -> a
> third1 x = x !! 2

> third2 :: [a] -> a
> third2 (_:_:z:_) = z

3rd
Tail

> safetail :: [a] -> [a]
> safetail [] = []
> safetail (x:xs) = xs

> safetail1 :: [a] -> [a]
> safetail1 x 
>    | null x = []
>    | otherwise = tail x

> safetail3 :: [a] -> [a]
> safetail3 [] = []
> safetail3 (_:xs) = xs
