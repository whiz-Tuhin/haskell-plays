{-
    This mainly consists a few recursive functions written in order to
    think better recursively in a functional paradigm

    The recursive thinking is important in haskell in order to write concise
    programs by solving a problem by a bottom up approach by solving subproblems

-}

-- fibonacci comprehension
fibonacci :: Integer -> Integer
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n-1) + fibonacci (n-2)


maximum' :: (Ord a) => [a] -> a
maximum' xs = case xs of [] -> error "Empty list error"
                         [x] -> x
                         (y:ys) -> max y (maximum' ys)


replicate' :: Int -> a -> [a]
replicate' n var
      | n == 0 = []
      | otherwise = var : replicate' (n-1) var   -- it foes

take' :: Int -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs
