transfer :: ([a], [a]) -> ([a], [a])
transfer ([], ys) = ([], ys)
transfer (x:xs, ys) = transfer (xs, x:ys)