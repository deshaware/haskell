getkeyvalue :: (Eq k) => k -> [(k,v)] -> [v]
getkeyvalue k    [] = []
getkeyvalue k ((x,y):zs) 
        | x == k  = y: getkeyvalue k zs
        | otherwise = getkeyvalue k zs
