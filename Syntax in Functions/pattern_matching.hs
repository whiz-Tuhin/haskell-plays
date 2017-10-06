{-
  In the pattern matching we talk about the basic patterns that the data should conform to in order
  for us to write functions for specific cases
-}

-- In order to kind of cast of a memeber of the "Num" typeclass to "Integral" typeclass  we use the fromIntegral function
-- which can convert a Int to a more general number

val = fromIntegral (length [1,2,3,4]) + 3.2

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

-- extracting the 3rd element from a triple using pattern matching

addvectors :: (Double,Double) -> (Double,Double) -> (Double,Double)
addvectors a b = (fst a + fst b, snd a + snd b)   -- without pattern matching


vectoradd :: (Double, Double) -> (Double, Double) -> (Double, Double)
vectoradd (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
--addvector (x1,y1) (x2,y2) = (x1 + x2, y1 + y2)  -- with pattern specifying structure of teh conforming data


fst' :: (a,b,c) -> a
fst' (a,_,_) = a
snd' (_,b,_) = b
trd' (_,_,c) = c


-- Pattern matching on list comprehensions

-- new head function

head1 :: [a] -> a
head1 [] = error "Cant call on empty list"   -- here the "error" takes a string and generates a run-time error in case of haskell
                                             -- otherwise the error is displayed while compile time that a is a rigit typec
head1 (x:_) = x  -- in order for proper parsing the () has to be done


-- Pattern matching in list comprehensions
-- creating  a tell function in order to tell now many elements are there in a list supplied as an input
tell :: (Show a) => [a] -> String
tell [] = "This list is empty"
tell (x:[]) = "This list contains one element" ++ show x
tell (x:y:[]) = "This list contains 2 elements" ++  show x ++ show y
--tell (x:y:xs) = "This list is is long with first 2 elements as " ++ show x ++ show y ++ "and rest list appended as " ++ show xs
-- The last case can also be written in another format in which the input is preserved and can be used later on even though we have broken the
-- input list using pattern matching


-- HERE THE @ is known as the As-patterns which can be used to preserve the supplied input
tell mylist@(x:y:xs) = "This list is is long with first 2 elements as " ++ show x ++ show y ++ "and rest list appended as " ++ show xs ++ "With the original list as " ++ show mylist

{-
  Guards in haskell -- these are the substutute for a very big if-else construct in the imperative languages
  denoted by ( | ) , intuitively thses are the way in which a person can write that what all cases can the function cover when passed
  with an input upon the call of a function
-}

calculateBMI :: (RealFloat a) => a -> String
calculateBMI bmi
        | bmi <= 18.5 = "You are normal"
        | bmi <= 24.5 = "You are normal"
        | otherwise = "Congrats! you are a hippo!"


calculateBMI2 :: Double -> Double -> String
calculateBMI2 w h
        | w / h^2 <= 18.5 = "You are normal"
        | w / h^2 <= 24.5 = "Hey fatty!"
        | otherwise = "Hey whale!!"

-- lets write max function

max' :: (Ord a) => a -> a -> a   -- here in this case Num class constraint would not work mainly because in the Num typeclasss the GT, LT, EQ are not implemenentd
max' a b | a >= b = a | otherwise = b

-- writing a compare function

mycompare :: (Ord a) => a -> a -> String
-- mycompare a b
--       | a == b = "EQ"
--       | a < b = "LT"
--       | otherwise = "GT"

a `mycompare` b           -- backticks `bla bla ` are mainly use to define the function in an infix manner
      | a == b = "EQ"     -- while calling the function we can call it in an infix manner
      | a < b = "LT"
      | otherwise = "GT"
