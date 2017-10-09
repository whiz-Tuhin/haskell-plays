merge :: (Num a, Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
      | x <= y = x : (merge xs (y:ys))
      | otherwise = y : (merge (x:xs) ys)


mergesort :: (Num a,Ord a) => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = let firsthalf = take (length xs `div` 2) xs
                   secondhalf = drop (length xs `div` 2) xs
               in  merge (mergesort firsthalf) (mergesort secondhalf)
