{-
  In the pattern matching we talk about the basic patterns that the data should conform to in order 
  for us to write functions for specific cases
-}

-- The checking is done top down 
checkNum :: (Integral a) => a -> [Char]
checkNum 9 = "The number is checked"   -- This is the base case which is checked first, specific for the number 9
checkNum x = "The number is not checked" -- This is the general case which is checked if the base case is not satisfied

{-
  We can write many such cases one after the other, BUT ORDER OF WRITING SHOULD BE IN THE ORDER IN WHICH WE WANT IT TO BE 
  EXECUTED.
-}
-- the order of writing matters will be shown below 

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)  -- first recursive definition

-- if we want to calculate factorial(2) it goes like ==> 2 * factorial(1) ==> 2 * 1 * factorial (0) //base case exceuted here
-- had we not written the base case above the CATCH-ALL-IN-ONE case it would be a non-terminating expression







