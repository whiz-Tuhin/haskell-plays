{-
    # Higher order functions are the ones which takes a function as a
      parameter and returns a function as a parameter

    Haskell is named after the logician haskell curry

    # Every function haskell function takes only 1 parameter
    # Haskell uses the concept of curried functions in order to implement
      functions in multiple variables
-}

max' :: (Num a, Ord a) => a -> (a -> a)
max' a b
  | a <= b = b
  | otherwise = a

-- these are the examples of the curried functions

-- Higher order functions
