{- Tupels are of a type in itself
    If we say a list of numbers, it is a LIST of numbers, LIST is its type, but thats not the case with tuples
    In case of tuples,
    1. Non homogenoues
-}

{-
    We need to use tuples only when we are sure about how many elements we want to include in the tuple as the tuples are a data type per se with respect
    to the number of quantities or the types of quantities in it.

    for eg. a tuple of form (a,b) :: (Num t,Num t1) => (t,t1) & (a,b,c) :: (Num t, Num t2, Num t3) => (t,t1,t2); are 2 different types in itself same with tuples
            containing 2 different types
-}

{-
  In order to perform operations on tuples in haskell we have 2 functions which enable us to access the first and the second element of the tuple

  fst and snd

-}

tup = (1,2)
fst tup
snd tup
