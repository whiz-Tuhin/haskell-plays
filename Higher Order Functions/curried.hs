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

multiplythree :: (Num a) => a -> (a -> (a -> a))
multiplythree x y z  = x*y*z

multiplebynine =  multiplythree 2
val = multiplebynine 3 4

-- write a compare function which takes a number and compares it to 100 -- a very basic one

comparewith100 :: (Num a, Ord a) => a -> Ordering
comparewith100 x = compare 100 x -- this is not a curried version of the function its the normal one


-- a curried version would look somewhat like

comparewith100curried :: (Num a, Ord a) => a -> Ordering
comparewith100curried = compare 100 

-- in the above case the compare function has a type of (Num a, Ord a) => a -> (a -> Ordering)
-- by passing only a single parameter we have a return of the type  (Num a, Ord a) => (a -> Ordering)
