-- if any element of list is divisible by 10 print goodlist else badlist
goodlistcheck :: [Int] -> Bool
goodlistcheck [] = True
goodlistcheck (x:xs)
        | (x `mod` 10 == 0) = False && goodlistcheck(xs)
        | otherwise = True && goodlistcheck(xs)

 
goodlistdeclare :: Bool -> String
goodlistdeclare value
          | (value == True) = "Good List"
          | otherwise = "Bad List"

a = goodlistcheck [1,2,3,4]
b = goodlistcheck [1,2,3,10]

val1 = goodlistdeclare a
val2 = goodlistdeclare b
