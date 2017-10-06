-- here we explain the where construct in haskell which is mainly used to store intermediate
-- computations in haskell

-- in the previous calculateBMI function we will use where

calculateBMI :: Double -> Double -> String
calculateBMI w h
        | bmi <= 18.5 = "Hey thinny!"    -- we are using bmi the whole time
        | bmi <= 24.5 = "Hey fatso!"
        | bmi <= 30.0 = "Hey elephant!"
        | otherwise = "Hey whale!"
        where bmi = w / h^2             -- binding is happening at the end of the function

-- since the values like 18.5 etc are constants and are metrics and fixed values wer can us where to rename
-- them as well

calculateBMI2 :: Double -> Double -> String
calculateBMI2 w h
        | bmi <= thinny = "Hey thinny!"
        | bmi <= fatso  = "Hey fatso!"
        | bmi <= hippo = "Hey hippo!"
        | otherwise = "Hey whale"
        
        where bmi  = w / h^2
              thinny = 18.5
              fatso = 24.5
              hippo = 30.0

-- where construct can also be used for pattern matching schemes
-- the alternate version for the calculateBMI2 can also be wriiten as
calculateBMI2 w h
        | bmi <= thinny = "Hey thinny!"
        | bmi <= fatso  = "Hey fatso!"
        | bmi <= hippo = "Hey hippo!"
        | otherwise = "Hey whale"
        where bmi  = w / h^2
              (thinny, fatso, hippo) = (18.5, 24.5, 30.0) -- tuple type matching scheme in thw where construct



{-
    PATTERN MATCHING USING WHERE CONSTRUCT IN HASKELL

    the where construct can be easily hooked up with pattern matching in haskell
    we can assign the required pattern variables using where
-}

getInitials :: String -> String -> String
getInitials firstname lastname = [f] ++ "." ++ [l]
        where (f:_) = firstname
              (l:_) = lastname


-- defining functions in where clause

listbmi :: [(Double,Double)] -> [Double]
listbmi hw = [bmi h w | (h,w) <- hw]    -- a list comprehensions for the generation of bmi list
      where bmi h w = w / h^2
