{-
    here we analyse the let expressions in haskell
    the syntax of let is somewhat like --

    let <binding> in <expression> ---- which is completly opposite to the where syntax in which the binding part
                                       takes place later on

    # let is an expression per se, it means that it has its own value
    # Highly local hence, cannot be used across guards unlike "where" construct
-}

val = 4*(let a = 9 in a+1) + 2

mylist = [let square x = x*x in (square 3,square 4,square 5)]

-- multiple variable bindings are also possible by using the ";" as a seperation marker

tuple = (let a = 1;b =2;c = 3 in a+b+c , let foo = "Tuhin"; bar = "Khare" in foo ++ bar)

-- pattern matching is also possible in the let expressions
-- below is an example of deconstructing a triple using a let expressions

triplesumtimes100  = (let (a,b,c) = (1,2,3) in (a+b+c))*100


-- usage of let in the list comprehension in haskell

calculateBMI :: [(Double,Double)] -> [Double]
calculateBMI xs = [bmi | (w,h) <- xs, let bmi = w / h^2]  -- defining a function inside a list comprehension using the let construct


{-

      CASE EXPRESSIONS

      case <expression> of <pattern> -> result
                           <pattern> -> result
                           <pattern> -> result


      The patter specific function declaration in haskell is a syntactic sugar for the case expressions
      The case expressions can be thought of as a replacement for the switch case construct in C/C++ or other imperative languages

-}

describelist :: [a] -> String
describelist xs = "The list is" ++ " " ++ case xs of [] -> "List is empty"
                                                     [x] -> "singleton"
                                                     ys -> "Long list"

-- cases can be used anywhere even in short expressions

getHead :: [a] -> a
getHead xs = case xs of [] -> error "Cant get for empty lists"
                        (x:_) -> x
