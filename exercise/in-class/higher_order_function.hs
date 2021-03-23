
hqre :: (a -> a) -> [a] -> [a]
hqre  = map 


threetimes ::  (a -> a) -> a -> a
threetimes f x = f ( f  x)