-- List comprehensions in Haskell --
-- The list comprehensions in haskell are mainly based on the on the set comprehensions in mathematics --

-- set comprehensions are something like {2*x | x E N , x <= 20} -- -- the before pipe expression is the output function the belongs part is the domain of the variable --
 																	-- the condition or the limit is the predicate --



-- Even list comprehensions in haskell are somewhat in the same way, we will use the concept of Texas Ranges also in order to set the domain of the variable --

even_natural_numbers n = [x | x <- [1..n], x `mod` 2 == 0]

-- in the above list comprehension the working is as follows -> for all elements in the range
-- 																if the predicate is satisfied
--																it writes the output function


-- SOME MORE LIST COMPREHENSIONS --

boombangs xs = [if x < 10 then "BOOM" else "BANG" | x <- xs, odd x]

-- SOMETIMES WE CAN WRITE COMPREHENSIONS WHICH CAN SATISY MULITPLE PREDICATES --

mycompre xs = [x*x | x <- xs, x /= 10,x /= 15, x /= 20]

{-
	we can also write list comprehensions which can draw items from several lists
	when we do so the compiler takes all possible combinations of the items in the list -> maps the predicate -> if satisfied writes the output by following the output function
	
	you can think of the lists as multisets while writing the list comprehension and visualise the working as follows
	
	(cartesian product is taken for all the multisets) -> (predicate is mapped for all elements of the cartesian product) -> (output function is wriiten if predicate was satisfied)
-}


-- A list comprehension using mulitple lists --

cartesian_product xs ys = [(x,y) | x <- xs,y <- ys]

cartesian_product_dim3 xs ys zs = [(x,y,z) | x <- xs, y <- ys, z <- zs] -- total elements are |xs|*|ys|*|zs|


-- We can write a length function using a list comprehension --

length' list = sum [1 | _ <- list]  {- here we have used a _ in order to say that "i dont care what element is drawn from list"
									   i just want it withdraw its just like a "for loop without the condition we just want to loop without doing any operation" -}



-- Removing the upper case alphabets --

removeUpperCase str = [s | s <- str, not (s `elem` ['A'..'Z'])]

-- NESTED LIST COMPREHENSIONS --

{-

	List comprehensions in haskell can be nested as well, inuition tells me that these nested list comprehensions are useful on structures like
	composition of list structures
	
-}


stripEven xxs = [ 
					[x | x <- xs, odd x]  
											 | xs <- xxs ]

{- being a composite structure we strip it out peice by peice first take a single list from the list of list and then for that list write the comprehension
   note the two set of sqaure brackets.

   FOOTNOTE -> you can write list comprehension across many lines, so a word of advice is to use muliple lines for longer list comprehensions

-}






