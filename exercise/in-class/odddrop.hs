odddrop :: [a] -> [a]
odddrop [] = []
-- odddrop (x:xs) = if x `mod` 2 == 1 then [x] ++ odddrop xs else odddrop xs
odddrop [x] = []
odddrop (x:y:zs) = (y:odddrop zs)