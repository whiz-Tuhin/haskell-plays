quicksort :: (Num a,Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
      let smallerlist = [a  | a <- xs, a <= x]
          largerlist = [a | a <- xs, a > x]
      in quicksort smallerlist ++ [x] ++ quicksort largerlist
