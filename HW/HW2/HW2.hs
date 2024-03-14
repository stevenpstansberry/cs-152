-- CS 152
-- Boss Mode
-- Maryia Sakharava
-- Steven Stansberry

-- Question 1:
-- Function echo: list -> list
-- takes in a list of elements of artbitary type and returns new list where each
-- element is repeated twice, maintaining order 

echo:: [a] -> [a]
echo [] = [] -- if input list is empty, return an empty list
echo (x:xs) = x:x:echo xs -- when list has elements, construct a new list using first element twice alongside the recursive call to echo with the tail

-- Question 2:
-- Function wedge: arbitrary element e, list -> list
-- takes in an element, list and returns new list where
-- element is inserted between conscutive elements

wedge:: a -> [a] ->[a]
wedge n [x] = [x] -- pattern for the very last element of the list
wedge _ [] = [] -- empty list case
wedge n (x:xs) = x:n: wedge n xs -- pattern for when list has more than one element, constuct new list with x, element e, and the recursive call to wedge


-- Question 3:
-- Function addPairs: list of numbers -> list of numbers
-- takes in a list of numbers and adds consucetive elements, constructing a new list of the sums of each pair
-- last element is ignored if odd
addPairs:: Num a => [a] -> [a]
addPairs [] = [] -- empty list base case
addPairs [x] = [] -- ignore last element in odd length list by returning empty list
addPairs (x:y:rest) = x + y: addPairs rest -- and first and second element together and recursively call addPairs to the remainder of the list


-- Question 4
-- Function trailing: predicate, list -> list
-- takes in a predicate and list, returning a new list where the first elements  matcjing the
-- the criteria specified by the predicate are skipped over. List returned matches first element
-- not meeting criteria as well all subsquent elements
-- TODO
trailing:: (a -> Bool) -> [b] -> [b]
trailing _[] = []
trailing p (x:xs) = undefined -- use guards?


--Question 5
--Function shortest:  list of lists -> Maybe list
-- takes in list of lists and returns the shortest list, if it is an empty list, return Nothing
shortest :: [[a]] -> Maybe [a]
shortest [] = Nothing -- empty list base case 
shortest [x] = Just x -- if just one list in the list, return it
shortest (x:xs) = -- if the list has lists within it...
    case shortest xs of --define the call to shortest xs 
        Just currentShortest 
            | length x <= length currentShortest -> Just x -- if the length is less then previous call, return Just x to compare agsaisnt subsquent calls, Just x is now our shortest list
            | otherwise -> Just currentShortest -- the current list we are comparing agaisnt is not shortest, so we return the current shortest list.
        Nothing -> Just x -- indicates we have reached the end, and we can return Just x, since there are no more elements left to compare agaisnt


-- Question 6
-- funciton minList: two lists -> one list
-- takes in two list and returns a new list by choosing the minimum of each lists corresponding element, returns a list of length equal to the shorter list
minList:: Ord a => [a] -> [a] -> [a] -- min reqires Ord constraint
minList = zipWith min -- use partial application to compose zipWith and min. this will take in min as an argumenet to zipWith, and automatically insert the two lists we input as arguements to zipWith.

-- minList _[] = []
-- minList []_ = []
-- minList (x:xs)(y:ys) = min x y : minList xs ys



-- Question 7
-- Function shout: list of string(s) -> single string
-- takes in a list of strings/words and returns a single string where 
-- a '!' seperates words

shout:: [String] -> String
shout [] = [] -- empty list case
shout (x:xs) = x ++ "!" ++ shout xs -- when the list has elements, append '!' to each word, followed by recursive call to shout xs
--we want to use ++ since we are concatenting two list togethers, using : to construct list will result in error



--- Question 8
--- Function enhance: function a -> a
--- takes in a function as its arguement and applies its effect 3 times
enhance :: (a -> a)  -> (a -> a) -- we want to intake and return a function, since composiiton can only be applied to functions
enhance f =   (f . f).f
--the takeaway with 8 is that we compositin can only be applied to functions


-- Question 9
-- Function geoSequence: two Numeric types: a,r -> infinite list 
-- takes in two numeric types and returns infinite list reresenting geometric sequence [a,ar,ar^2 ... ar^n]
geoSequence:: Num b => b -> b -> [b]
geoSequence a r = a : geoSequenceHelper (a * r) r -- construct list with inital a, then use helper method to recursively build up list
    where --use where binding to take advantage of lazy evaluation 
        geoSequenceHelper a r = a : geoSequenceHelper (a * r) r -- recursively update previous a value by multiplying it by r and construct it to list



--Question 10
--function evaluate: Expression type -> Double
--takes in an expression type, reperesenting a math operation and returns the
--result of the operation as a double.

data Expression  = Atom Double
                 | Plus [Expression]
                 | Times [Expression]
         deriving Show 


evaluate:: Expression -> Double 
evaluate (Atom e) = e -- unwrap the atom and return it as a double
evaluate (Plus es) = foldl (+) 0 (fmap evaluate es) -- we start with 0 as an accumulator, folding the sum into that accumlator, and recursivelly using fmap on the remaining expressions
evaluate (Times es) = foldl (*) 1 (fmap evaluate es)-- we start with 1 as an accumulator, folding the product into that accumlator, and recursivelly using fmap on the remaining expressions



